package common.spriterhx.starling;

import common.spriterhx.textures.ITextureAtlas;
import common.spriterhx.utils.FileFinder;
import flash.display.Bitmap;
import flash.events.Event;
import flash.filesystem.File;
import common.spriterhx.utils.URLImageLoader;

class TextureLoader
{

	static var finder : FileFinder;
	static var searchDir : File;
	static var loaders : Vector<URLImageLoader> = Vector.ofArray(cast []);
	static var loadedBitmaps : Vector<Bitmap> = Vector.ofArray(cast []);
	static var onBuildComplete : Function;
	static var _scale : Float;
	static var _includeFolderName : Bool;
	static var t : Float;
	static public var loadTime : Int;
	static var loadStartTime : Int;
	/**
	 * Loads any PNG's within the supplied directories, does not perform recursive search.
	 */	static public function loadFolders(directoryList : Vector<String>, onComplete, scale : Float = 1, includeFolderName : Bool = false) : Void
	{
		_scale = scale;
		_includeFolderName = includeFolderName;
		onBuildComplete = onComplete;
		loadStartTime = Math.round(haxe.Timer.getStamp() / 1000)();
		var i : Int = 0;
		var l : Int = directoryList.length;
		while (i < l)
		{
			var dir : File = new File(directoryList[i]);
			if (dir.isDirectory && dir.exists) 
			{
				var files : Array<Dynamic> = dir.getDirectoryListing();
				var j : Int = files.length - 1;
				while (j >= 0)
				{
					if ((files[j].type != ".png" && files[j].type != ".jpg") || files[j].isDirectory) 
					{
						
						{
							j--;
							continue;
						}

					}
					var loader : URLImageLoader = new URLImageLoader();
					loaders.push(loader);
					loader.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
					loader.loadImage(files[j].url);
					j--;
				}
			}
			i++;
		}
	}

	/**
	 * Recursively searches directory, and loads any PNG's within it
	 */	static public function load(url : String, onComplete, scale : Float = 1, includeFolderName : Bool = false) : Void
	{
		_scale = scale;
		_includeFolderName = includeFolderName;
		onBuildComplete = onComplete;
		loadStartTime = Math.round(haxe.Timer.getStamp() / 1000)();
		finder = new FileFinder();
		finder.addEventListener(Event.COMPLETE, function() : Void
		{
			var i : Int = 0;
			var l : Int = finder.fileList.length;
			while (i < l)
			{
				loaders[i] = new URLImageLoader();
				loaders[i].addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
				loaders[i].loadImage(finder.fileList[i]);
				i++;
			}
		}
);
		finder.run([url]);
		t = Math.round(haxe.Timer.getStamp() / 1000)();
	}

	static function onLoadComplete(event : Event) : Void
	{
		var loader : URLImageLoader = (Std.is(event.target, URLImageLoader));
		loader.bmpImage.name = (_includeFolderName) ? loader.folderName + "/" + loader.fileName : loader.fileName;
		loadedBitmaps.push(loader.bmpImage);
		if (loadedBitmaps.length == loaders.length) 
		{
			buildAtlas();
		}
	}

	static function buildAtlas() : Void
	{
		//Build atlas
		
		{
			var atlas : ITextureAtlas = AtlasBuilder.buildFromBitmaps(loadedBitmaps, _scale);
			//var writer:ImageWriter = new ImageWriter();
			//writer.writeJPG(AtlasBuilder.textureBitmap, File.desktopDirectory.resolvePath("textures.jpg"));
			loadedBitmaps.length = 0;
			loaders.length = 0;
			loadTime = Math.round(haxe.Timer.getStamp() / 1000)() - loadStartTime;
			trace("TextureLoader: Texture Load Complete in " + loadTime + "ms");
			if (onBuildComplete != null) 
			{
				onBuildComplete(atlas);
			}
		}

	}


	public function new()
	{
	}
}

