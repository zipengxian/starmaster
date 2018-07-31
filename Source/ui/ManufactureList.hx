package ui;
import entity.MaterialElement;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import constants.MaterialConstants;
import flixel.FlxG;

/**
 * ...
 * @author blaze
 */
class ManufactureList extends FlxSpriteGroup
{
	private var _window:ManufactureWindow;
	
	public var row:Int = 5;
	public var idArray:Array<Int>;
	//当前的id
	public var currentId:Int;
	
	public function new(X:Float = 0, Y:Float = 0, materialIdArray:Array<Int>, w:ManufactureWindow) 
	{
		super(X, Y);
		
		_window = w;
		idArray = materialIdArray;
		
		var manufactureImage = null;
		var manufactureName = null;
		
		var i = 0;
		for (id in materialIdArray)
		{
			manufactureImage = new MaterialElement(0, i);
			manufactureImage.loadElement(id);
			add(manufactureImage);
			manufactureName = new FlxText(30, i, 100, MaterialConstants.materials[id][MaterialConstants.materialIndexName], 16, false);
			add(manufactureName);
			
			i = i + 20;
		}
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (visible == true)
		{
			var x = FlxG.mouse.x - x - FlxG.camera.scroll.x;
			var y = FlxG.mouse.y - y - FlxG.camera.scroll.y;
			
			var i = Math.floor(y / 20);
			if (x > 0 && x < 300 && i >= 0 && i < idArray.length)
			{
				if (idArray[i] != currentId || (idArray[i] == currentId && _window.elementWindow.visible == false))
				{
					//显示element window
					_window.components.remove(_window.elementWindow);
					_window.elementWindow = new ManufactureElementWindow(FlxG.mouse.x + 20, FlxG.mouse.y);
					_window.elementWindow.load(idArray[i], _window);
					_window.components.add(_window.elementWindow);
					
					currentId = idArray[i];
				}
				
				//点击上了
				if (FlxG.mouse.justPressed == true)
				{
					//显示右边的信息
					_window.manufactureImage.loadElement(idArray[i]);
					_window.manufactureName.text = MaterialConstants.materials[idArray[i]][MaterialConstants.materialIndexName];
					_window.manufactureDescription.text = MaterialConstants.materials[idArray[i]][MaterialConstants.materialIndexDiscribe];
				}
				
				_window.elementWindow.visible = true;
			}
			else
			{
				if (_window.elementWindow != null)
				{
					_window.elementWindow.visible = false;
				}
			}
		}
	}
	
}