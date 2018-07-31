package ui;

import flixel.FlxSprite;

class LoginBackground extends FlxSprite {
	
	public function new(X:Float, Y:Float):Void {
		super(X, Y);
		loadGraphic("assets/ui/background_cerrado.png",  false, false, 640, 400);
		
		animation.add("normal", [0]);
		animation.add("animate", [0, 1], 10);
	}
}
