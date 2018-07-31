package ui;

import data.PlayerData;
import flixel.addons.ui.FlxUIButton;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import state.BaseState;
import state.SceneState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import flixel.FlxG;
import constants.SystemConstants;

class DialogBox extends FlxGroup
{
	private var state:SceneState;
	private var dialogBox:FlxSprite;
	private var dialog:FlxText;
	private var index:Int;
	private var npcId:Int;
	private var taskList:Map<Int, Array<Int>>;
	private var content:Array<String>;
	private var isSelect:Bool;
	private var currentTriggerTaskId:Int;
	
	// Construtor
	public function new(id:Int, list:Map<Int, Array<Int>>, state:BaseState):Void 
	{
		super();
		
		//初始化
		npcId = id;
		taskList = list;
		content = new Array<String>();
		this.state = cast(state, SceneState);
		
		//Dialog Box
		dialogBox = new FlxSprite(120, 295);
		dialogBox.loadGraphic("assets/ui/dialog_box.png", false, false, 351, 90);
		add(dialogBox);
		
		dialog = new FlxText(155, 300, 351, "", 12, false);
		dialog.color = FlxColor.BLACK;
		add(dialog);
		
		state.getLyrSprites().add(this);
		
		loadDialogBox();
	}
	
	override public function update():Void
	{
		super.update();
		
		if (isSelect == false && FlxG.mouse.justPressed && visible == true)
		{
			if ((FlxG.mouse.x > dialogBox.x && FlxG.mouse.x < dialogBox.x + dialogBox.width) && (FlxG.mouse.y > dialogBox.y && FlxG.mouse.y < dialogBox.y + dialogBox.height))
			{
				if (index >= content.length)
				{
					visible = false;
				}
				else
				{
					//会话ui
					dialog.text = (((index % 2) == 0) ? SystemConstants.npc[npcId][0] : cast(FlxG.data, PlayerData).name) + " : " + content[index++];
					
					//这里必须是等于length
					if (currentTriggerTaskId != 0 && index == content.length)
					{
						if (taskList[currentTriggerTaskId][0] == SystemConstants.taskStatusTrigger)
						{
							var button = new FlxUIButton(300, 400, "接受", handleTask, [currentTriggerTaskId, SystemConstants.taskStatusTrigger]);
							button.label.size = 16;
							button.label.systemFont = "隶书";
							button.label.color = 0xffffffff;
							button.resize(300, 20);
							add(button);
						}
						else if (taskList[currentTriggerTaskId][0] == SystemConstants.taskStatusDone)
						{
							var button = new FlxUIButton(300, 400, "完成", handleTask, [currentTriggerTaskId, SystemConstants.taskStatusDone]);
							button.label.size = 16;
							button.label.systemFont = "隶书";
							button.label.color = 0xffffffff;
							button.resize(300, 20);
							add(button);
						}
					}
				}
			}
		}
	}
	
	/**
	 * 对话框选择改变相应内容
	 * @param	task
	 */
	public function changeContent(taskId:Int = 0, status:Int = 0):Void
	{
		if (taskId == 0)
		{
			visible = false;
		}
		else
		{
			if (status == SystemConstants.taskStatusAccept)
			{
				content = SystemConstants.task[taskId][4];
			}
			else if (status == SystemConstants.taskStatusDone)
			{
				currentTriggerTaskId = taskId;
				content = SystemConstants.task[taskId][4];
			}
			else if (status == SystemConstants.taskStatusTrigger)
			{
				currentTriggerTaskId = taskId;
				content = SystemConstants.task[taskId][5];
			}
			
			isSelect = false;
		}
		
		forEach(removeFromMember);
		
		dialog.text = SystemConstants.npc[npcId][0] + " : " + content[index++];
	}
	
	/**
	 * 移除button类
	 * @param	Object
	 */
	private function removeFromMember(Object:Dynamic):Void
	{
		if (Std.is(Object, FlxUIButton))
		{
			remove(Object);
		}
	}
	
	/**
	 * 初始化对话框
	 */
	public function loadDialogBox():Void
	{
		//初始化
		index = 0;
		isSelect = false;
		currentTriggerTaskId = 0;
		
		var length = 0;
		for (taskId in taskList.keys())
		{
			length++;
		}
		
		if (length > 1)
		{
			isSelect = true;
			var i = 1;
			for (taskId in taskList.keys())
			{
				var taskString = "";
				if (taskList[taskId][0] == SystemConstants.taskStatusTrigger)
				{
					taskString = "（新）";
				}
				else if (taskList[taskId][0] == SystemConstants.taskStatusAccept)
				{
					taskString = "（进行中）";
				}
				else if (taskList[taskId][0] == SystemConstants.taskStatusDone)
				{
					taskString = "（完成）";
				}
				
				var button = new FlxUIButton(155, 300 + i * 30, i + "、" + SystemConstants.task[taskId][3] + taskString, changeContent, [taskId, taskList[taskId][0]]);
				button.label.size = 16;
				button.label.systemFont = "隶书";
				button.label.color = 0xffffffff;
				button.resize(300, 20);
				add(button);
				
				i++;
			}
			
			var button = new FlxUIButton(155, 300 + (length + 1) * 30, "再见.", changeContent);
			button.label.size = 16;
			button.label.systemFont = "隶书";
			button.label.color = 0xffffffff;
			button.resize(300, 20);
			add(button);
			
			return;
		}
		
		if (length == 0)
		{
			content = SystemConstants.npc[npcId][4];
		}
		else if (length == 1)
		{
			if (taskList.iterator().next()[0] == SystemConstants.taskStatusAccept)
			{
				content = SystemConstants.task[taskList.keys().next()][4];
			}
			else if (taskList.iterator().next()[0] == SystemConstants.taskStatusDone)
			{
				currentTriggerTaskId = taskList.keys().next();
				content = SystemConstants.task[taskList.keys().next()][6];
			}
			else if (taskList.iterator().next()[0] == SystemConstants.taskStatusTrigger)
			{
				currentTriggerTaskId = taskList.keys().next();
				content = SystemConstants.task[taskList.keys().next()][5];
			}
			
			if (content.length == 1 && currentTriggerTaskId != 0)
			{
				if (taskList[currentTriggerTaskId][0] == SystemConstants.taskStatusTrigger)
				{
					var button = new FlxUIButton(300, 400, "接受", handleTask, [currentTriggerTaskId, SystemConstants.taskStatusTrigger]);
					button.label.size = 16;
					button.label.systemFont = "隶书";
					button.label.color = 0xffffffff;
					button.resize(300, 20);
					add(button);
				}
				else if (taskList[currentTriggerTaskId][0] == SystemConstants.taskStatusDone)
				{
					var button = new FlxUIButton(300, 400, "完成", handleTask, [currentTriggerTaskId, SystemConstants.taskStatusDone]);
					button.label.size = 16;
					button.label.systemFont = "隶书";
					button.label.color = 0xffffffff;
					button.resize(300, 20);
					add(button);
				}
			}
		}
		
		dialog.text = SystemConstants.npc[npcId][0] + " : " + content[index++];
	}
	
	/**
	 * 重置对话框
	 * @param	id
	 * @param	list
	 */
	public function reset(id:Int, list:Map<Int, Array<Int>>):Void
	{
		forEach(removeFromMember);
		
		visible = true;
		npcId = id;
		taskList = list;
		dialog.text = "";
		
		loadDialogBox();
	}
	
	/**
	 * 接收任务处理方法
	 * @param	taskId
	 */
	public function handleTask(taskId:Int, status:Int):Void
	{
		if (status == SystemConstants.taskStatusTrigger)
		{
			cast(FlxG.data, PlayerData).taskData[taskId][0] = SystemConstants.taskStatusAccept;
			
			//如果提交者是自己
			if (SystemConstants.task[taskId][2] == npcId)
			{
				state.npcList[npcId].loadTask(taskId, [SystemConstants.taskStatusDone, 0]);
			}
			//提交者不是自己
			else
			{
				state.npcList[npcId].loadTask(taskId, [SystemConstants.taskStatusAccept, 0]);
				if (state.npcList.exists(SystemConstants.task[taskId][2]) == true)
				{
					if (SystemConstants.task[taskId][14] == SystemConstants.taskTypeSubmit)
					{
						state.npcList[SystemConstants.task[taskId][2]].loadTask(taskId, [SystemConstants.taskStatusDone, 0]);
					}
				}
			}
		}
		else if (status == SystemConstants.taskStatusDone)
		{
			cast(FlxG.data, PlayerData).taskData.remove(taskId);
			state.npcList[npcId].removeTask(taskId);
			
			//接收者在该场景
			if (state.npcList.exists(SystemConstants.task[taskId][1]) == true)
			{
				state.npcList[SystemConstants.task[taskId][1]].removeTask(taskId);
			}
		}
		
		visible = false;
	}
	
	// Adiciona um componente
	public function addComponent(Component:Dynamic):Void {
		add(Component);
	}
	
	public function createDefaultButtonOK():Void {
		addComponent(new FlxButton(410, 365, "ok", function() {
			destroy();
		}));
	}
}