package ;

import flixel.util.FlxTimer;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxBasic;

//http://www.haxeflixel.com/forum/suggestions/custom-achievement-box

/**
 * ...
 * @author me
 */
class TimeBox extends FlxSpriteGroup
{
	public var container:FlxSprite;
	public var text:FlxText;
	public var fader:FlxTimer;
	
	public function new(MaxSize:Int = 0, X:Int = 0, Y:Int = 0, Label:String = null)
	{
		super(MaxSize);
		this.container = new FlxSprite(X, Y);
		container.makeGraphic(400, 22, 0xffC0C0C0);
		add(container);
		text = new FlxText(X, Y + 2, 400, Label, 12);
		text.alignment = "center";
		add(text);
/*
fader = new FlxDelay(2000);
fader.start;
if (fader.hasExpired)
{
FlxG.play("Beep");
this.kill();
}
*/
	}

/* 
public function Fade():Void
{
//fader.duration = 10000;
this.kill();
}
*/

}