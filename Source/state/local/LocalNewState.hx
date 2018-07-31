package state.local;

import flixel.util.FlxSave;
import state.BaseState;
import ui.LoginBackground;
import flixel.text.FlxText;
import flixel.text.FlxTextField;
import flixel.FlxG;
import flixel.ui.FlxButton;
import state.StoryState;
import flixel.addons.ui.FlxInputText;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

class LocalNewState extends BaseState {		
	private var _input_text:FlxInputText;
	private var _gameSave:FlxSave;
	
	override public function create():Void {		
		super.create();
		
		var loginBackground:LoginBackground = new LoginBackground(20, 20);
		loginBackground.animation.play("animate");
		_lyr_stage.add(loginBackground);
		
		var _text1:FlxText = new FlxText(-200, 40, FlxG.width, "Project");
		_text1.moves = true;
		_text1.size = 26;
		_text1.color = 0xffffff;
		_text1.antialiasing = true;
		_text1.alignment = "center";
		_lyr_sprites.add(_text1);
		
		_text1 = new FlxText(150, (FlxG.height / 2) - 54, 195, "Nome:", 60);
		_text1.moves = true;
		_text1.size = 20;
		_text1.color = 0xffffff;
		_text1.antialiasing = true;
		_text1.alignment = "left";
		_lyr_sprites.add(_text1);
		
		_input_text = new FlxInputText(235, (FlxG.height / 2) - 54, 295, "here", 20);
		_input_text.antialiasing = true;
		_input_text.color = 0x25155E;
		_input_text.alignment = "left";
		_lyr_sprites.add(_input_text);
		
		var _button:FlxButton = new FlxButton((FlxG.width / 2) + 10, (FlxG.height / 2), "enter", tryChangeState);
		_lyr_sprites.add(_button);
		
		addVersionBeta();
		
		_gameSave = new FlxSave();
		_gameSave.bind("SaveBeta");
	}
	
	private function tryChangeState():Void {
		if (_input_text.text != "") {
			_gameSave.data.name = _input_text.text;
			
			//Farm.setPlayerName(_input_text.text);
			FlxG.switchState(new StoryState());	
		} else {
			//dialogBoxError("please enter name");
		}
	}
	
	private function keyDownHandler(event:KeyboardEvent):Void {
		if (event.keyCode == Keyboard.ENTER) {
			tryChangeState();
		}
	}
	
	private function onClick():Void {
		var http = new haxe.Http("..\\..\\Controller\\sqlRead\\index.php");
		//var http = new Http(url);
		http.setParameter("userName", "nicholas");
		http.setParameter("id", "1"); 
		http.onData = function (data:String) {
			//authToken = getTokenFromData(data);
		}
		//http.onError = function (msg:String):Void {
			//Lib.println(msg);
		//}
		//http.onStatus = function (status:Int):Void {
			//Lib.println(status);
		//}
		http.onData = function(s:String){trace(s);}
		http.onError = function(e:String){trace(e);}

		http.request(true);
	}
}
