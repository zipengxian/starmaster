package state; 

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import map.BossLevel;

import common.skeleton.PetSkeleton;

class BossState extends FlxState
{
	public var level:BossLevel;
	
	public var score:FlxText;
	public var status:FlxText;
	public var coins:FlxGroup;
	public var player:PetSkeleton;
	public var floor:FlxObject;
	public var exit:FlxSprite;
	public var weapon:String;
	
	private static var youDied:Bool;
	
	private var weaponDelayTime:Float;
	
	override public function create():Void 
	{
		//super.create();
		bgColor = 0xffaaaaaa;
		
		// Load the level's tilemaps
		level = new BossLevel("assets/tiled/level.tmx");
		
		// Add tilemaps
		add(level.foregroundTiles);
		
		// Draw coins first
		coins = new FlxGroup();
		add(coins);
		
		// Load player objects
		level.loadObjects(this);
		
		// Add background tiles after adding level objects, so these tiles render on top of player
		add(level.backgroundTiles);
		
		// Create UI
		score = new FlxText(2, 2, 80);
		score.scrollFactor.set(0, 0); 
		score.text = "SCORE: " + (coins.countDead() * 100);
		add(score);
		
		status = new FlxText(FlxG.width - 160 - 2, 2, 160);
		status.scrollFactor.set(0, 0);
		status.alignment = "right";
		
		if(youDied == false)
			status.text = "Collect coins.";
		else
			status.text = "Aww, you died!";
		
		add(status);
		youDied = false;
		
		weapon = "sword";
		weaponDelayTime = 0;
	}
	
	override public function update():Void 
	{
		if (weapon == "sword")
		{
			//var _r:Number;
			//if(face>0){
				//_r = Math.atan2(mouseY - armatureClip.y, mouseX - armatureClip.x);
			//}else{
				//_r = Math.PI - Math.atan2(mouseY - armatureClip.y, mouseX - armatureClip.x);
				//if (_r > Math.PI) {
					//_r -= Math.PI * 2;
				//}
			//}
		}
		
		player.acceleration.x = 0;
		if (FlxG.keyboard.pressed("LEFT", "A"))
		{
			//player.acceleration.x = -player.maxVelocity.x * 4;
			player.velocity.x = FlxG.keyboard.pressed("SHIFT") ? -150 : -30;
			player.facing = FlxObject.LEFT;
		}
		if (FlxG.keyboard.pressed("RIGHT", "D"))
		{
			//player.acceleration.x = player.maxVelocity.x * 4;
			player.velocity.x = FlxG.keyboard.pressed("SHIFT") ? 150 : 30;
			player.facing = FlxObject.RIGHT;
		}
		if (FlxG.keyboard.pressed("SPACE") && player.isTouching(FlxObject.FLOOR))
		{
			player.velocity.y = -player.maxVelocity.y / 2;
		}
		
		super.update();
		
		var v:Float = Math.abs(player.velocity.x);
		if (player.velocity.y < -10)
			player.play("jump up");
		else if (player.velocity.y > 600)
			player.play("fall");
		else if (player.velocity.y > 10)
			player.play("jump down");
		else if (v == 0)
			player.play("stand");
		else if (v <= 50)
			player.play("walk");
		else if (v > 50)
			player.play("run");
		
		if (FlxG.keyboard.pressed("J"))
		{
			player.play("attack");
		}
		
		FlxG.overlap(coins, player, getCoin);
		
		// Collide with foreground tile layer
		level.collideWithLevel(player);
		
		FlxG.overlap(exit, player, win);
		
		if (FlxG.overlap(player, floor))
		{
			youDied = true;
			FlxG.resetState();
		}
	}
	
	public function win(Exit:FlxObject, Player:FlxObject):Void
	{
		status.text = "Yay, you won!";
		score.text = "SCORE: 5000";
		player.kill();
	}
	
	public function getCoin(Coin:FlxObject, Player:FlxObject):Void
	{
		Coin.kill();
		score.text = "SCORE: " + (coins.countDead() * 100);
		if (coins.countLiving() == 0)
		{
			status.text = "Find the exit";
			exit.exists = true;
		}
	}
	
}