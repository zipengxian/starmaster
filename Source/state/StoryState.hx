package state;
import flixel.ui.FlxButton;
import flixel.util.FlxSave;
import flixel.FlxG;
import flixel.text.FlxText;

class StoryState extends BaseState {
	private var _counter:Float;
	private var _text1:FlxText;
	private var _text2:FlxText;
	
	override public function create():Void {		
		super.create();
		
		_text1 = new FlxText(-200, 40, FlxG.width, "故事是这样的", false);
		_text1.moves = true;
		_text1.size = 26;
		_text1.color = 0xffffff;
		_text1.antialiasing = true;
		_text1.alignment = "center";
		_lyr_sprites.add(_text1);
		
		_text2 = new FlxText(-200, 40, FlxG.width, "然后是这样的", false);
		_text2.moves = true;
		_text2.size = 26;
		_text2.color = 0xffffff;
		_text2.antialiasing = true;
		_text2.alignment = "center";
		_lyr_sprites.add(_text2);
		
		_text2.visible = false;
		
		_counter = 2;
		
		var _button:FlxButton = new FlxButton((FlxG.width / 2) + 10, (FlxG.height / 2), "skip", playState);
		_lyr_sprites.add(_button);
	}
	
	private function playState():Void {
		FlxG.switchState(new PlayState());
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (_counter > 0) {
			_counter -= FlxG.elapsed;
		} else if (_counter < 1 && _counter > 0) {
			_text1.visible = false;
			_text2.visible = true;
		} else if (_counter <= 0) {
			FlxG.switchState(new PlayState());
		}
	}
}