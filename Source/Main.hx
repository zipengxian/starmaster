﻿package;

import flash.display.Shape;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.ui.Keyboard;
import flixel.FlxGame;

/**
 * @author Joshua Granick
 */
class Main extends Sprite 
{
	// Entry point
	static public function main():Void
	{	
		Lib.current.addChild(new Main());
	}
	
	public function new() 
	{
		super();
		
		if (stage != null) 
		{
			init();
		}
		else 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}
	
	private function init(?E:Event):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		initialize();
		
		//var _defaultShape:Shape = new Shape();
		//_defaultShape.graphics.beginFill(0xffffff, 1.0);
		//_defaultShape.graphics.drawCircle(200, 200, 100);
		//_defaultShape.graphics.endFill();
		//addChild(_defaultShape);
		
		var game:FlxGame = new GameClass();
		addChild(game);
	}
	
	private function initialize():Void 
	{
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
}