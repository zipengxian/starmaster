package common.skeleton;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import util.FlxAngleExt;

class FlxSkeletonBone extends FlxSprite
{
	public var startPoint(get, never) : FlxPoint;
	public var endPoint(get, never) : FlxPoint;
	
	public var parent:FlxSkeletonJoint;
	public var offsetX:Float;
	public var offsetY:Float;
	public var absoluteX:Float;
	public var absoluteY:Float;
	
	private var _startPoint:FlxPoint;
	private var _endPoint:FlxPoint;
	//public var faceing:UInt;
	
	public function get_startPoint():FlxPoint { return _startPoint; }
	public function get_endPoint():FlxPoint { return _endPoint; }
	
	public function new(Width:Int = 8, Length:Int = 64, ?SimpleGraphic:Dynamic = null)
	{
		super(0, 0);
		
		if (SimpleGraphic == null)
		{
			makeGraphic(Width, Length, 0xff9999ff);
		}
		else
		{
			loadGraphic(SimpleGraphic, false, true);
		}
		
		_startPoint = new FlxPoint(Width / 2, 0);
		_endPoint = new FlxPoint(Width / 2, Length);
		angle = 0;
		offsetX = 0;
		offsetY = 0;
	}
	
	override public function update():Void
	{
		var offsetX_tmp:Float = offsetX;
		var offsetY_tmp:Float = offsetY;
		var absoluteX_tmp:Float = absoluteX;
		var absoluteY_tmp:Float = absoluteY;
		if (facing == FlxObject.LEFT)
		{
			offsetX_tmp = -offsetX;
			absoluteX_tmp = -absoluteX;
		}
		
		if (parent == null)
		{
			_startPoint = FlxAngleExt.rotatePoint(width / 2, 0, width / 2, height / 2, angle, _startPoint);
			_startPoint.x += x;
			_startPoint.y += y;
			
			_endPoint = FlxAngleExt.rotatePoint(width / 2, -height, width / 2, height / 2, angle, _endPoint);
			_endPoint.x += x;
			_endPoint.y += y;
		}
		else
		{
			FlxAngleExt.rotatePoint(width / 2, 0, width / 2 + offsetX_tmp, height / 2 + offsetY_tmp, angle, _startPoint);
			
			x = parent.endPoint.x - _startPoint.x + offsetX_tmp + absoluteX_tmp;
			_startPoint.x = parent.endPoint.x;
			y = parent.endPoint.y - _startPoint.y + offsetY_tmp + absoluteY_tmp;
			_startPoint.y = parent.endPoint.y;
			
			FlxAngleExt.rotatePoint(width / 2, -height, width / 2 + offsetX_tmp, height / 2 + offsetY_tmp, angle, _endPoint);
			_endPoint.x += x;
			_endPoint.y += y;
		}
		
		super.update();
	}
}
