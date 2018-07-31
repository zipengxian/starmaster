package entity;

import common.skeleton.VehicleSkeleton;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flash.Lib;
import flixel.util.FlxAngle;
import flixel.FlxObject;
import flixel.FlxSprite;
import common.skeleton.FlxSkeletonBone;

class Vehicle extends VehicleSkeleton
{
	inline static public var RUN_SPEED:Int = 60;
	inline static public var GRAVITY:Int = 0;
	inline static public var JUMP_SPEED:Int = 60;
	inline static public var HEALTH:Int = 1;
	inline static public var SPAWNTIME:Float = 30;
	
	private var _bulletDelay:Int;
	private var _lastFired:Int;
	
	public var bullets:PlayerBulletManger;
	
	public function new(group:FlxGroup, Scale:Float)
	{
		super(group, Scale);
		
		bullets = new PlayerBulletManger();
		
		_bulletDelay = 200;
		
		beyondControl = false;
	}
	
	public override function update():Void
	{
		super.update();
		
		//朝向
		//var myAngle:Float;
		//myAngle = FlxAngle.getAngle(getMidpoint(_point), FlxG.mouse.getWorldPosition());
		
		if (beyondControl == true)
		{
			//发射子弹
			if(FlxG.mouse.pressed == true && flash.Lib.getTimer() > _lastFired + _bulletDelay)
			{
				bullets.fire(getBone("center").get_endPoint(), FlxG.mouse.getWorldPosition());
				_lastFired = flash.Lib.getTimer();
			}
			
			acceleration.x = 0;
			if (FlxG.keyboard.pressed("LEFT", "A"))
			{
				velocity.x = FlxG.keyboard.pressed("SHIFT") ? -150 : -30;
				facing = FlxObject.LEFT;
				for(member in group.members)
				{
					var bone:FlxSprite = cast(member, FlxSkeletonBone);
					bone.facing = facing;
				}
			}
			if (FlxG.keyboard.pressed("RIGHT", "D"))
			{
				//acceleration.x = maxVelocity.x * 4;
				velocity.x = FlxG.keyboard.pressed("SHIFT") ? 150 : 30;
				facing = FlxObject.RIGHT;
				for(member in group.members)
				{
					var bone:FlxSprite = cast(member, FlxSkeletonBone);
					bone.facing = facing;
				}
			}
			if (FlxG.keyboard.pressed("SPACE") && isTouching(FlxObject.FLOOR))
			{
				velocity.y = -maxVelocity.y / 2;
			}
			
			var v:Float = Math.abs(velocity.x);
			if (velocity.y < -10)
				play("jump up");
			else if (velocity.y > 600)
				play("fall");
			else if (velocity.y > 10)
				play("jump down");
			else if (v == 0)
				play("stand");
			else if (v <= 50)
				play("walk");
			else if (v > 50)
				play("run");
			
		}
	}
	
	override public function reset(X:Float, Y:Float):Void
	{
		super.reset(X, Y);
		
		health = HEALTH;
	}
}