package state;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

import ui.LoginBackground;

class IntroduceState extends BaseState {
	
	override public function create():Void {		
		super.create();
		
		var loginBackground:LoginBackground = new LoginBackground(20, 20);
		loginBackground.animation.play("animate");
		_lyr_stage.add(loginBackground);
		
		var _text1:FlxText = new FlxText(-200, 40, FlxG.width, "introduce");
		_text1.size = 26;
		_text1.color = 0xffffff;
		_text1.alignment = "center";
		_lyr_sprites.add(_text1);
		
		var _text2:FlxText = new FlxText(150, (FlxG.height / 2) - 124, 640, "introduce");
		_text1.size = 16;
		_text1.color = 0xffffff;
		_text1.alignment = "center";
		_lyr_sprites.add(_text2);
		
		var _button:FlxButton = new FlxButton((FlxG.width / 2) - 104, (FlxG.height / 2) + 40, "back", onClickBack);
		_button.color = 0xff729954;
		_button.label.color = 0xffd8eba2;
		_lyr_sprites.add(_button);
	}
	
	private function onClickBack():Void {
		FlxG.switchState(new MenuState());
	}
}
