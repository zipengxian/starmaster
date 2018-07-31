package entity;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author blaze
 */
class Weather extends FlxSprite
{

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		makeGraphic(FlxG.width, FlxG.height, 0xff000000);
		scrollFactor.x =scrollFactor.y = 0;
		alpha = 0.7;
		visible = false;
	}
	
}