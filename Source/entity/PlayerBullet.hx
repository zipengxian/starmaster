package entity;

import flixel.util.FlxPoint;
import flixel.FlxSprite;
import util.FlxAngleExt;

class PlayerBullet extends FlxSprite
{
	public function new()
	{
		super(0,0);
		loadGraphic("assets/sprite/bullet.png", true, true ,5 ,5);
		animation.add("idle", [0], 1, false);
		
		exists = false;
	}
	public function fire(Location:FlxPoint, Target:FlxPoint):Void
	{
		angleshoot(Location.x, Location.y, 200, Target);
		//super.reset(Location.x - width/2, Location.y - height/2);//Location.x - width/2,Location.y - height/2
		//FlxAngleExt.rotatePoint(-40, 0, 0, 0, Angle, velocity);
		//angle = Angle + 180;
		//velocity.x += velocity.x;
		//velocity.y += velocity.y;
		animation.play("idle");
		solid = true;
	}
	
	public function angleshoot(X:Float, Y:Float, Speed:Int, Target:FlxPoint):Void
	{
		super.reset(X, Y);
		
		solid = true;
		var rangle:Float = Math.atan2(Target.y - (y + (height / 2)), Target.x - (x + (width / 2)));  //This gives angle in radians
		velocity.x = Math.cos(rangle) * Speed;
		velocity.y = Math.sin(rangle) * Speed;
	}
	
	override public function update():Void
	{
		super.update();
		
		if(!alive)
		{
			exists = false;
		}			
		if(exists && !onScreen())//x > Registry.player.x + FlxG.width/2
		{
			exists = false;
		}
	}
}
