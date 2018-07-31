package ui;

import entity.group.Shortcuts;
import entity.MaterialIcon;

import flixel.FlxSprite;
import state.PlayUIState;
import flixel.FlxG;
import ui.ShortcutsBackgroundUI;
import state.SceneState;

class ShortcutsBar {
	private var _backgroundUI:ShortcutsBackgroundUI;
	public var open:Bool;
	public var row:Int;
	public var components:Shortcuts;
	public var position:Array<Array<Float>>;//[x ,y ,0]  0为空，1为非空
	public var data:Map < Int, MaterialIcon >;
	
	public var rowNumber:Int = 10;
	public var state:SceneState;
	
	// Construtor
	public function new(baseState:PlayUIState, row:Int, open:Bool = false):Void {
		this.row = row;
		this.open = open;
		state = cast(baseState, SceneState);
		
		components = new Shortcuts();
		_backgroundUI = new ShortcutsBackgroundUI(this);
		
		state.add(_backgroundUI);
		state.add(components);
		
		data = new Map < Int, MaterialIcon > ();
		var x = 0.0;
		var y = 0.0;
		position = [];
		//初始化
		for (i in 0 ... row * rowNumber)
		{
			if (i % rowNumber == 0)
			{
				x = 0;
			}
			y += 30 * Math.floor(i / rowNumber);
			position[i] = [x, y, 0];
			
			x += 30;
			y = 0;
		}
		
		for (key in state.playerData.shortCutData.keys())
		{
			data[key] = new MaterialIcon(_backgroundUI.background.x + position[key][0] + 2, _backgroundUI.background.y + position[key][1] + 2, state.playerData.shortCutData[key][0], state.playerData.shortCutData[key][1]);
			components.add(data[key]);
			position[key][2] = 1;
		}
	}
	
	public function destroy():Void {
		components.kill();
	}
	
	public function getComponents():Shortcuts {
		return components;
	}
	
	public function addComponent(Component:Dynamic):Void {
		components.add(Component);
	}
	
	public function inBackground(x:Float, y:Float):Bool 
	{
		return _backgroundUI.inBackground(x, y);
	}
	
	public function shortButtonRelease(index:Int):Void
	{
		position[index][2] = 0;
		_backgroundUI.shortButtonRelease(index);
	}
}