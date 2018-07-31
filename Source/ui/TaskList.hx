package ui;
import entity.MaterialElement;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import constants.MaterialConstants;
import flixel.FlxG;
import constants.SystemConstants;

/**
 * ...
 * @author blaze
 */
class TaskList extends FlxSpriteGroup
{
	private var _window:TaskWindow;
	
	public var row:Int = 5;
	//当前的id
	public var currentId:Int;
	public var taskArray:Array<Int>;
	
	public function new(X:Float = 0, Y:Float = 0, w:TaskWindow) 
	{
		super(X, Y);
		
		_window = w;
		taskArray = new Array<Int>();
	}
	
	public function load(taskList:Map<Int, Int>):Void
	{
		var i = 0;
		var taskName = null;
		
		for (member in members)
		{
			remove(member, true);
		}
		
		for (taskGroupId in taskList.keys())
		{
			taskName = new FlxText(30, i, 100, SystemConstants.taskGroup[taskGroupId][1], 16, false);
			taskArray.push(taskList.get(taskGroupId));
			add(taskName);
			
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
			if (x > 0 && x < 300 && i >= 0 && i < taskArray.length)
			{
				//点击上了
				if (FlxG.mouse.justPressed == true)
				{
					//显示右边的信息
					_window.taskRight.load(taskArray[i]);
				}
			}
		}
	}
	
}