package map;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.util.FlxRect;
import openfl.Assets;
import flixel.FlxObject;
import flixel.util.FlxPoint;
import constants.SystemConstants;

class PointMiniMap extends FlxGroup
{
	public var id:Int;
	public var sky:FlxTilemap;
	public var map:FlxTilemap;
	private var player:FlxSprite;
	public function new(sceneId:Int = 0) 
	{
		super();
		
		//0为随机的场景
		id = sceneId;
		
		var mapData = "";
		var mapPng = "";
		var backgroundMapData = "";
		var backgroundMapPng = "";
		if (id != 0)
		{
			mapData = Assets.getText("assets/tiled/" + SystemConstants.scene[id][1] + ".csv");
			mapPng = "assets/tiled/" + SystemConstants.scene[id][2] + "Mini.png";
			
			backgroundMapData = Assets.getText("assets/tiled/" + SystemConstants.scene[id][3] + ".csv");
			backgroundMapPng = "assets/tiled/" + SystemConstants.scene[id][4] + "Mini.png";
		}
		else
		{
			mapData = "";
			mapPng = "";
			
			backgroundMapData = "";
			backgroundMapPng = "";
		}
		
		sky = new FlxTilemap();
		sky.loadMap(backgroundMapData, backgroundMapPng, 24, 75);
		sky.setTileProperties(1, FlxObject.NONE);
		sky.x = FlxG.width - 200;
		sky.y = 0;
		sky.scrollFactor = new FlxPoint(0, 0);
		
		map = new FlxTilemap();
		map.loadMap(mapData, mapPng, 2, 2, 0, 0, 1, 10);
		map.x = FlxG.width - 200;
		map.y = 0;
		map.scrollFactor = new FlxPoint(0, 0);
		
		//Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
		//map.setTileProperties(500, FlxObject.UP, null, null, 4);

		add(sky);
		add(map);
		
		player = new FlxSprite(0, 0);
		player.makeGraphic(4, 4, 0xffff0000);
		player.scrollFactor = new FlxPoint(0, 0);
		add(player);
		
		updatePos(new FlxPoint(0, 0));
	}
	
	public function updatePos(p:FlxPoint):Void
	{
		//p.x = p.x / 54 * 3;
		//p.y = (p.y / 54 * 3)-1;
		p.x = p.x / 8;
		p.y = p.y / 8;
		
		player.x = map.x + p.x;
		player.y = map.y + p.y;
	}
}
