package entity;

import flash.display.BitmapData;
import flash.display.BitmapDataChannel;
import flash.display.GradientType;
import flash.display.Shape;
import flash.filters.BlurFilter;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxCamera;
import flixel.group.FlxGroup;
import flixel.FlxG;

class LightsLayer extends FlxGroup {
	public inline static var SCALE:Float = 1/3;
	
	public var alpha:Float;
	private var _filter:BlurFilter;
	private var _matrix:Matrix;
	private var _inverseMatrix:Matrix;
	private var _point:Point;
	private var _rect:Rectangle;
	private var _pixels:BitmapData;
	private var _alphaPixels:BitmapData;
	private var _gradient:Shape;
	private var _gradientMatrix:Matrix;
	
	public function new(scale:Float = 1, alpha:Float = 1.0, blurX:Float = 8, blurY:Float = 8):Void {
		super(0);
		
		this.alpha = alpha;
		_filter = new BlurFilter(blurX, blurY);
		_matrix = new Matrix();
		_matrix.scale(Math.floor(1/scale), Math.floor(1/scale));
		_inverseMatrix = new Matrix();
		_inverseMatrix.scale(scale, scale);
		_point = new Point(0, 0);
		_rect = new Rectangle(0, 0, Math.floor(FlxG.width*scale), Math.floor(FlxG.height*scale)+1);
		_pixels = new BitmapData(Std.int(_rect.width), Std.int(_rect.height), true);
		_alphaPixels = new BitmapData(Std.int(_rect.width), Std.int(_rect.height));
		
		// vignette gradient overlay
		_gradientMatrix = new Matrix();
		_gradientMatrix.createGradientBox(_rect.height * 2, _rect.height * 2, 270 * (Math.PI/180), (_rect.height*2 - _rect.width)*-0.5);
		_gradient = new Shape();
		_gradient.graphics.beginGradientFill(GradientType.RADIAL,
			[0x000000 + Math.floor(0xff * alpha), 0x0000ff], [1, 1], [240, 255], _gradientMatrix);
		_gradient.graphics.drawRect(0, 0, _rect.width, _rect.height);
		_gradient.graphics.endFill();
		_gradient.cacheAsBitmap = true;
	}
	
	override public function draw():Void {
		if (!visible) return;
		
		if(cameras == null)
			cameras = FlxG.cameras.list;
		
		var camera:FlxCamera;
		var i : Int = 0;
		var l : Int = cameras.length;
		
		// draw masks for all the lights
		_alphaPixels.fillRect(_alphaPixels.rect, Math.floor(0xff * alpha) | 0xff000000);
		_alphaPixels.draw(_gradient);
		//if (!(FlxG.state as PlayState).gameOver) _alphaPixels.draw(_gradient);
		for (i in 0..._members.length) {
			var light:Light = cast(_members[i], Light);
			if (light.exists) light.renderInto(_alphaPixels, _inverseMatrix);
		}
		
		// blur them
		_alphaPixels.applyFilter(_alphaPixels, _alphaPixels.rect, _point, _filter);
		
		// copy it to the alpha channel
		_pixels.fillRect(_pixels.rect, 0x00000000);
		_pixels.copyChannel(_alphaPixels, _alphaPixels.rect, _point, BitmapDataChannel.BLUE, BitmapDataChannel.ALPHA);
		//getScreenXY(_point);
		_matrix.tx = FlxG.camera.x;
		_matrix.ty = FlxG.camera.y + 400;
		_point.x = _point.y = 0;
		//FlxG.buffer.draw(_pixels, _matrix);
		
		while(i < l)
		{
			camera = cameras[i++];
			
			//if(!onScreen(camera))
				//continue;
			
			//_point.x = x - Math.floor(camera.scroll.x * scrollFactor.x);
			//_point.y = y - Math.floor(camera.scroll.y * scrollFactor.y);

			//_point.x += (_point.x > 0) ? 0.0000001 : -0.0000001;
			//_point.y += (_point.y > 0) ? 0.0000001 : -0.0000001;
			//
			//_flashPoint.x = _point.x;
			//_flashPoint.y = _point.y;
			//if (facing == FlxObject.RIGHT)
			//{
				//buffer = BitmapDataUtil.flipHorizontal(buffer);
			//}
			
			//camera.buffer.draw(_pixels, _matrix);
		}		
	}
}
