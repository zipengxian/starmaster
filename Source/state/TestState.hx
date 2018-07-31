package state; 

import entity.Test;
import flixel.addons.display.shapes.FlxShapeLine;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxPoint;
import flixel.util.FlxTimer;
import flixel.FlxG;
import TimeBox;
import ui.module.ScrollBar;
import ui.ShortcutsBar;
import ui.RightBar;
import flash.display.Graphics;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;

class TestState extends FlxState
{
	//First, you need a timer
	public var fader:FlxTimer;
	public var ache:TimeBox;
	
	override public function create():Void 
	{
		super.create();
		FlxG.mouse.show();
		FlxG.camera.bgColor = FlxColor.GOLDEN;
		
		var lineStyle:LineStyle = { thickness:10, color:0xffffffff };
		var testLine:FlxShapeLine = new FlxShapeLine(10, 10, new FlxPoint(0, 0), new FlxPoint(100, 100), lineStyle);
		var testLine2:FlxShapeLine = new FlxShapeLine(200, 10, new FlxPoint(0, 100), new FlxPoint(100, 0), lineStyle);
		
		var lineStyle2:LineStyle = { thickness:1, color:0xffffffff };
		var testLine3:FlxShapeLine = new FlxShapeLine(10, 210, new FlxPoint(0, 0), new FlxPoint(100, 100), lineStyle2);
		var testLine4:FlxShapeLine = new FlxShapeLine(200, 210, new FlxPoint(0, 100), new FlxPoint(100, 0), lineStyle2);
		
		add(testLine);
		add(testLine2);
		add(testLine3);
		add(testLine4);
		
		var s:FlxSprite = new FlxSprite(200, 200);
		s.makeGraphic(100, 100, FlxColor.WHITE);
		s.scrollFactor.x = 200;
		s.scrollFactor.y = 200;
		add(s);
		
		var s1:FlxSprite = new FlxSprite(200, 400);
		s1.makeGraphic(100, 100, FlxColor.WHITE);
		add(s1);
		
		var smoothingSlider:ScrollBar = new ScrollBar(testLine, "y", FlxG.width - 180, 50, 0, 100, 150);
		smoothingSlider.nameLabel.text = "Smoothing Iterations";
		add(smoothingSlider);
		
		//fader = new FlxTimer(1000); //or however long you want the box to sho
		
		//create the box itself just in case
		//ache = new TimeBox(0, 120, 150, "Hi"); //"Hi" can be whatever you want
		//add(ache);
		//ache.kill();
		//var g:Graphics;
		//var soundArea = new Sprite();
		//g = soundArea.graphics;
		// draw the "off" bars
		//g.lineStyle(2,0x808080);
		//g.moveTo(0,-2);
		//g.curveTo(3,0,0,2);
		//g.moveTo(4,-3);
		//g.curveTo(8,0,4,3);
		//g.moveTo(8,-4);
		//g.curveTo(12,0,8,4);
		//g.moveTo(12,-5);
		//g.curveTo(16,0,12,5);
		//g.moveTo(16,-6);
		//g.curveTo(21,0,16,6);
		//g.moveTo(20,-7);
		//g.curveTo(26,0,20,7);
		//g.moveTo(24,-8);
		//g.curveTo(31,0,24,8);
		
		//var test:FlxSprite = new FlxSprite(70, 70);
		//test.loadGraphic(g);
		//test.alpha = 0;
		//test.makeGraphic(FlxG.width, FlxG.height, 0x00000000);
		//FlxSpriteUtil.drawLine(test, test.x, test.y, test.x + 205, test.y + 200, FlxColor.RED, 1);
		//add(test);
		
		//var t:Test = new Test(100, 100);
		//add(t);
	}
	
	override public function update():Void 
	{
		super.update();
		
		//Conditions met for fade box
		//if (FlxG.mouse.justPressed == true)
		//{
			//fader = FlxTimer.start(2, onTimer);
			//
			//ache = new TimeBox(0, 120, 150, "Hi");
			//add(ache);
		//}
		
		
	}
	
	public function onTimer(Timer:FlxTimer) {
		ache.kill();
	}
	
}

//
//
//@Override
//public boolean onKeyMultiple(final int inKeyCode, int repeatCount, KeyEvent event) {
	//Log.v("VIEW","onKeyMultiple " + event.getCharacters());
	// Get the Unicode characters from virtual keyboard
	//String chars = event.getCharacters();
	//if (chars != null && chars.length()>0) { // If we have characters
		//final MainView me = this;
		// By now, we use just the first one... I don't know if ther might be more than one...
		//final int keyCode = chars.charAt(0);
		//if (keyCode != 0) {
			//queueEvent(new Runnable() {
			// This method will be called on the rendering thread:
			//public void run() {
				// Simulate key down and up...
				//Log.d("NMEVIEW", "SIMULATING KEYUPDOWN");
				//me.HandleResult(NME.onKeyChange(keyCode,true));
				//me.HandleResult(NME.onKeyChange(keyCode,false));
			//}});
			//return true;
		//}
	//}
	//return super.onKeyMultiple(inKeyCode, repeatCount, event);
//}
//
//@Override
//public boolean onKeyMultiple(final int inKeyCode, int repeatCount, KeyEvent event) {
	//String s = event.getCharacters();
	//if (s == null || s.length() == 0) return super.onKeyMultiple(inKeyCode, repeatCount, event);
	//final char[] cc = s.toCharArray();
	//int cnt = 0;
	//for (int i = cc.length; --i >= 0; cnt += cc[i] != 0 ? 1 : 0);
	//if (cnt == 0) return super.onKeyMultiple(inKeyCode, repeatCount, event);
	//final MainView me = this;
	//queueEvent(new Runnable() {
		// This method will be called on the rendering thread:
		//public void run() {
			//for (int i = 0, n = cc.length; i < n; i++) {
				//int keyCode;
				//if ((keyCode = cc[i]) != 0) {
					// Simulate key down and up...
					//me.HandleResult(NME.onKeyChange(keyCode, true));
					//me.HandleResult(NME.onKeyChange(keyCode, false));
				//}
			//}
		//}
	//});
	//return true;
//}