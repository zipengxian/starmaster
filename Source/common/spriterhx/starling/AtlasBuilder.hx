package common.spriterhx.starling;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.utils.ByteArray;
import flash.xml.XML;
import haxe.io.Bytes;
import haxe.xml.Fast;
import openfl.Assets;
import common.spriterhx.textures.ITextureAtlas;
import common.spriterhx.textures.NativeTextureAtlas;
//import common.spriterhx.textures.StarlingTextureAtlas;

import flixel.FlxG;

class AtlasBuilder
{
	static public var packTime : Int;
	static public var atlasBitmap : BitmapData;
	
	#if (flash11 && starling)
	static public var atlasXml : XML;
	#else
	static public var atlasXml : Xml;
	#end
	//public function new()
	//{
	//}

	static public function buildFromBitmaps(atlasName: String, bitmapList : Array<Bitmap>, scale : Float = 1, padding : Int = 2, width : Int = 2048, height : Int = 2048) : ITextureAtlas
	{
		var t:Int = Math.round(haxe.Timer.stamp() / 1000);
		
		var atlasBitmapExist = FlxG.bitmap.checkCache(atlasName);// Assets.exists(atlasName + '.png');
		//var atlasTextExist = Assets.exists(atlasName + '.txt');
		
		if (atlasBitmapExist == true)
		{
			atlasBitmap = FlxG.bitmap.get(atlasName).bitmap;
			//atlasBitmap = Assets.getBitmapData(atlasName + '.png');
			//var atlasText:String = Assets.getText(atlasName + '.txt');
		}
		else
		{
			atlasBitmap = new BitmapData(width, height, true, 0x0);
		}
		
		var atlasText:String = "";
		
		var packer : MaxRectPacker = new MaxRectPacker(width, height);
		var bitmap : Bitmap;
		var name : String;
		var rect : Rectangle;
		var subText : String;
		var m : Matrix = new Matrix();
		//Create XML from text (much faster than working with an actual XML object)
		var i : Int = 0;
		while (i < bitmapList.length)
		{
			bitmap = bitmapList[i];
			name = bitmapList[i].name;
			rect = packer.quickInsert((bitmap.width * scale) + padding * 2, (bitmap.height * scale) + padding * 2);
			//Add padding
			rect.x += padding;
			rect.y += padding;
			rect.width -= padding * 2;
			rect.height -= padding * 2;
			//Apply scale
			if (rect == null) 
			{
				trace("Texture Limit Exceeded");
				{
					i++;
					continue;
				}
			}
			if (atlasBitmapExist == false)
			{
				m.identity();
				m.scale(scale, scale);
				m.translate(rect.x, rect.y);
				atlasBitmap.draw(bitmapList[i].bitmapData, m, null, null, null, true);
			}
			//Create XML line item for TextureAtlas
			subText = "<SubTexture name=\"" + name + "\" " + "x=\"" + rect.x + "\" y=\"" + rect.y + "\" width=\"" + rect.width + "\" height=\"" + rect.height + "\" frameX=\"0\" frameY=\"0\" " + "frameWidth=\"" + rect.width + "\" frameHeight=\"" + rect.width + "\"/>";
			atlasText = atlasText + subText;
			i++;
		}
		atlasText = "<TextureAtlas imagePath=\"" + atlasName + ".png\">" + atlasText + "</TextureAtlas>";
		
		if (atlasBitmapExist == false)
		{
			FlxG.bitmap.add(atlasBitmap, true, atlasName);
			
			//Assets.setBitmapData(atlasName + '.png', atlasBitmap);
			//AssetCache.bitmapData.set(atlasName + '.txt', atlasText);
		}
		
		//Create the atlas
		#if (flash11 && starling)
		import common.spriterhx.textures.StarlingTextureAtlas;
		var atlasXml = new XML(atlasText);
		var texture : Texture = Texture.fromBitmapData(atlasBitmap, false);
		var atlas : StarlingTextureAtlas = new StarlingTextureAtlas(texture, atlasXml);
		#else
		var atlasXml = Xml.parse(atlasText);
		var atlas : NativeTextureAtlas = new NativeTextureAtlas(atlasBitmap, atlasXml);
		#end
		
		//Save elapsed time in case we're curious how long this took
		packTime = Math.round(haxe.Timer.stamp() / 1000) - t;
		return atlas;
	}
}

