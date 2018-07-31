package state;

import demo.State_Title;
import flash.display.Stage;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxSave;

import state.net.LoginState;
import state.local.LocalNewState;
import state.local.LocalSaveState;

class MenuState extends BaseState {	
	
	private var _text1:FlxText;
	private var _text2:FlxText;
	private var _button1:FlxText;
	private var _button2:FlxText;
	private var _button3:FlxText;
	
	// Here's the FlxSave variable this is what we're going to be saving to.
	private var _gameSave:FlxSave;
	
	override public function create():Void {
		super.create();
		
		var background:FlxSprite = new FlxSprite(20, 20, "assets/ui/background_menu.png");
		_lyr_stage.add(background);
		
		_text1 = new FlxText(0, FlxG.height / 6, FlxG.width, "Project");
		_text1.moves = true;
		_text1.size = 32;
		_text1.color = 0xffffff;
		_text1.antialiasing = true;
		_text1.alignment = "center";
		_lyr_sprites.add(_text1);
		
		var _button1:FlxButton = new FlxButton((FlxG.width / 2) - 104, (FlxG.height / 2) - 45, "net version", onClickPlayAll);
		_button1.color = 0xff729954;
		_button1.label.color = 0xffd8eba2;
		_lyr_sprites.add(_button1);
		
		var _button2:FlxButton = new FlxButton((FlxG.width / 2) - 104, (FlxG.height / 2) - 25, "beta version", onClickPlayBeta);
		_button1.color = 0xff729954;
		_button1.label.color = 0xffd8eba2;
		_lyr_sprites.add(_button2);
		
		var _button3:FlxButton = new FlxButton((FlxG.width / 2) - 104, FlxG.height / 2, "introduce", onClickIntroduce);
		_button2.color = 0xff729954;
		_button2.label.color = 0xffd8eba2;
		_lyr_sprites.add(_button3);
		
		_text2 = new FlxText(0, (FlxG.height / 2) + 60, FlxG.width, "version");
		_text2.moves = true;
		_text2.size = 22;
		_text2.color = 0xffffff;
		_text2.antialiasing = true;
		_text2.alignment = "center";  
		_lyr_sprites.add(_text2);
		
		_gameSave = new FlxSave();
		_gameSave.bind("SaveBeta");
	}
	
	private function onClickPlayAll():Void {
		//FlxG.switchState(new LoginState());
		FlxG.switchState(new State_Title());
	}
	
	private function onClickPlayBeta():Void {
		//是否有保存
		if (_gameSave.data.name != null)
		{
			FlxG.switchState(new LocalNewState());
		}
		else
		{
			FlxG.switchState(new PlayState());
		}
	}
	
	private function onClickIntroduce():Void {
		FlxG.switchState(new IntroduceState());
	}
}
