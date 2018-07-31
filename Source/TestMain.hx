package ;

import flash.display.Sprite;
import flash.geom.Matrix;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFieldType;

class TestMain extends Sprite {

    public function new () {
		super ();
		
		//var format = new TextFormat ("", 18, 0x000000);

		var textField = new TextField ();
		//textField.defaultTextFormat = format;
		//textField.selectable = true;

		textField.width = 320;
		textField.height = 120;
		textField.x = 20;
		textField.y = 20;
		textField.background = true;
		textField.backgroundColor = 0xffffffff;

		//textField.text = "Hello World!你好.";

		textField.type = TextFieldType.INPUT;
		//textField.multiline = true;
		//textField.embedFonts = true;
		//textField.wordWrap = true;
		//textField.setTextFormat(new TextFormat("assets/fonts/SIMFANG.TTF", 18, 0x000000));
		//textField.appendText("你好");
		//textField.maxChars = 100;

		addChild (textField);
		
		//var r:Sprite = new Sprite();
		//r.graphics.beginFill(0xaaaaff);
		//r.graphics.drawRect(0,0,1000,1000);
		//addChild(r);
		//
		//var b:Sprite = new Sprite();
		//b.graphics.beginFill(0);
		//b.graphics.drawRect(0,0,100,100);
		//b.graphics.drawCircle(0,0,6);
		//b.graphics.endFill();
		//addChild(b);
		//b.x = b.y = 100;
		//trace (b.transform.matrix);
		//
		//var a:Sprite = new Sprite();
		//a.graphics.beginFill(0);
		//a.graphics.drawRect(0,0,100,100);
		//a.graphics.drawCircle(0,0,6);
		//a.graphics.endFill();
		//addChild(a);
		//a.x = a.y = 100;
		//trace (a.transform.matrix);
//
		//var m:Matrix = a.transform.matrix.clone();
		//var dx :Float = m.tx;
		//var dy:Float = m.ty;
		//m.translate(-dx , -dy);            //把位移归零
		//m.translate(-50,-50);              //宽高的一半，设置旋转点到中心点
		//m.rotate(45/180*3.14);             //旋转45度
		//m.translate(50,50);
		//m.translate(dx , dy);       //恢复位移
		//a.transform.matrix = m;
//
		//trace (a.x, a.y);
		//trace (a.transform.matrix);
    }
}