package entity;
import flixel.FlxSprite;
import constants.MaterialConstants;

/**
 * ...
 * @author blaze
 */
class MaterialElement extends FlxSprite
{
	public var id:Int;
	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic("assets/sprite/materialicon.png", true, false, 16, 16);
		scrollFactor.set(0, 0);
		visible = false;
	}
	
	public function loadElement(i:Int)
	{
		visible = true;
		id = i;
		animation.destroyAnimations();
		animation.add(MaterialConstants.materials[id][MaterialConstants.materialIndexAnim], [MaterialConstants.materials[id][MaterialConstants.materialIndexPic]], 1, false);
		animation.play(MaterialConstants.materials[id][MaterialConstants.materialIndexAnim]);
	}
}
