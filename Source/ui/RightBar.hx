package ui;

import flixel.addons.ui.FlxUIButton;
import flixel.group.FlxGroup;
import state.PlayUIState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxButton;

class RightBar extends BaseUI{
	public var taskWindow:TaskWindow;
	public var manufactureWindow:ManufactureWindow;
	public var packageWindow:PackageWindow;
	
	// Construtor
	override public function new(baseState:PlayUIState):Void {	
		super(baseState);
		components = new FlxGroup();
		state = baseState;
		
		var background:FlxSprite = new FlxSprite(FlxG.width - 40, FlxG.height/2);
		background.makeGraphic(40, Math.floor(FlxG.height/2) - 60, 0xff9999ff);
		background.scrollFactor.set(0, 0);
		components.add(background);
		//state.getLyrSprites().add(background);
		
		//for (i in 0...5){
			//var button = new FlxUIButton(FlxG.width - 30, FlxG.height/2 + 20 + i * 30, "a", _onClickPackageButton);
			//button.loadGraphicSlice9(null, 20, 0, null, -1, true);
			//button.scrollFactor.set(0, 0);
			//components.add(button);
		//}
		
		var button = new FlxUIButton(FlxG.width - 30, FlxG.height/2 + 20, "a", _onClickPackageButton);
		button.loadGraphicSlice9(null, 20, 0, null, -1, true);
		button.scrollFactor.set(0, 0);
		components.add(button);
		
		button = new FlxUIButton(FlxG.width - 30, FlxG.height/2 + 20 + 1 * 30, "a", _onClickManufactureButton);
		button.loadGraphicSlice9(null, 20, 0, null, -1, true);
		button.scrollFactor.set(0, 0);
		components.add(button);
		
		button = new FlxUIButton(FlxG.width - 30, FlxG.height/2 + 20 + 2 * 30, "a", _onClickTaskButton);
		button.loadGraphicSlice9(null, 20, 0, null, -1, true);
		button.scrollFactor.set(0, 0);
		components.add(button);
		
		state.add(components);
		
		packageWindow = new PackageWindow(state);
		packageWindow.disappear();
		
		manufactureWindow = new ManufactureWindow(state);
		manufactureWindow.disappear();
		
		taskWindow = new TaskWindow(state);
		taskWindow.disappear();
	}
	
	private function _onClickPackageButton(params:Array<Dynamic> = null):Void {
		FlxG.log.add("FlxUI._onClickButton(" + params + ")");
		
		if (packageWindow.getVisible() == false)
		{
			packageWindow.displayTop();
			packageWindow.appear();
		}
		else
		{
			packageWindow.disappear();
		}
	}
	
	private function _onClickTaskButton(params:Array<Dynamic> = null):Void {
		FlxG.log.add("FlxUI._onClickButton(" + params + ")");
		
		if (taskWindow.getVisible() == false)
		{
			taskWindow.displayTop();
			taskWindow.appear();
		}
		else
		{
			taskWindow.disappear();
		}
	}
	
	private function _onClickManufactureButton(params:Array<Dynamic> = null):Void {
		FlxG.log.add("FlxUI._onClickButton(" + params + ")");
		
		if (manufactureWindow.getVisible() == false)
		{
			manufactureWindow.displayTop();
			manufactureWindow.appear();
		}
		else
		{
			manufactureWindow.disappear();
		}
	}
	
	public function releaseButton()
	{
		for (i in 0...2)
		{
			cast(components.members[i + 1], FlxUIButton).toggled = false;
		}
	}
}