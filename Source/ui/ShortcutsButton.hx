package ui;

import flixel.util.FlxPoint;
import flixel.FlxSprite;

class ShortcutsButton extends FlxSprite
{
	private var select:Bool;
	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic("assets/ui/inventory.png", true, true ,20 ,20);
		animation.add("unselect", [0], 1, false);
		animation.add("select", [1], 1, false);
		
		exists = true;
		select = false;
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
		
		if(select == true)
		{
			animation.play("select");
		}
		else
		{
			animation.play("unselect");
		}
	}
}
