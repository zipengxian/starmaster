package entity;

import flixel.util.FlxPoint;
import flixel.FlxSprite;

class Inventory extends FlxSprite
{
	private var select:Bool;
	public function new(x:Float, y:Float)
	{
		super(x, y);
		//loadGraphic("assets/ui/inventory.png", true, true , 20 , 20);
		makeGraphic(10, 10, 0xff9999ff);
		
		exists = true;
	}
	
	public function doSelect():Void
	{
		select = true;
	}
	
	public function doRelease():Void
	{
		select = false;
	}
	
	override public function update():Void
	{
		super.update();
	}
}
