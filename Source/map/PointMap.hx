package map;
import entity.group.Plants;
import entity.Weather;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.util.FlxRect;
import openfl.Assets;
import flixel.FlxObject;
import constants.SystemConstants;

class PointMap extends FlxGroup
{
	public var id:Int;
	public var sky:FlxTilemap;
	public var map:FlxTilemap;
	public var weather:FlxSprite;
	public var plants:Plants;
	
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
			mapPng = "assets/tiled/" + SystemConstants.scene[id][2] + ".png";
			
			backgroundMapData = Assets.getText("assets/tiled/" + SystemConstants.scene[id][3] + ".csv");
			backgroundMapPng = "assets/tiled/" + SystemConstants.scene[id][4] + ".png";
		}
		else
		{
			mapData = "";
			mapPng = "";
			
			backgroundMapData = "";
			backgroundMapPng = "";
		}
		
		sky = new FlxTilemap();
		sky.loadMap(backgroundMapData, backgroundMapPng, 192, 600);
		sky.setTileProperties(1, FlxObject.NONE);
		sky.scrollFactor.x = 0.9;
		
		map = new FlxTilemap();
		map.loadMap(mapData, mapPng, 16, 16, 0, 0, 1, 10);
		
		weather = new Weather(0, 0);
		
		plants = new Plants();
		plants.addTree(100, 65);
				
		//	Makes these tiles as allowed to be jumped UP through (but collide at all other angles)
		//map.setTileProperties(500, FlxObject.UP, null, null, 4);
		
		//map.y = -32;
		add(sky);
		add(weather);
		add(map);
		add(plants);
		
	}
	
}
