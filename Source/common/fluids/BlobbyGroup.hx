package common.fluids;

import flash.display.BitmapData;
import flash.filters.BitmapFilterQuality;
import flash.filters.BlurFilter;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Dictionary;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.FlxG;

/**
 * ...
 * @author Cameron Foale
 */
class BlobbyGroup extends FlxGroup 
{
	private var _blobBuffers:Map<FlxCamera, Dynamic>;
	private var _zeroPoint:Point;
	
	private var _blobColour:Int;
	private var _blobThreshold:Int;
	
	public function new(MaxSize:Int=0, BlobColour:Int = 0xFFFF0000, BlobThreshold:Int = 0x20) 
	{
		super(MaxSize);
		
		_blobColour = BlobColour;
		_blobThreshold = BlobThreshold;
		
		_zeroPoint = new Point(0, 0);
		_blobBuffers = new Map<FlxCamera, Dynamic>();
	}
	
	public function _clearCameraBuffers():Void
	{
		for(camera in cameras)
		{
			cast(camera, FlxCamera).buffer.fillRect(camera.buffer.rect, 0x00);
		}
	}
	
	public function _createCameraData(Camera:FlxCamera):Map<String, Dynamic>
	{
		var data:Map<String, Dynamic> = new Map<String, Dynamic>();
		var filter:BlurFilter = new BlurFilter(10, 10, 3);
		var filterRect:Rectangle = Camera.buffer.generateFilterRect(Camera.buffer.rect, filter);
		//data['filter'] = filter;
		//data['rect'] = filterRect;
		data.set('filter', filter);
		data.set('rect', filterRect);
		return data;
	}
	
	public function _swapCameraBuffers():Void
	{
		for(camera in cameras)
		{
			if (! (_blobBuffers.exists(camera)))
			{
				var map = new Map<String, Dynamic>();
				map.set("buffer", new BitmapData(camera.buffer.width, camera.buffer.height, true, 0x00));
				map.set("data",  _createCameraData(camera));
				//map["buffer"] = new BitmapData(camera.buffer.width, camera.buffer.height, true, 0x00);
				//map["data"] = _createCameraData(camera);
				_blobBuffers.set(camera, map);
			}
			
			var tmpBuffer:BitmapData = cast(camera.buffer, BitmapData);
			camera.buffer = _blobBuffers[camera].get("buffer");
			_blobBuffers[camera].set("buffer", tmpBuffer);
		}
	}
	
	public function _postProcess(Camera:FlxCamera):Void
	{
		var blob:Dynamic = _blobBuffers[Camera];
		var blur:BlurFilter = blob.data.filter;
		var buffer:BitmapData = blob.buffer;
		buffer.applyFilter(buffer, buffer.rect, _zeroPoint, blur);
		buffer.threshold(buffer, buffer.rect, _zeroPoint, '>', _blobThreshold << 24, _blobColour, 0xFF000000, false);
		buffer.threshold(buffer, buffer.rect, _zeroPoint, '<', _blobThreshold << 24 , 0x0000000, 0xFF000000, false);
		Camera.buffer.copyPixels(buffer, buffer.rect, _zeroPoint, null, null, true);
	}
	
	/**
	 * Create a mashup of the FlxGroup drawing and the 
	 */
	override public function draw():Void 
	{
		// Set up which cameras to use if none are set
		if (cameras == null)
			cameras = FlxG.cameras.list;
			
		// Now, go through all of those cameras and switch them to a different screen buffer
		_swapCameraBuffers();
		
		// then empty them
		_clearCameraBuffers();
		
		// then render using the parent code
		super.draw();
		
		// then restore all the camera buffers
		_swapCameraBuffers();
		
		// and draw the new ones over the top
		for(camera in cameras)
		{
			_postProcess(camera);
		}
	}
	
}
