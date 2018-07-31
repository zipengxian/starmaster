package common.spriterhx.spriter;

import flash.xml.XML;
import haxe.xml.Fast;
import common.spriterhx.textures.ITextureAtlas;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.net.URLLoaderDataFormat;
import flash.utils.Dictionary;
import flixel.FlxSprite;
import common.spriterhx.starling.AtlasBuilder;
import common.spriterhx.utils.URLImageLoader;
import msignal.Signal;
import openfl.Assets;

class SpriterLoader
{
	var pathsByLoader : Map<URLLoader, String>;
	var namesByLoader : Map<URLLoader, String>;
	var xmlLoaders : Array<URLLoader>;
	var imageLoaders : Array<URLImageLoader>;
	var scmlByName : Map<String, Fast>;
	var pieces : Array<Bitmap>;
	#if (flash11 && starling)
	public var atlasXml : XML;
	#else
	public var atlasXml : Xml;
	#end
	var atlasBitmap : BitmapData;
	public var animationSets : Array<AnimationSet>;
	var loadQueue : String;
	var _textureScale : Float;
	public var textureAtlas : ITextureAtlas;
	public var xmlList : String;
	public var completed : Signal1<SpriterLoader>;
	var loadStart : Int;
	public function new()
	{		
		pathsByLoader = new Map<URLLoader, String>();
		namesByLoader = new Map<URLLoader, String>();
		scmlByName = new Map<String, Fast>();
		xmlLoaders = new Array<URLLoader>();
		imageLoaders = new Array<URLImageLoader>();
		animationSets = new Array<AnimationSet>();
		pieces = new Array<Bitmap>();
		completed = new Signal1(SpriterLoader);
	}
	
	public function assetsLoad(pData:String, scale:Float = 1, atlasName:String = "atlas") : Void
	{
		_textureScale = scale;
		var xml:Fast = new Fast(Xml.parse(Assets.getText(pData)));
				
		xml = xml.node.spriter_data;
		scmlByName.set(pData, xml);
		
		for (folder in xml.nodes.folder)
		{
			for (node in folder.nodes.file)
			{	
				var bitmap:Bitmap = new Bitmap(Assets.getBitmapData("assets/sprite/test/" + node.att.name));
				bitmap.name = cast(node.att.name.split(".")[0], String);
				pieces.push(bitmap);
			}
		}
		
		buildAtlas(atlasName);
	}

	public function load(sources : Array<String>, scale : Float = 1) : Void
	{
		untyped xmlLoaders.length = imageLoaders.length = 0;
		_textureScale = scale;
		loadStart = Math.round(haxe.Timer.stamp() / 1000);
		//Logger.log("[SpriterLoader] Spriter load started...", false);
		var loader : URLLoader;
		var i : Int = 0;
		var l : Int = sources.length;
		while (i < l)
		{
			//Load XML, when XML is complete, load images, when images are complete, build texture atlas, and return...
			loader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadFailed, false, 0, true);
			loader.load(new URLRequest(sources[i]));
			
			var pathChunks : Array<Dynamic> = sources[i].split("/");
			var fileName : String = pathChunks.pop().split(".")[0];
			namesByLoader[loader] = fileName;
			pathsByLoader[loader] = pathChunks.join("/");
			xmlLoaders.push(loader);

			i++;
		}
	}

	function onLoadFailed(event : IOErrorEvent) : Void
	{
		var loader : URLLoader = cast(event.target, URLLoader);
		trace("[SpriterLoader] Unable to load SCML file for: " + namesByLoader[loader]);
	}

	function onLoadComplete(event : Event) : Void
	{
		var loader : URLLoader = (cast(event.target, URLLoader));
		var xml : Fast = new Fast(Xml.parse(loader.data));
		xml = xml.node.spriter_data;
		scmlByName.set(namesByLoader[loader], xml);
		//var pieces : Fast = xml.nodes.file;
		//Load each piece
		//Remove loader from array
		//var i : Int = 0;
		//var l : Int = pieces.length();
		//while (i < l)
		//{
			//var imageLoader : URLImageLoader = new URLImageLoader();
			//imageLoader.addEventListener(Event.COMPLETE, onImageLoadComplete, false, 0, true);
			//imageLoader.addEventListener(IOErrorEvent.IO_ERROR, onImageLoadComplete, false, 0, true);
			//imageLoader.loadImage(pathsByLoader[loader] + "/" + pieces.get(i).att.name);
			//imageLoaders.push(imageLoader);
			//imageLoader.data = pieces.get(i).att.name + "";
			//i++;
		//}
		for (node in xml.node.folder.nodes.file)
		{
			var imageLoader : URLImageLoader = new URLImageLoader();
			imageLoader.addEventListener(Event.COMPLETE, onImageLoadComplete, false, 0, true);
			imageLoader.addEventListener(IOErrorEvent.IO_ERROR, onImageLoadComplete, false, 0, true);
			imageLoader.loadImage(pathsByLoader[loader] + "/" + node.att.name);
			imageLoaders.push(imageLoader);
			imageLoader.data = node.att.name + "";
		}
		
		if (Lambda.indexOf(xmlLoaders, loader) != -1) 
		{
			xmlLoaders.splice(Lambda.indexOf(xmlLoaders, loader), 1);
		}
	}

	function onImageLoadComplete(event: Event) : Void
	{
		var loader: URLImageLoader = (cast(event.target, URLImageLoader));
		if (loader.bmpImage != null && loader.bmpImage.bitmapData != null) 
		{
			loader.bmpImage.name = cast(loader.data.split(".")[0], String);
			pieces.push(loader.bmpImage);
		}
		//Remove loader from array
		if (Lambda.indexOf(imageLoaders, loader) != -1) 
		{
			imageLoaders.splice(Lambda.indexOf(imageLoaders, loader), 1);
		}
		//Check if complete
		if (imageLoaders.length == 0) 
		{
			buildAtlas("atlas");
		}
	}

	function buildAtlas(atlasName:String) : Void
	{
		textureAtlas = AtlasBuilder.buildFromBitmaps(atlasName, pieces, _textureScale, 2, 500, 500);
		atlasXml = AtlasBuilder.atlasXml;
		atlasBitmap = AtlasBuilder.atlasBitmap;
		var animation : AnimationSet;
		for (name in scmlByName.keys())
		{
			animation = new AnimationSet(scmlByName[name], _textureScale);
			animation.name = name;
			animationSets.push(animation);
		}

		completed.dispatch(this);
	}

	public function getAnimationSet(name : String) : AnimationSet
	{
		var i : Int = 0;
		var l : Int = animationSets.length;
		while (i < l)
		{
			if (animationSets[i].name == name) 
			{
				return animationSets[i];
			}
			i++;
		}
		trace("[SpriterLoader] Unable to find animation of type: '" + name + "', make sure you loaded it successfully");
		return null;
	}

	//public function getSpriterClip(name : String) : SpriterClip
	//{
		//var animation : AnimationSet = getAnimationSet(name);
		//if (animation != null) 
		//{
			//return new SpriterClip(animation, textureAtlas);
		//}
		//return null;
	//}

	public function disposeTextures() : Void
	{
		if (textureAtlas == null) 
		{
			return;
		}
		textureAtlas.dispose();
		textureAtlas = null;
	}

	//public function restoreTextures() : Void
	//{
		//textureAtlas = new TextureAtlas(Texture.fromBitmapData(atlasBitmap), atlasXml);
	//}
	
	public function getAnimation(name: String) : AnimationSet
	{
		var animation: AnimationSet = getAnimationSet(name);
		if (animation != null) 
		{
			return animation;
		}
		return null;
	}
	
	public function getTextureAtlas(): ITextureAtlas
	{
		return textureAtlas;
	}
}

