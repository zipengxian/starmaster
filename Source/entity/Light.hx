package entity;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flixel.FlxObject;
import flixel.FlxG;

/**
 * ...
 * @author blaze
 */
class Light extends FlxObject
{
	public static var _colorTransform:ColorTransform;
	public static var _defaultShape:Shape;
	
	public var alpha:Float = 1.0;
	public var matrix:Matrix;
	public var shape:Shape;
	private var _angle:Float;
	private var _matrix:Matrix;
	private var _radians:Float;
	private var _scale:Float;
	
	public var radians(get, set):Float;
	public var scale(get, set):Float;
	
	public function new(x:Float=0, y:Float=0, scale:Float=1, alpha:Float=1, angle:Float=0, shape:Shape=null) {
		if (_colorTransform == null) {
			_colorTransform = new ColorTransform();
			_defaultShape = new Shape();
			_defaultShape.graphics.beginFill(0x000000, 1.0);
			_defaultShape.graphics.drawCircle(0, 0, 1);
			_defaultShape.graphics.endFill();
		}
		super(x, y);
		_matrix = new Matrix();
		this.alpha = alpha;
		this.angle = angle;
		this.scale = scale;
		this.shape = (shape != null) ? shape : _defaultShape;
		this.xy(x, y);
	}
	
	public function renderInto(alphaPixels:BitmapData, matrix:Matrix):Void {
		if (!visible) return;
		
		_matrix.createBox(_scale, _scale, _radians, x, y);
		if (matrix != null) _matrix.concat(matrix);
		if (alpha != 1.0) {
			_colorTransform.alphaMultiplier = alpha;
			alphaPixels.draw(shape, _matrix, _colorTransform);
		}
		else alphaPixels.draw(shape, _matrix);
	}
	
	override public function set_angle(value:Float):Float {
		_angle = value;
		return _radians = angle * (Math.PI / 180);
	}
	
	public function get_radians():Float { return _radians; }
	public function set_radians(value:Float):Float {
		_radians = value;
		return _angle = _radians * (180 / Math.PI);
	}
	
	public function get_scale():Float { return _scale; }
	public function set_scale(value:Float):Float { return _scale = value; }
	
	public function xy(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}
	
}