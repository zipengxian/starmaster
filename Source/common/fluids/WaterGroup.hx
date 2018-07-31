package common.fluids;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.filters.BlurFilter;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxCamera;

/**
 * ...
 * @author Cameron Foale
 */
class WaterGroup extends BlobbyGroup 
{
	private var _offset:Int = 2;
	private var _offsetPoint:Point;
	private var _highlightMatrix:Matrix;
	
	public function new(MaxSize:Int=0, BlobColour:Int=0xFFFF0000, BlobThreshold:Int = 0x20, Offset:Int = 3) 
	{
		super(MaxSize, BlobColour, BlobThreshold);
		
		_offset = Offset;
		_offsetPoint = new Point(_offset, _offset);
		
		_highlightMatrix = new Matrix();
		_highlightMatrix.translate(_offset, _offset);
	}
	
	override public function _createCameraData(Camera:FlxCamera):Map<String, Dynamic>
	{
		var obj:Map<String, Dynamic> = super._createCameraData(Camera);
		
		var filterRect:Rectangle = obj.get('rect');
		
		var highlightBuffer:BitmapData = new BitmapData(Camera.buffer.width, Camera.buffer.height, true, 0x00);
		var blurBuffer:BitmapData = new BitmapData(Std.int(filterRect.width + _offset), Std.int(filterRect.height + _offset), true, 0x00);
		
		//obj['highlightBuffer'] = highlightBuffer;
		//obj['blurBuffer'] = blurBuffer;
		obj.set('highlightBuffer', highlightBuffer);
		obj.set('blurBuffer', blurBuffer);
		return obj;
	}
	
	override public function _postProcess(Camera:FlxCamera):Void 
	{
		var blob:Dynamic = _blobBuffers.get(Camera);
		var buffer:BitmapData = blob.get("buffer");
		
		var blur:BlurFilter = blob.get("data").get("filter");
		var highlightBuffer:BitmapData = blob.get("data").get("highlightBuffer");			
		var blurBuffer:BitmapData = blob.get("data").get("blurBuffer");
		var filterRect:Rectangle = blob.get("data").get("rect");
		
		var blurBufferRect:Rectangle = new Rectangle(_offset, _offset, buffer.width, buffer.height);
		
		// create the blurred buffer
		// blurBuffer.fillRect(blurBuffer.rect, 0x00);
		blurBuffer.applyFilter(buffer, buffer.rect, _offsetPoint, blur);
		
		buffer.fillRect(buffer.rect, 0x00);
		buffer.threshold(blurBuffer, blurBufferRect, _zeroPoint, '>', _blobThreshold << 24, _blobColour, 0xFF000000, false);
		
		highlightBuffer.copyPixels(blurBuffer, blurBufferRect, _zeroPoint);
		highlightBuffer.draw(blurBuffer, _highlightMatrix, null, BlendMode.SUBTRACT);
		buffer.threshold(highlightBuffer, highlightBuffer.rect, _zeroPoint, '>', (_blobThreshold ) << 16, 0xFFFFFFFF, 0x00FF0000, false);
		
		// buffer.threshold(buffer, buffer.rect, _zeroPoint, '<', _blobThreshold << 24 , 0x0000000, 0xFF000000, false);
		Camera.buffer.copyPixels(buffer, buffer.rect, _zeroPoint, null, null, true);
	}
	
}
