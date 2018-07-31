package common.spriterhx.textures;
import flash.geom.Matrix;
import common.spriterhx.utils.IDisposable;
import flash.geom.Rectangle;
import flash.display.BitmapData;

/**
 * @author SlavaRa
 */

interface ITextureAtlas extends IDisposable {
	var name(default, null):String;
	var helpMatrix:Matrix;
	function getRegion(name:String):Rectangle;
	function createTextureDisplay(fullName:String, pivotX:Float = 0, pivotY:Float = 0, angle:Float = 0):Dynamic;
	function createBitmapData(fullName:String, pivotX:Float = 0, pivotY:Float = 0, angle:Float = 0):Dynamic;
	var bitmapData(default, null):BitmapData;
}