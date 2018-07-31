package state;

import data.PlayerData;
import entity.Player;
import entity.Water;
import flash.display.BitmapData;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import nme.geom.Rectangle;
import openfl.Assets;
import flixel.util.FlxColor;

class LogosState extends BaseState {
	
	private var _counter:Float = 1;
		
	override public function create():Void {
		super.create();
		
		//for (i in 0...1)
		//{
			//var player = new Player(new FlxGroup(), 64 * 2);
			//player.play("stand");
			//
			//player.x = Math.random() * 500;
			//player.y = Math.random() * 200;
			//player.play("run");
			//add(player);
		//}
		
		// Load _datamap to _map and add to PlayState
		//var _map = new FlxTilemap();
		//_map.loadMap(Assets.getText("assets/tiled/waterTest.txt"), "assets/tiled/tiles.png", 12, 12, 0, 1);
		//add(_map);
		
		//var tilesBmp:BitmapData = new flash.display.BitmapData(64, 32, true, 0);
		//rectTest(0, 0, 64, 32, 16755370, tilesBmp);
		
		//var _collisionMap:FlxTilemap = new FlxTilemap();
		//_collisionMap.loadMap(Assets.getText("assets/tiled/waterTest.txt"), FlxG.bitmap.create(32, 32, FlxColor.CRIMSON), 32, 32, 0, 1);
		//add(_collisionMap);
		//
		//add(new Water(_collisionMap, 640, 480));
		//
		//FlxG.mouse.show();
		
		
		var logos:FlxSprite = new FlxSprite(32, 32, "assets/menu/logos.png");
		_lyr_stage.add(logos);
		
		//var message:FlxText = new FlxText(155, 300, 351, "你好123", 12, false);
		//message.color = FlxColor.BLACK;
		//message.setFormat(null, 24, FlxColor.BLACK, "left");
		//_lyr_stage.add(message);
		
		init();
	}
	
	//游戏初始化工作
	private function init()
	{
		FlxG.data = new PlayerData();
	}
	
	public function rectTest(x:Float, y:Float, width:Float, height:Float, color:Int = 0xFFFFFF, alpha:Float = 1, _target:BitmapData ):Void
	{
		color = (Std.int(alpha * 0xFF) << 24) | (color & 0xFFFFFF);
		var _rect:Rectangle = new Rectangle(); 
		_rect.x = x;
		_rect.y = y;
		_rect.width = width;
		_rect.height = height;
		_target.fillRect(_rect, color);
	}
	
	override public function update():Void {
		super.update();
		
		if (_counter > 0) {
			_counter -= FlxG.elapsed;
		} else {
			if (cast(FlxG.data, PlayerData).isMap == false)
			{
				FlxG.switchState(new SceneState());
			}
			else
			{
				FlxG.switchState(new MapState());
			}
		}
	}
}
