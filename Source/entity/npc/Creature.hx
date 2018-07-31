package entity.npc;

import entity.PlayerExt;
import flixel.FlxObject;
import flixel.FlxSprite;
import constants.SystemConstants;
import flixel.FlxG;
import state.SceneState;

class Creature extends FlxSprite
{
	public static var statusPeace:Int = 0;
	public static var statusAttack:Int = 1;
	public static var statusTimid:Int = 2;
	
	public var id:Int;
	public var name:String;
	public var status:Int;
	public var state:SceneState;
	
	public var attackObject:PlayerExt;
	
	public function new(id:Int, x:Float, y:Float, state:SceneState)
	{
		//初始化
		this.id = id;
		this.name = SystemConstants.creature[id][0];
		this.state = state;
		attackObject = state.player;
		
		super(x, y);
		
		acceleration.y = 40;
		
		loadGraphic("assets/sprite/creature/" + SystemConstants.creature[id][1] + ".png", true, true ,80 ,80);
		animation.add("idle", [0, 1, 2, 3], 5, true);
		animation.add("walk", [4, 5, 6, 7], 5, true);
		animation.add("attack", [16, 17, 18, 19], 5, true);
	}
	
	override public function update():Void
	{
		super.update();
		
		status = statusPeace;
		velocity.x = 0;
				
		//玩家进入范围
		if (attackObject.health > 0 && Math.abs(attackObject.x - x) < 100 && Math.abs(attackObject.y - y) < 100)
		{
			if (SystemConstants.creatureTypeAttack == SystemConstants.creature[id][2])
			{
				status = statusAttack;
			}
			else if (SystemConstants.creatureTypePeace == SystemConstants.creature[id][2])
			{
				
			}
			else if (SystemConstants.creatureTypeTimid == SystemConstants.creature[id][2])
			{
				status = statusTimid;
			}
		}
		
		if (status == statusAttack)
		{
			attack();
		}
		else if (status == statusTimid)
		{
			escape();
		}
		else
		{
			animation.play("idle");
		}
		
		if (status == statusAttack)
		{
			FlxG.overlap(attackObject, this, hitObject);
			
			if (attackObject.health <= 0)
			{
				status = statusPeace;
			}
		}
	}
	
	/**
	 * 增加目标
	 * @param	Object
	 */
	public function addObject(Object:PlayerExt):Void
	{
		attackObject = Object;
	}
	
	/**
	 * 攻击目标
	 * @param	Object
	 * @param	Monster
	 */
	public function hitObject(Object:PlayerExt, Monster:FlxObject):Void
	{
		if (Monster.health > 0)
		{
			Object.injure(SystemConstants.creature[id][6], SystemConstants.creature[id][7], SystemConstants.creature[id][9], SystemConstants.creature[id][10]);
		}
	}
	
	/**
	 * 攻击动作
	 */
	public function attack():Void
	{
		if (attackObject.x - (x + width) > 5)
		{
			facing = FlxObject.RIGHT;
			velocity.x = SystemConstants.creature[id][12];
			animation.play("walk");
		}
		else if(x - (attackObject.x + attackObject.width) > 5)
		{
			facing = FlxObject.LEFT;
			velocity.x = -SystemConstants.creature[id][12];
			animation.play("walk");
		}
		else
		{
			animation.play("attack");
		}
	}
	
	/**
	 * 逃跑动作
	 */
	public function escape():Void
	{
		if (attackObject.x - (x + width) > 0)
		{
			velocity.x = -SystemConstants.creature[id][12];
			facing = FlxObject.LEFT;
		}
		else if(x - (attackObject.x + attackObject.width) > 0)
		{
			velocity.x = SystemConstants.creature[id][12];
			facing = FlxObject.RIGHT;
		}
		
		animation.play("walk");
	}
}
