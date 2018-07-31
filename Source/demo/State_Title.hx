package demo;

import flash.text.Font;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIPopup;
import flixel.addons.ui.FlxUIText;
import flixel.addons.ui.U;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIRadioGroup;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;
import openfl.Assets;
import util.FireTongueEx;

/**
 * @author Lars Doucet
 */
class State_Title extends FlxUIState
{
	override public function create():Void
	{
		FlxG.cameras.bgColor = 0xff131c1b;
		FlxG.log.redirectTraces = false; 
		FlxG.mouse.show();		
		
		
		if (GameClass.tongue == null) {
			GameClass.tongue = new FireTongueEx();
			GameClass.tongue.init("en-US");
			FlxUIState.static_tongue = GameClass.tongue;
		}
		
		/*var b:FlxUIButton = cast _ui.getAsset("saves");
		var t:FlxUIText = cast b.label;*/
		
		_xml_id = "state_title";
		
		super.create();
	}
	
	public override function getEvent(id:String, sender:Dynamic, data:Dynamic):Void {
		var str:String = "";
		
		switch(id) {
			case "finish_load":
				var radio:FlxUIRadioGroup = cast _ui.getAsset("locale_radio");
				if (radio != null) {
					if(GameClass.tongue != null){
						radio.selectedId = GameClass.tongue.locale.toLowerCase();
					}
				}
			case "click_button":
				if (Std.is(data, Array) && data != null && data.length > 0) {
					switch(cast(data[0],String)) {
						case "saves": FlxG.switchState(new State_SaveMenu());
						case "menu": FlxG.switchState(new State_TestMenu());
						case "battle": FlxG.switchState(new State_Battle());
						case "default_test": FlxG.switchState(new State_DefaultTest());
						case "code_test": FlxG.switchState(new State_CodeTest());
						case "popup": setSubState(new Popup_Demo());
						case "shapes": FlxG.switchState(new State_TestShapes());
					}
				}
			case "click_radio_group":
				if (Std.is(data, Array) && data != null && data.length > 0) {
					var id:String = ""; if(data[0] != null){ id = cast(data[0], String);}
					var value:String = ""; if(data[1] != null){value = cast(data[1], String);}
					if (value == "checked:true") {
						if(GameClass.tongue != null){
							GameClass.tongue.init(id, reloadState);
						}
					}
				}
		}		
	}	
	
	private function reloadState():Void {
		FlxG.switchState(new State_Title());
	}
}