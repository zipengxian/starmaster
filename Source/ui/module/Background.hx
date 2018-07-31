package ui.module;
import flixel.addons.display.FlxExtendedSprite;

/**
 * ...
 * @author blaze
 */
class Background extends FlxExtendedSprite
{

	public function getDragOffsetX() 
	{
		return _dragOffsetX;
	}
	
	public function getDragOffsetY() 
	{
		return _dragOffsetY;
	}
	
}