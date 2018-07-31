package common.spriterhx;

import flash.Lib;
import flixel.FlxGame;

class GameDemo extends FlxGame
{	
	public function new()
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		
		//var ratioX:Float = stageWidth / 680;
		//var ratioY:Float = stageHeight / 440;
		var ratioX:Float = 1;// stageWidth / Lib.stage.stageWidth;
		var ratioY:Float = 1;// stageHeight / Lib.stage.stageHeight;
		var ratio:Float = Math.min(ratioX, ratioY);
		
		var fps:Int = 60;
		
		super(Math.ceil(stageWidth / ratio), Math.ceil(stageHeight / ratio), ExampleBasic, ratio, fps, fps);
		
		//super(680, 440, LogosState, 1, fps, fps);
	}
}