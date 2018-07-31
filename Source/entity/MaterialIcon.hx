package entity;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import map.PointMap;
import constants.MaterialConstants;
import state.SceneState;

/**
 * ...
 * @author blaze
 */
class MaterialIcon extends FlxGroup
{
	public var id:Int;
	public var isDragMaterialIcon:Bool;
	public var windowMark:Int; // 0代表在packetwindow，1代表在equipmentwindow
	public var number:Int;
	
	public var icon:FlxSprite;
	public var subscript:FlxText;
	public function new(x:Float, y:Float, i:Int, n:Int = 1)
	{
		super();
		id = i;
		number = n;
		isDragMaterialIcon = false;
		windowMark = 0;
		
		icon = new FlxSprite(x, y);
		icon.loadGraphic("assets/sprite/materialicon.png", true, false, 16, 16);		
		icon.scrollFactor.set(0, 0);
		icon.animation.add(MaterialConstants.materials[id][MaterialConstants.materialIndexAnim], [MaterialConstants.materials[id][MaterialConstants.materialIndexPic]], 1, false);
		icon.animation.play(MaterialConstants.materials[id][MaterialConstants.materialIndexAnim]);
		
		subscript = new FlxText(x + 4, y, 16, '', 4);
		  
		add(icon);
		add(subscript);
		
		//exists = false;
	}
	
	public function setXY(x:Float, y:Float):Void
	{
		icon.x = x;
		icon.y = y;
			
		subscript.x = icon.x + 4;
		subscript.y = icon.y;
	}
	
	public function setOffsetXY(x:Float, y:Float):Void
	{
		icon.x += x;
		icon.y += y;
		
		subscript.x = icon.x + 4;
		subscript.y = icon.y;
	}
	
	override public function update():Void
	{
		if (isDragMaterialIcon == true)
		{
			icon.x = FlxG.mouse.x + 16 - FlxG.camera.scroll.x;
			icon.y = FlxG.mouse.y - FlxG.camera.scroll.y;
			
			subscript.x = icon.x + 4;
			subscript.y = icon.y;
		}
		
		if (number > 1)
		{
			subscript.text = Std.string(number);
		}
		
		if (number == 1)
		{
			subscript.text = "";
		}
		
		super.update();
	}
}
