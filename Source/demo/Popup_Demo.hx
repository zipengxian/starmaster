package demo;

import flixel.addons.ui.FlxUIPopup;

/**
 * ...
 * @author 
 */
class Popup_Demo extends FlxUIPopup
{
	public override function create():Void
	{		
		_xml_id = "popup_demo";
		super.create();
		_ui.setMode("demo_0");
	}
	
	public override function eventResponse(id:String, target:Dynamic, data:Array<Dynamic>):Void 
	{
		if (data != null) {
			if (id == "click_button") {
				var i:Int = Std.int(data[0]);
				if(_ui.currMode == "demo_0"){				
					switch(i) {
						case 0: setSubState(new Popup_Simple());
						case 1: _ui.setMode("demo_1");
						case 2: close();
					}
				}else if (_ui.currMode == "demo_1") {
					switch(i) {
						case 0: _ui.setMode("demo_0");
						case 1: close();
					}
				}
			}
		}
	}
	
}