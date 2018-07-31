package state;

import entity.LightsLayer;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;
import flixel.FlxG;
import flixel.group.FlxGroup;
import fluids.WaterGroup;
import map.PointMap;
import map.PointMiniMap;
import common.spriterhx.spriter.FlxSpriter;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import entity.PlayerExt;

class PointState extends FlxState
{
	//	Test specific variables
	private var player:PlayerExt;
	public var scene:PointMap;
	private var minimap:PointMiniMap;
	public var lightsLayer:LightsLayer;
	
	/**
	 * The emitter is going to generate a spray of particles
	 */
	private var _emitter:FlxEmitter;
	
	/**
	 * A group the applies the blobby effect to its members
	 */
	private var _blobs:FlxGroup;
	
	/**
	 * How many particles to set up
	 */
	private var _NUM_PARTICLES:Int = 600;
	
	override public function create():Void
	{
		_blobs = new WaterGroup(0, 0xFF3080FF);
		
		// Create the particle emitter
		_emitter = new FlxEmitter(FlxG.width / 2, FlxG.height / 2, 0);
		for (i in 0..._NUM_PARTICLES)
		{
			var particle:FlxParticle = new FlxParticle();
			particle.makeGraphic(5, 5, 0xFFFFFFFF);
			particle.exists = false;
			_emitter.add(particle);
		}
		
		// turn off emitter rotations
		_emitter.setRotation(0, 0);
		_emitter.gravity = 400;
		
		_emitter.start(false, 1, 1.0 / 60.0);
		
		_blobs.add(_emitter);
		
		//	Test specific
		if (FlxG.plugins.get(FlxControl) == null)
		{
			FlxG.plugins.add(new FlxControl());
		}
		
		//	Enable the plugin - you only need do this once (unless you destroy the plugin)
		lightsLayer = new LightsLayer(1.0 / 3.0, 0.7);
		lightsLayer.visible = false;
		player = new PlayerExt(20, 200, 0.2, lightsLayer);
		//player.elasticity = 0.8;
		player.facing = FlxObject.RIGHT;
		player.offset.x = 2;
		player.offset.y = 2;
		player.play("idle");
		
		//	Control the sprite
		FlxControl.create(player, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
		FlxControl.player1.setCursorControl(false, false, true, true);
		FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
		
		//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
		//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
		FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
		
		//	Set a downward gravity of 400px/sec
		FlxControl.player1.setGravity(0, 400);
		
		//	A basic scene for our ship to fly around
		scene = new PointMap();
		
		FlxG.worldBounds.set(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.setBounds(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		add(scene);
		
		add(player);
		
		add(_blobs);
		
		add(lightsLayer);
		
		minimap = new PointMiniMap();
		add(minimap);
	}
	
	override public function update():Void
	{
		super.update();
		
		FlxG.collide(_emitter, scene.map);
		_emitter.x = FlxG.mouse.x - _emitter.width / 2;
		_emitter.y = FlxG.mouse.y - _emitter.height / 2;
		
		minimap.updatePos(new FlxPoint(player.x, player.y));
		
		FlxG.collide(player, scene.map);
		
		if (FlxG.keyboard.pressed("M"))
		{
			FlxG.switchState(new MapState());
		}
		
		if (FlxG.keyboard.pressed("b"))
		{
			scene.weather.visible = true;
		}
		if (FlxG.keyboard.pressed("n"))
		{
			scene.weather.visible = false;
		}
		
		if (FlxG.keyboard.pressed("c"))
		{
			lightsLayer.visible = true;
		}
		if (FlxG.keyboard.pressed("x"))
		{
			lightsLayer.visible = false;
		}
		
		if (FlxG.keyboard.pressed("t"))
		{
			player.setText("100");
		}
		
		if (player.x < 0)
		{
			player.x = 0;
		}
		
		if (player.touching == FlxObject.FLOOR)
		{
			if (player.velocity.x != 0)
			{
				if (player.currentName != "run")
				{
					player.play("run");
				}
			}
			else
			{
				if (player.currentName != "idle")
				{
					player.play("idle");
				}
			}
		}
		else if (player.velocity.y < 0)
		{
			if (player.currentName != "run")
			{
				player.play("run");
			}
		}
		else
		{
			if (player.currentName != "idle")
			{
				player.play("idle");
			}
		}
	}
	
	override public function destroy():Void
	{
		//	Important! Clear out the plugin otherwise resources will get messed right up after a while
		FlxControl.clear();
		
		super.destroy();
	}
	
}
