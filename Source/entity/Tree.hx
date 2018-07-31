package entity;
import flixel.FlxSprite;
import flixel.FlxG;
import map.PointMap;

/**
 * ...
 * @author blaze
 */
class Tree extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x + 225 / 2 - 8, y + 225 - 16);
		loadGraphic("assets/sprite/tree.png", false, false, 225, 225);
		width = 16;
		height = 16;
		offset.x = 225 / 2 - 8;
		offset.y = 225 - 16;
	}
	
	override public function update():Void
	{
		super.update();
		
		if (FlxG.mouse.justPressed && hover())
		{
			//todo
		}
	}
	
	public function hover():Bool {
		var mx:Float = FlxG.mouse.x;
		var my:Float = FlxG.mouse.y;
		return ( (mx > x) && (mx < x + width) ) && ( (my > y) && (my < y + height) );
	}
}
