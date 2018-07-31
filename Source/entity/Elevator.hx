package entity;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxObject;

class Elevator extends FlxSprite
{	
	public var moveX:Bool = false;
	public var moveY:Bool = false;
	private var startPoint:FlxPoint;
	private var endPoint:FlxPoint;
	
	public function new(X:Float, Y:Float, Width:Float, Height:Float, Speed:Int = 40)
	{
		super(X * 16, Y * 16, "assets/sprite/elevator.png");
		
		startPoint = new FlxPoint(X * 16, Y * 16);
		endPoint = new FlxPoint((X + Width) * 16, (Y + Height) * 16);
		
		if (Width > 0)
		{
			moveX = true;
			velocity.x = Speed;
		}
		
		if (Height > 0)
		{
			moveY = true;
			velocity.y = Speed;
		}
		
		immovable = true;	//We want the elevator to be "solid" and not shift during collisions
		moves = true;
		allowCollisions = FlxObject.UP;
	}
	
	override public function update():Void
	{
		super.update();
		
		//	Has platform reached the end of its movement?
		if (moveX)
		{
			if (x > endPoint.x)
			{
				//	Yes, so reverse the velocity to send it back up again
				x = endPoint.x;
				velocity.x = -velocity.x;
			}
			else if (x < startPoint.x)
			{
				//	If platform has returned to the top (start position) then reverse it
				x = startPoint.x;
				velocity.x = -velocity.x;
			}
		}
		
		if (moveY)
		{
			if (y > endPoint.y)
			{
				//	Yes, so reverse the velocity to send it back up again
				y = endPoint.y;
				velocity.y = -velocity.y;
			}
			else if (y < startPoint.y)
			{
				//	If platform has returned to the top (start position) then reverse it
				y = startPoint.y;
				velocity.y = -velocity.y;
			}
			
		}
		
	}
}
