package entity.npc;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import constants.SystemConstants;
import flixel.FlxG;
import state.SceneState;

class Npc extends FlxGroup
{
	public var id:Int;
	public var name:String;
	public var anim:String;
	
	public var npcImage:FlxSprite;
	public var npcSign:FlxSprite;
	public var taskList:Map<Int, Array<Int>>;// id, 状态
	public var signStatus:Int;
	public var boxOn:Bool;//对话框box是否该npc开启
	
	public function new(id:Int, x:Float, y:Float)
	{
		super(2);
		
		//初始化
		this.id = id;
		this.name = SystemConstants.npc[id][0];
		taskList = new Map<Int, Array<Int>>();
		boxOn = false;
		
		npcImage = new FlxSprite(x, y);
		npcImage.loadGraphic("assets/sprite/npc/" + SystemConstants.npc[id][1] + ".png", true, true ,80 ,80);
		npcImage.animation.add("idle", [0, 1, 2, 3], 5, true);
		
		npcSign = new FlxSprite(x + npcImage.width/2 - 18, y - 36);
		npcSign.loadGraphic("assets/ui/sign.png", false, false ,36 ,36);
		npcSign.animation.add("done", [0], 1, true);
		npcSign.animation.add("ready", [1], 1, true);
		npcSign.animation.add("talk", [2], 1, true);
		
		add(npcImage);
		add(npcSign);
	}
	
	override public function update():Void
	{
		super.update();
		
		npcSign.y = npcImage.y - npcSign.height;
		
		npcImage.animation.play(SystemConstants.npc[id][2]);
		
		var signAnim = "";
		if (signStatus == SystemConstants.taskStatusAccept)
		{
			signAnim = "talk";
		}
		else if (signStatus == SystemConstants.taskStatusDone)
		{
			signAnim = "done";
		}
		else if (signStatus == SystemConstants.taskStatusTrigger)
		{
			signAnim = "ready";
		}
		
		if (Math.abs(npcImage.x - cast(FlxG.state, SceneState).player.x) < 200 && Math.abs(npcImage.y - cast(FlxG.state, SceneState).player.y) < 200)
		{
			if (FlxG.mouse.justPressed && visible == true)
			{
				if ((FlxG.mouse.x > npcImage.x && FlxG.mouse.x < npcImage.x + npcImage.width) && (FlxG.mouse.y > npcImage.y && FlxG.mouse.y < npcImage.y + npcImage.height))
				{
					cast(FlxG.state, SceneState).dialogBox(id, taskList);
					boxOn = true;
				}
			}
		}
		else
		{
			if (cast(FlxG.state, SceneState).dialogBoxVisible() == false)
			{
				boxOn = false;
			}
			
			if (boxOn == true)
			{
				cast(FlxG.state, SceneState).hideDialogBox();
			}
		}
		
		if (signAnim != "")
		{
			npcSign.visible = true;
			npcSign.animation.play(signAnim);
		}
		else
		{
			npcSign.visible = false;
		}
	}
	
	/**
	 * 加载任务
	 * @param	taskId
	 * @param	status
	 */
	public function loadTask(taskId:Int, task:Array<Int>):Void
	{
		taskList.set(taskId, task);
		signStatus = task[0];
	}
	
	/**
	 * 移除该任务
	 * @param	taskId
	 */
	public function removeTask(taskId:Int):Void
	{
		taskList.remove(taskId);
		signStatus = -1;
	}
	
	public function setFacing(facing:Int):Void
	{
		npcImage.facing = facing;
	}
	
	public function setAcceleration(x:Int, y:Int):Void
	{
		npcSign.acceleration.x = x;
		npcSign.acceleration.y = y;
		npcImage.acceleration.x = x;
		npcImage.acceleration.y = y;
	}
}
