package common.spriterhx;

import flixel.FlxState;
import flixel.FlxSprite;
import common.spriterhx.spriter.FlxSpriter;
import flixel.FlxObject;
//import common.spriterhx.spriter.SpriterClip;
//import common.spriterhx.spriter.SpriterLoader;

class ExampleBasic extends FlxState
{
	var orc: FlxSpriter;
	
	override public function create():Void {
		//We can scale the PNG's to any size we like, allowing you to start with Hi-Res assets, and scale down to lower powered devices.
		//In this case, the source sprites are Retina-Size, so we will downscale them by 50%
		for (i in 0...0)
		{
			orc = new FlxSpriter(Math.random()*300, Math.random()*300, 0.5);
			orc.play("walk");
			orc.facing = FlxObject.RIGHT;
			orc.defaultFacing = FlxObject.RIGHT;
			add(orc);
			
			//orc = new FlxSprite(Math.random()*200, Math.random()*200);
			//add(orc);
		}
		
		orc = new FlxSpriter(100, 200, 1);
		orc.play("idle_gun");
		orc.facing = FlxObject.RIGHT;
		orc.defaultFacing = FlxObject.RIGHT;
		add(orc);
		
		orc = new FlxSpriter(250, 200, 1);
		orc.play("run_gun");
		orc.facing = FlxObject.LEFT;
		orc.defaultFacing = FlxObject.RIGHT;
		add(orc);
	}
	
	override public function update():Void {
		super.update();
	}
}

