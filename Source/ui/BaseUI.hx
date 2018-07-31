package ui;

import flixel.group.FlxGroup;
import state.PlayUIState;

class BaseUI {
	//button组
	public var components:FlxGroup;
	
	public var state:PlayUIState;
	
	// Construtor
	public function new(baseState:PlayUIState):Void {		
		components = new FlxGroup();
		state = baseState;
	}
	
	public function destroy():Void {
		components.kill();
	}
	
	public function getComponents():FlxGroup {
		return components;
	}
	
	public function addComponent(Component:Dynamic):Void {
		components.add(Component);
	}
}