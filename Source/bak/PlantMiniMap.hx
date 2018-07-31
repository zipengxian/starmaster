package map;

import flash.display.Bitmap;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
import flixel.tile.FlxTilemap;
import openfl.Assets;

class PlantMiniMap extends FlxGroup
{
	private var player:FlxSprite;
	private var map:FlxTilemap;
	public function new() 
	{
		super();
		
		map = new FlxTilemap();
		map.loadMap(Assets.getText("assets/tiled/mapCSV_Group1_Map1.csv"), "assets/tiled/miniPlanet.png", 2, 2, 0, 0, 1, 450);
		map.x = FlxG.width - 200;
		map.y = 0;
		//map.alpha = 0.4;
		//map.scale = new FlxPoint(3, 3);
		map.scrollFactor = new FlxPoint(0, 0);
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
		p.x = p.x / 16;
		p.y = p.y / 16;
		
		player.x = map.x + p.x;
		player.y = map.y + p.y;
	}
}
