package entity;

import common.skeleton.HumanoidSkeleton;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flash.Lib;
import flixel.util.FlxAngle;
import flixel.FlxObject;
import flixel.FlxSprite;

class Player extends HumanoidSkeleton
{
	inline static public var RUN_SPEED:Int = 60;
	inline static public var GRAVITY:Int = 0;
	inline static public var JUMP_SPEED:Int = 60;
	inline static public var HEALTH:Int = 1;
	inline static public var SPAWNTIME:Float = 30;
	inline static public var SIZE:Int = 6;
	
	private var _bulletDelay:Int;
	private var _lastFired:Int;
	
	public var bullets:PlayerBulletManger;
	public var weapon:String;
	
	private var weaponDelayTime:Float;
	
	public var light:Light;
	
	public function new(group:FlxGroup, Scale:Float)
	{
		super(group, Scale);
		
		bullets = new PlayerBulletManger();
		
		_bulletDelay = 200;
		weapon = "sword";
		
		weaponDelayTime = 0;
		
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
			if(weapon == "gun" && FlxG.mouse.pressed == true && flash.Lib.getTimer() > _lastFired + _bulletDelay)
			{
				bullets.fire(getBone("gun").get_endPoint(), FlxG.mouse.getWorldPosition());
				_lastFired = flash.Lib.getTimer();
			}
			
			var mouseX:Float = FlxG.mouse.x;
			var mouseY:Float = FlxG.mouse.y;
			
			if (mouseX > x)
			{
				facing = FlxObject.RIGHT;
			}
			else
			{
				facing = FlxObject.LEFT;
			}
			
			if (weapon == "gun")
			{
				var weaponObj:FlxSprite = getBone("center");
				
				var _r:Float;
				if (facing == FlxObject.RIGHT)
				{
					_r = Math.atan2(mouseY - weaponObj.y, mouseX - weaponObj.x);
				}
				else
				{
					_r = Math.PI - Math.atan2(mouseY - weaponObj.y, mouseX - weaponObj.x);
					if (_r > Math.PI)
					{
						_r -= Math.PI * 2;
					}
				}
				
				//bend("left shoulder", _r * 0.15 * 360 - 60);
				//bend("left elbow", _r * 0.25 * 360 - 15);
				//bend("left weapon", _r * 0.25 * 360);
			}
			
			acceleration.x = 0;
			if (FlxG.keyboard.pressed("LEFT", "A"))
			{
				velocity.x = FlxG.keyboard.pressed("SHIFT") ? -150 : -30;
				//facing = FlxObject.LEFT;
			}
			if (FlxG.keyboard.pressed("RIGHT", "D"))
			{
				//acceleration.x = maxVelocity.x * 4;
				velocity.x = FlxG.keyboard.pressed("SHIFT") ? 150 : 30;
				//facing = FlxObject.RIGHT;
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
			
			if (FlxG.keyboard.pressed("J"))
			{
				if (weapon == "sword")
				{
					play("stabbed");
				}
				else
				{
					//射击
					play("shoot");
				}
			}
			
			if (weaponDelayTime > 0)
			{
				weaponDelayTime -= FlxG.elapsed;
			}
					
			if (FlxG.keyboard.pressed("K"))
			{
				//changeWeapon("gun", "sword");
				
				if(weaponDelayTime <= 0)
				{
					var oldWeapon:String = weapon;
					
					if (weapon == "sword")
					{
						weapon = "gun";
					}
					else
					{
						weapon = "sword";
					}
					
					changeWeapon(weapon, oldWeapon);
					
					//0.2秒之后才可以再次切换
					weaponDelayTime = 0.2;
				}			
			}
			
			if (FlxG.keyboard.pressed("L"))
			{
				bend("left weapon", -90);
			}
		
		}
	}
	
	override public function reset(X:Float, Y:Float):Void
	{
		super.reset(X, Y);
		
		health = HEALTH;
	}
}