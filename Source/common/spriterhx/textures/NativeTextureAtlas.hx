package common.spriterhx.textures;
import flash.display.Bitmap;
import flash.display.IBitmapDrawable;
import flash.display.Shape;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;
import haxe.xml.Fast;
import common.spriterhx.utils.ConstValues;
import common.spriterhx.utils.DisposeUtils;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.geom.Rectangle;

/**
 * @author SlavaRa
 */
class NativeTextureAtlas implements ITextureAtlas {

	public function new(texture:Dynamic, texAtlasXml:Xml, scale:Float = 1, ?isDifferentXML:Bool) {
		helpMatrix = new nme.geom.Matrix();
		
		this.scale = scale;
		_isDifferentXML = isDifferentXML;
		
		_name2SubTexData = new Map<String, Rectangle>();
		
		if (Std.is(texture, BitmapData)) {
			bitmapData = cast(texture, BitmapData);
		} else if(Std.is(texture, MovieClip)) {
			movieClip = cast(texture, MovieClip);
			movieClip.stop();
		}
		
		parseData(texAtlasXml);
	}
	
	public var helpMatrix:Matrix;
	public var bitmapData(default, null):BitmapData;
	public var movieClip(default, null):MovieClip;
	public var scale(default, null):Float;
	
	var _name2SubTexData:Map<String, Rectangle>;
	var _isDifferentXML:Bool;
	
	public var name(default, null):String;
	
	public function dispose() {
		bitmapData = DisposeUtils.dispose(bitmapData);
		movieClip = null;
		_name2SubTexData = null;
	}
	
	public function getRegion(name:String):Rectangle {
		return _name2SubTexData.get(name);
	}
	
	inline function parseData(texAtlasXml:Xml) {
		name = texAtlasXml.firstElement().get(ConstValues.A_NAME);
		
		var scale = _isDifferentXML ? scale : 1;
		
		for (subTexXml in texAtlasXml.firstElement().elementsNamed(ConstValues.SUB_TEXTURE)) {
			var subTexName = subTexXml.get(ConstValues.A_NAME);
			var subTexData = new SubTextureData();
			
			subTexData.x = Std.parseInt(subTexXml.get(ConstValues.A_X)) / scale;
			subTexData.y = Std.parseInt(subTexXml.get(ConstValues.A_Y)) / scale;
			subTexData.width = Std.parseInt(subTexXml.get(ConstValues.A_WIDTH)) / scale;
			subTexData.height = Std.parseInt(subTexXml.get(ConstValues.A_HEIGHT)) / scale;
			
			subTexData.pivotX = Std.parseFloat(subTexXml.get(ConstValues.A_PIVOT_X));
			subTexData.pivotY = Std.parseFloat(subTexXml.get(ConstValues.A_PIVOT_Y));
			
			_name2SubTexData.set(subTexName, subTexData);
			
		}
	}
	
	public function createTextureDisplay(fullName:String, pivotX:Float = 0, pivotY:Float = 0, angle:Float = 0):Dynamic {
		var clip = movieClip;
		if ((clip != null) && (clip.totalFrames >= 3)) {
			clip.gotoAndStop(clip.totalFrames);
			clip.gotoAndStop(fullName);
			if (clip.numChildren > 0) {
				var child = clip.getChildAt(0);
				child.x = 0;
				child.y = 0;
				return child;
			}
		} else if (bitmapData != null) {
			var rect = getRegion(fullName);
			if(Std.is(rect, SubTextureData)){
				var subTexData:SubTextureData = cast(rect, SubTextureData);
				
				//if (pivotX == 0) {
					//pivotX = subTexData.pivotX;
				//}
				//if (pivotY == 0) {
					//pivotY = subTexData.pivotY;
				//}
				
				helpMatrix.identity();
				helpMatrix.scale(scale, scale);
				
				helpMatrix.tx = -subTexData.x - pivotX;
				helpMatrix.ty = -subTexData.y - pivotY;
				
				//helpMatrix.tx = -subTexData.x;
				//helpMatrix.ty = -subTexData.y;
				
				//var angle = 45;
				//if (angle != 0) 
					//helpMatrix.rotate(angle * 0.017453292519943295 * -1); // much faster than Math.PI / 180
				
				#if !js
				var shape = new Shape();
				shape.graphics.beginBitmapFill(bitmapData, helpMatrix, false, true);
				shape.graphics.drawRect(-pivotX, -pivotY, subTexData.width, subTexData.height);
				shape.graphics.endFill();
				
				//var bitmapDataTmp = new BitmapData(Std.int(shape.width), Std.int(shape.height), true, 0);
				//bitmapDataTmp.draw(shape, new Matrix(1, 0, 0, 1, pivotX, pivotY), null, null, new Rectangle(pivotX, pivotY, shape.width, shape.height));
				
				return shape;
				#else
				var bitmapDataTmp = new BitmapData(Std.int(subTexData.width), Std.int(subTexData.height), true, 0x000000);
				draw(bitmapDataTmp, bitmapData, subTexData);
				//bitmapDataTmp.draw(bitmapData, helpMatrix, null, null, new Rectangle(- pivotX, - pivotY, scale * subTexData.width, scale * subTexData.height));
				//bitmapDataTmp.copyPixels(bitmapData, subTexData, new Point(-pivotX, -pivotY), null, null, true);
				return new Bitmap(bitmapDataTmp);
				
				//var shape = new Shape();
				//shape.graphics.beginBitmapFill(bitmapDataTmp, null, false, true);
				//shape.graphics.drawRect(0, 0, subTexData.width, subTexData.height);
				//shape.graphics.endFill();
				//return shape;
				#end
			}
		}
		return null;
	}
	public function draw(target:BitmapData, source:IBitmapDrawable, rect:Rectangle, pt:Point, colorTransform:ColorTransform = null, scale:Float = 1):Void
	{
		var clipRect = new Rectangle();
		var matrix = new Matrix();
		clipRect.x = pt.x;
		clipRect.y = pt.y;
		clipRect.width = rect.width * scale;
		clipRect.height = rect.height * scale;
		matrix.tx = pt.x - rect.x;
		matrix.ty = pt.y - rect.y;
		matrix.a = matrix.d = scale; //x,y分别缩放
		target.draw(source, matrix, colorTransform, null, clipRect, false);
	}
	public function createBitmapData(fullName:String, pivotX:Float = 0, pivotY:Float = 0, angle:Float = 0):Dynamic {
		var clip = movieClip;
		if ((clip != null) && (clip.totalFrames >= 3)) {
			clip.gotoAndStop(clip.totalFrames);
			clip.gotoAndStop(fullName);
			if (clip.numChildren > 0) {
				var child = clip.getChildAt(0);
				child.x = 0;
				child.y = 0;
				return child;
			}
		} else if (bitmapData != null) {
			var rect = getRegion(fullName);
			if(Std.is(rect, SubTextureData)){
				var subTexData:SubTextureData = cast(rect, SubTextureData);
				
				//if (pivotX == 0) {
					//pivotX = subTexData.pivotX;
				//}
				//if (pivotY == 0) {
					//pivotY = subTexData.pivotY;
				//}
				
				helpMatrix.identity();
				helpMatrix.scale(scale, scale);
				
				helpMatrix.tx = -subTexData.x - pivotX;
				helpMatrix.ty = -subTexData.y - pivotY;
				
				var bitmapDataTmp = new BitmapData(cast(subTexData.width, Int), cast(subTexData.height, Int), true, 0x000000);
				bitmapDataTmp.draw(bitmapData, helpMatrix);
				
				return bitmapDataTmp;
			}
		}
		return null;
	}
}