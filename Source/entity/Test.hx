package entity;

import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.FlxObject;
import flash.display.BitmapData;
import flash.display.Shape;
import flash.display.Sprite;
import flixel.FlxG;

class Test extends FlxSprite
{	
	public var moveX:Bool = false;
	public var moveY:Bool = false;
	private var startPoint:FlxPoint;
	private var endPoint:FlxPoint;
	
	public function new(X:Float, Y:Float)
	{
		super(X, Y);
	}
	
	override public function draw():Void
	{
		
		//var bitmapData : BitmapData = FlxG.camera.screen.pixels;
		//var shape : Shape = new Shape();
		//shape.graphics.lineStyle(2, 0xff0000, 0.5);
		//shape.graphics.moveTo(x, y);
		//shape.graphics.lineTo(FlxG.mouse.x, FlxG.mouse.y);
		//bitmapData.draw(shape);
		
	}
}
