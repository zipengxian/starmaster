package ui;

import flixel.addons.ui.FlxUI;
import flixel.addons.ui.interfaces.IEventGetter;
import flixel.addons.ui.U;
import haxe.xml.Fast;
import flash.geom.Point;
import flash.Lib;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import state.PlayState;

/**
 * ...
 * @author Lars Doucet
 */

class SaveSlot extends FlxUI
{	
	private var ptr:IEventGetter;
	public var valid : Bool;
	
	public function new(data:Fast, _ptr:Dynamic = null) {
		super(null, _ptr);		
		if (_ptr != null) {
			if (Std.is(_ptr, FlxUI)) {
				var ui:FlxUI = cast _ptr;
				_ptr_tongue = ui.tongue;
			}
		}
		loadStuff(data, _ptr);
		valid = true;
		FlxG.log.add("SaveSlot(" + id + "" + _ptr + ")");		

		init();
	}

	public function loadStuff(data:Fast, _ptr:Dynamic):Void {		
		load(data);
		id = U.xml_str(data.x,"id");
	}
	
	public override function update():Void {
		super.update();
	}
	
	private override function _onClickButton(params:Dynamic = null):Void {
		if (Std.is(params[0], String)) {
			var str:String = cast(params[0], String);
			switch(str) {
				case "play": onPress();
				case "play+": onPlus();
				case "export": onExport();
				case "import": onImport();
				case "delete": onDel();
			}
		}
	}
	
	function init() : Void {
	
	}

	function onPlus() : Void {
		#if debug
		//trace("press plus " + id);
		#end
	}

	function onPress() : Void {
		#if debug
		/*trace("press " + id);*/
		#end
		
		FlxG.switchState(new PlayState());
	}

	function cleanSlot() : Void {
		valid = false;
	}

	function onExport() : Void {
	}

	function onImport() : Void {
	}

	function onDel() : Void {
	}
}