package state.local;

import state.PlayState;
import util.FireTongueEx;
import haxe.xml.Fast;
import flash.Lib;
import flixel.FlxG;
import state.BaseState;
import state.MenuState;
import flixel.addons.ui.FlxUIState;

import ui.SaveSlot;

/**
 * ...
 * @author Lars Doucet
 */

class LocalSaveState extends BaseState
{

	override public function create() 
	{
		_xml_id = "state_save";
		
		if (GameClass.tongue == null) {
			GameClass.tongue = new FireTongueEx();
			GameClass.tongue.init("en-US");
			FlxUIState.static_tongue = GameClass.tongue;
		}
		
		super.create();
	}
	
	public override function getRequest(id:String, target:Dynamic, data:Dynamic):Dynamic {
		var xml:Fast;
		if (Std.is(data, Fast)) {
			xml = cast(data, Fast);
		}
		if (id.indexOf("ui_get:") == 0) {
			var str:String = StringTools.replace(id,"ui_get:","");
			switch(str) {
				case "save_slot": 					
					return new SaveSlot(data, _ui);
			}
		}
		return null;
	}
	
	public override function eventResponse(id:String, target:Dynamic, data:Array<Dynamic>):Void 
	{
		if (data != null) {
			switch(cast(data[0], String)) {
				case "back": FlxG.switchState(new MenuState());
				case "play": FlxG.switchState(new PlayState());
			}
			
			switch(id) {
				case "click_button":
					switch(cast(data[0], String)) {
						case "back": FlxG.switchState(new MenuState());
						case "play": FlxG.switchState(new PlayState());
					}
				case "click_popup":
					switch(cast(data[0], Int)) {
						case 0: FlxG.log.add("Yes was clicked");
						case 1: FlxG.log.add("No was clicked");
						case 2: FlxG.log.add("Cancel was clicked");
					}
			}
		}
	}
	
	public override function update():Void {
		super.update();
	}
}