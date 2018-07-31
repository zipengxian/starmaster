package state.net;

import state.StoryState;
import ui.LoginBackground;
import flixel.text.FlxText;
import flixel.text.FlxTextField;
import flixel.FlxG;
import flixel.ui.FlxButton;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

class LoginState extends BaseState 
{		
	private var _input_text:FlxTextField;
	
	override public function create():Void {		
		super.create();
		
		var loginBackground:LoginBackground = new LoginBackground(20, 20);
		loginBackground.animation.play("animate");
		_lyr_stage.add(loginBackground);
		
		var _text1:FlxText = new FlxText(0, 40, FlxG.width, "Project");
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
		
		var _input_text:FlxTextField = new FlxTextField(235, (FlxG.height / 2) - 54, 295, "账号", 20);
		_input_text.antialiasing = true;
		_input_text.color = 0x25155E;
		_input_text.alignment = "left";
		_lyr_sprites.add(_input_text);
		
		var _button:FlxButton = new FlxButton((FlxG.width / 2) + 10, (FlxG.height / 2), "登陆", tryChangeState);
		_lyr_sprites.add(_button);
				
		addVersionBeta();
	}
	
	private function tryChangeState():Void 
	{
		if (_input_text.text != "") {
			//Farm.setPlayerName(_input_text.text);
			FlxG.switchState(new StoryState());	
		} else {
			//dialogBoxError("Você precisa digitar o seu nome.");
		}
	}
	
	private function keyDownHandler(event:KeyboardEvent):Void 
	{
		if (event.keyCode == Keyboard.ENTER) {
			tryChangeState();
		}
	}
	
	private function onClick():Void 
	{
		var http = new haxe.Http("..\\..\\Controller\\sqlRead\\index.php");
		//var http = new Http(url);
		http.setParameter("userName", "nicholas");
		http.setParameter("id", "1"); 
		http.onData = function (data:String) {

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
