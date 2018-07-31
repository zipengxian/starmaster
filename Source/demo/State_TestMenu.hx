package demo;

import haxe.xml.Fast;
import flash.Lib;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
/**
 * @author Lars Doucet
 */

class State_TestMenu extends FlxUIState
{

	override public function create() 
	{
		_xml_id = "state_menu";
		super.create();
		
	}
	
	public override function getRequest(id:String, target:Dynamic, data:Dynamic):Dynamic {
		return null;
	}	
	
	public override function eventResponse(id:String,target:Dynamic,data:Array<Dynamic>):Void {
		if (data != null) {
			switch(cast(data[0], String)) {
				case "back": FlxG.switchState(new State_Title());
			}
		}
	}
	
	public override function update():Void {
		super.update();
	}
	
}