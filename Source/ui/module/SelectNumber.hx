package ui.module;
import flixel.addons.ui.FlxInputText;
import flixel.addons.ui.FlxUIButton;
import flixel.group.FlxSpriteGroup;

/**
 * ...
 * @author blaze
 */
class SelectNumber extends FlxSpriteGroup
{
	public var numberInput:FlxInputText;
	public var leftButton:FlxUIButton;
	public var rightButton:FlxUIButton;

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		
		numberInput = new FlxInputText(0, 0, 30, "1");
		numberInput.filterMode = FlxInputText.ONLY_NUMERIC;
		numberInput.maxLength = 4;
		numberInput.fieldBorderColor = 0xFFFFFFFF;
		numberInput.fieldBorderThickness = 0;
		add(numberInput);
		
		leftButton = new FlxUIButton(-10, 0, "<", changeNumber, [true]);
		leftButton.resize(10, 20);
		add(leftButton);
		
		rightButton = new FlxUIButton(40, 0, ">", changeNumber, [false]);
		rightButton.resize(10, 20);
		add(rightButton);
	}
	
	public function changeNumber(isLeft:Bool):Void
	{
		if (isLeft == true)
		{
			if (Std.parseInt(numberInput.text) > 1)
			{
				numberInput.text = "" + (Std.parseInt(numberInput.text) - 1);
			}
		}
		else
		{
			if (Std.parseInt(numberInput.text) < 9999)
			{
				numberInput.text = "" + (Std.parseInt(numberInput.text) + 1);
			}
		}
	}
}