package map;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.util.FlxRect;
import openfl.Assets;

class PlanetMap extends FlxGroup
{
	public var map:FlxTilemap;
	
	public function new() 
	{
		super(1);
		
		map = new FlxTilemap();
		map.loadMap(Assets.getText("assets/tiled/mapCSV_Group1_Map1.csv"), "assets/tiled/planet.png", 32, 32, 0, 0, 1, 450);
		
		//map.y = -32;
		
		add(map);
	}
	
}
