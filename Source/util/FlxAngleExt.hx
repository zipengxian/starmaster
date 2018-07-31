package util;
import flixel.util.FlxAngle;
import flixel.util.FlxPoint;

class FlxAngleExt extends FlxAngle
{
	/**
	 * Convert degrees to radians by multiplying it with this value.
	 */
	static public var TO_RAD:Float = Math.PI / 180;
	
    /**
	 * Rotates a point in 2D space around another point by the given angle.
	 * @param	X		The X coordinate of the point you want to rotate.
	 * @param	Y		The Y coordinate of the point you want to rotate.
	 * @param	PivotX	The X coordinate of the point you want to rotate around.
	 * @param	PivotY	The Y coordinate of the point you want to rotate around.
	 * @param	Angle	Rotate the point by this many degrees.
	 * @param	Point	Optional <code>FlxPoint</code> to store the results in.
	 * @return	A <code>FlxPoint</code> containing the coordinates of the rotated point.
	 */
	inline static public function rotatePoint(X:Float, Y:Float, PivotX:Float, PivotY:Float, Angle:Float, ?point:FlxPoint):FlxPoint
	{
		var sin:Float = 0;
		var cos:Float = 0;
		var radians:Float = Angle * -TO_RAD;
		while (radians < -Math.PI)
		{
			radians += Math.PI * 2;
		}
		while (radians >  Math.PI)
		{
			radians = radians - Math.PI * 2;
		}
		
		if (radians < 0)
		{
			sin = 1.27323954 * radians + .405284735 * radians * radians;
			if (sin < 0)
			{
				sin = .225 * (sin *-sin - sin) + sin;
			}
			else
			{
				sin = .225 * (sin * sin - sin) + sin;
			}
		}
		else
		{
			sin = 1.27323954 * radians - 0.405284735 * radians * radians;
			if (sin < 0)
			{
				sin = .225 * (sin *-sin - sin) + sin;
			}
			else
			{
				sin = .225 * (sin * sin - sin) + sin;
			}
		}
		
		radians += Math.PI / 2;
		if (radians >  Math.PI)
		{
			radians = radians - Math.PI * 2;
		}
		if (radians < 0)
		{
			cos = 1.27323954 * radians + 0.405284735 * radians * radians;
			if (cos < 0)
			{
				cos = .225 * (cos *-cos - cos) + cos;
			}
			else
			{
				cos = .225 * (cos * cos - cos) + cos;
			}
		}
		else
		{
			cos = 1.27323954 * radians - 0.405284735 * radians * radians;
			if (cos < 0)
			{
				cos = .225 * (cos *-cos - cos) + cos;
			}
			else
			{
				cos = .225 * (cos * cos - cos) + cos;
			}
		}
		
		var dx:Float = X - PivotX;
		// TODO: Uncomment this line if there will be problems
		var dy:Float = PivotY + Y; //Y axis is inverted in flash, normally this would be a subtract operation
		//var dy:Float = Y - PivotY;
		if (point == null)
		{
			point = new FlxPoint();
		}
		point.x = PivotX + cos * dx - sin * dy;
		point.y = PivotY - sin * dx - cos * dy;
		return point;
	}
	
	inline static public function rotateSimple(X:Float, Y:Float, PivotX:Float, PivotY:Float, Angle:Float):FlxPoint
	{
		var radians:Float = Angle * -TO_RAD;
		
		var point = new FlxPoint();
		point.x = PivotX + (X-PivotX)*Math.cos(radians)-(Y-PivotY)*Math.sin(radians);
		point.y = PivotY + (Y-PivotY)*Math.cos(radians)+(X-PivotX)*Math.sin(radians);
		return point;
	}
}
