package ;

import spriter.FlxSpriter;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;

class SpriterState extends FlxState {
	
	private var _counter:Float = 1;
	
	override public function create():Void {
		super.create();
		var spriter : FlxSpriter = new FlxSpriter('brawler/brawler.scml', 100, 300);
		spriter.playAnimation('idle');
		add(spriter);
	}
	
	override public function update():Void {
		super.update();
	}
}
