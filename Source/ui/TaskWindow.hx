package ui;

import entity.MaterialElement;
import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.addons.ui.FlxUIButton;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxG;
import ui.module.SelectNumber;
import constants.MaterialConstants;
import data.PlayerData;
import state.PlayUIState;
import constants.SystemConstants;

class TaskWindow extends BaseUI{
	public var backgroundUI:TaskBackgroundUI;
	
	//右边
	public var taskRight:TaskRight;
	
	//左边
	public var taskList:TaskList;
	
	// Construtor
	override public function new(baseState:PlayUIState):Void {
		super(baseState);
		
		components = new FlxGroup();
		state = baseState;
		
		backgroundUI = new TaskBackgroundUI(this);
		createElements();
		
		state.add(backgroundUI);
		state.add(components);
	}
	
	/**
	 * 创建ui
	 */
	private function createElements():Void
	{
		//左边
		var button1 = new FlxUIButton(backgroundUI.background.x + 20, backgroundUI.background.y + 20, "进行中", loadTaskList, [SystemConstants.taskStatusAccept]);
		button1.label.size = 16;
		button1.label.systemFont = "隶书";
		button1.label.color = 0xffffffff;
		button1.resize(60, 20);
		components.add(button1);
		
		var button2 = new FlxUIButton(backgroundUI.background.x + 80, backgroundUI.background.y + 20, "已完成", loadTaskList, [SystemConstants.taskStatusDone]);
		button2.label.size = 16;
		button2.label.systemFont = "隶书";
		button2.label.color = 0xffffffff;
		button2.resize(60, 20);
		components.add(button2);
		
		var button3 = new FlxUIButton(backgroundUI.background.x + 140, backgroundUI.background.y + 20, "可接取", loadTaskList, [SystemConstants.taskStatusTrigger]);
		button3.label.size = 16;
		button3.label.systemFont = "隶书";
		button3.label.color = 0xffffffff;
		button3.resize(60, 20);
		components.add(button3);
		
		taskList = new TaskList(backgroundUI.background.x + 20, backgroundUI.background.y + 60, this);
		taskList.load(taskParse(cast(FlxG.data, PlayerData).taskData, SystemConstants.taskStatusAccept));
		components.add(taskList);
		
		//右边
		taskRight = new TaskRight(backgroundUI.background.x + 300, backgroundUI.background.y + 20, this);
		components.add(taskRight);
	}
	
	/**
	 * 解析任务列表
	 * @param	taskList
	 * @param	status
	 * @return
	 */
	private function taskParse(taskList:Map < Int, Array<Int> >, status:Int):Map<Int, Int>
	{
		var data = new Map < Int, Int > ();
		for (id in taskList.keys())
		{
			if (taskList[id][0] == status)
			{
				data.set(SystemConstants.task[id][0], id);
			}
		}
		
		return data;
	}
	
	/**
	 * 加载任务列表
	 * @param	select
	 */
	public function loadTaskList(select:Int):Void
	{
		if (select == SystemConstants.taskStatusAccept)
		{
			taskList.load(taskParse(cast(FlxG.data, PlayerData).taskData, SystemConstants.taskStatusAccept));
			taskRight.visible = false;
		}
		else if (select == SystemConstants.taskStatusDone)
		{
			taskList.load(taskParse(cast(FlxG.data, PlayerData).taskData, SystemConstants.taskStatusDone));
			taskRight.visible = false;
		}
		else if (select == SystemConstants.taskStatusTrigger)
		{
			taskList.load(taskParse(cast(FlxG.data, PlayerData).taskData, SystemConstants.taskStatusTrigger));
			taskRight.visible = false;
		}
	}
	
	/**
	 * 顶层显示
	 */
	public function displayTop()
	{
		state.remove(backgroundUI, true);
		state.remove(components, true);
		state.add(backgroundUI);
		state.add(components);
	}
	
	public function appear():Void {
		taskList.load(taskParse(cast(FlxG.data, PlayerData).taskData, SystemConstants.taskStatusAccept));
		taskRight.visible = false;
		components.visible = true;
		backgroundUI.visible = true;
	}
	
	public function disappear():Void {
		components.visible = false;
		backgroundUI.visible = false;
	}
	
	public function getBackground():FlxBasic {
		return backgroundUI.getFirstExisting();
	}
	
	public function getVisible():Bool {
		return backgroundUI.visible;
	}
}