package state;

import data.PlayerData;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;
import flixel.FlxG;
import flixel.util.FlxPoint;
import map.PlanetMap;
import constants.SystemConstants;

import flixel.util.FlxColor;

class MapState extends BaseState
{
	//	Test specific variables
	private var player:FlxSprite;
	private var scene:PlanetMap;
	
	override public function create():Void
	{
		//	Test specific
		if (FlxG.plugins.get(FlxControl) == null)
		{
			FlxG.plugins.add(new FlxControl());
		}
		
		//	Enable the plugin - you only need do this once (unless you destroy the plugin)

		player = new FlxSprite(160, 120);
		player.loadRotatedGraphic("assets/sprite/thrust_ship.png", 180, -1, true, true);
		player.elasticity = 0.8;
		
		//	Control the player
		
		FlxControl.create(player, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, false, false);
		FlxControl.player1.setRotationSpeed(200, 200, 200, 300);
		FlxControl.player1.setRotationType(FlxControlHandler.ROTATION_INSTANT, FlxControlHandler.ROTATION_STOPPING_DECELERATES);
		FlxControl.player1.setRotationKeys(true, false, "A", "D");
		FlxControl.player1.setThrust("W", 100, "S", 100);
		FlxControl.player1.setMovementSpeed(200, 200, 200, 200, 500, 500);
		
		//	A basic scene for our ship to fly around
		scene = new PlanetMap();
		
		FlxG.worldBounds.set(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.setBounds(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.follow(player);
		add(scene);
		add(player);
		
		player.x = cast(FlxG.data, PlayerData).mapX;
		player.y = cast(FlxG.data, PlayerData).mapY;
	}
	
	override public function update():Void
	{
		FlxG.collide(player, scene.map);
		
		if (FlxG.keyboard.pressed("E"))
		{
			//临时注释掉
			//var tile = scene.map.getTile(Std.int(player.x / 16), Std.int(player.y / 16));
			//var sceneId = SystemConstants.mapTiledToScene[tile];
			
			var sceneId = 1;
			
			cast(FlxG.data, PlayerData).sceneId = sceneId;
			cast(FlxG.data, PlayerData).x = SystemConstants.scene[sceneId][5];
			cast(FlxG.data, PlayerData).y = SystemConstants.scene[sceneId][6];
			
			FlxG.switchState(new SceneState());
		}
		
		//minimap.updatePos(new FlxPoint(player.x, player.y));
		
		super.update();
	}
	
	override public function destroy():Void
	{
		//	Important! Clear out the plugin otherwise resources will get messed right up after a while
		FlxControl.clear();
		
		super.destroy();
	}
	
}
