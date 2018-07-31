package util;
import flash.display.BitmapData;
import flash.geom.Matrix;

/**
 * ...
 * @author blaze
 */
class BitmapDataUtil
{
	//水平翻转一个位图
	public static function flipHorizontal(bmpData:BitmapData, transparent:Bool = true, fillColor:Int = 0):BitmapData
	{
		var matrix:Matrix = new Matrix();
		matrix.a = -1;
		matrix.tx = bmpData.width;
		var bmpData_:BitmapData = new BitmapData(bmpData.width, bmpData.height, transparent, fillColor);
		bmpData_.draw(bmpData, matrix);
		return bmpData_;
	}
	
	//垂直翻转一个位图
	public static function flipVertical(bmpData:BitmapData, transparent:Bool = true, fillColor:Int = 0):BitmapData
	{
		var matrix:Matrix = new Matrix();
		matrix.d = -1;
		matrix.ty = bmpData.height;
		var bmpData_:BitmapData = new BitmapData(bmpData.width, bmpData.height, transparent, fillColor);
		bmpData_.draw(bmpData, matrix);
		return bmpData_;
	}
	
	//缩放位图
	public static function scaleBitmapData(bmpData:BitmapData, scaleX:Float, scaleY:Float):BitmapData
	{
		var matrix:Matrix = new Matrix();
		matrix.scale(scaleX, scaleY);
		var bmpData_:BitmapData = new BitmapData(Std.int(scaleX * bmpData.width), Std.int(scaleY * bmpData.height), true, 0);
		bmpData_.draw(bmpData, matrix);
		return bmpData_;
	}
}