package state; 

import entity.Elevator;
import entity.Player;
import entity.Vehicle;
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPoint;

import map.TiledLevel;

class PlayState extends BaseState
{
	public var level:TiledLevel;
	
	public var score:FlxText;
	public var status:FlxText;
	public var coins:FlxGroup;
	public var player:Player;
	public var vehicle:Vehicle;
	public var floor:FlxObject;
	public var exit:FlxSprite;
	
	public var playerOnVehicle:Bool;
	
	private static var youDied:Bool;
	
	private var elevator:Elevator;
	
	override public function create():Void 
	{
		bgColor = 0xffaaaaaa;
		
		// Load the level's tilemaps
		level = new TiledLevel("assets/tiled/level.tmx");
		
		// Add tilemaps
		add(level.foregroundTiles);
		
		// Draw coins first
		coins = new FlxGroup();
		add(coins);
		
		elevator = new Elevator(20, 27, 20, 0);
		add(elevator);

		// Load player objects
		level.loadObjects(this);
		
		// Add background tiles after adding level objects, so these tiles render on top of player
		add(level.backgroundTiles);
		
		// Create UI
		score = new FlxText(2, 2, 80);
		score.scrollFactor.set(0, 0); 
		score.text = "SCORE: " + (coins.countDead() * 100);
		add(score);
		
		//var vehicle:Vehicle = new Vehicle(new FlxGroup(), 16 * 4);
		//
		//vehicle.x = 80;
		//vehicle.y = 300;
		//
		//vehicle.maxVelocity.x = 160;
		//vehicle.maxVelocity.y = 400;
		//vehicle.acceleration.y = 400;
		//vehicle.drag.x = vehicle.maxVelocity.x * 4;
		//add(vehicle);
		
		status = new FlxText(FlxG.width - 160 - 2, 2, 160);
		status.scrollFactor.set(0, 0);
		status.alignment = "right";
		
		if(youDied == false)
			status.text = "Collect coins.";
		else
			status.text = "Aww, you died!";
		
		add(status);
		youDied = false;
		playerOnVehicle = false;
				
		super.create();
	}
	
	override public function update():Void 
	{
		super.update();
		
		FlxG.overlap(coins, player, getCoin);
		
		// Collide with foreground tile layer
		level.collideWithLevel(player);
		level.collideWithLevel(vehicle);
		
		FlxG.overlap(exit, player, win);
		
		FlxG.collide(player, elevator);
		
		FlxG.collide(vehicle, elevator);
		
		if (playerOnVehicle == false)
		{
			FlxG.overlap(player, vehicle, getOnVehicle);
		}
		else
		{
			if (FlxG.keyboard.pressed("G"))
			{
				player.beyondControl = true;
				vehicle.beyondControl = false;
				playerOnVehicle = false;
			}
			
			if (vehicle.velocity.x != 0)
			{
				player.x = vehicle.facing == FlxObject.RIGHT ? vehicle.x - 5 : vehicle.x + 5 - 10;
				player.y = vehicle.y;
				
				player.facing = vehicle.facing;
			}
		}
		
		if (FlxG.overlap(player, floor))
		{
			youDied = true;
			FlxG.resetState();
		}
		
		if (FlxG.keyboard.pressed("Q"))
		{
			FlxG.switchState(new BossState());
		}
		
		if (FlxG.keyboard.pressed("ESCAPE"))
		{
			FlxG.switchState(new MenuState());
		}
		
		if (FlxG.keyboard.pressed("SPACE") && player.isTouching(FlxObject.FLOOR))
		{
			player.velocity.y = -player.maxVelocity.y / 2;
		}
	}
	
	public function getOnVehicle(player:Player, vehicle:Vehicle):Void
	{
		if (FlxG.keyboard.pressed("G"))
		{
			player.beyondControl = false;
			vehicle.beyondControl = true;
			playerOnVehicle = true;
		}
	}
	
	public function win(Exit:FlxObject, player:FlxObject):Void
	{
		status.text = "Yay, you won!";
		score.text = "SCORE: 5000";
		player.kill();
	}
	
	public function getCoin(Coin:FlxObject, player:FlxObject):Void
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