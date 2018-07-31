package ui;
import entity.MaterialElement;
import flixel.text.FlxText;
import flixel.addons.ui.FlxUIButton;
import flixel.group.FlxSpriteGroup;
import constants.SystemConstants;
import state.SceneState;
import flixel.FlxG;
import data.PlayerData;

/**
 * ...
 * @author blaze
 */
class TaskRight extends FlxSpriteGroup
{
	public var taskId:Int;
	public var taskName:FlxText;
	public var taskDescription:FlxText;
	public var cancelButton:FlxUIButton;
	
	private var _window:TaskWindow;
	private var rewardGoodsDesc:FlxText;
	private var rewardMoneyDesc:FlxText;
	private var rewardImage1:MaterialElement;
	private var rewardImage2:MaterialElement;
	private var rewardImage3:MaterialElement;
	private var rewardGoods1:FlxText;
	private var rewardGoods2:FlxText;
	private var rewardGoods3:FlxText;
	
	public function new(X:Float = 0, Y:Float = 0, w:TaskWindow)
	{
		super(X, Y);
		
		_window = w;
		taskId = 0;
		
		taskName = new FlxText(0, 0, 60, "", 16);
		taskName.systemFont = "隶书";
		taskName.color = 0xffffffff;
		add(taskName);
		taskDescription = new FlxText(0, 50, 200, "", 16, false);
		add(taskDescription);
		
		cancelButton = new FlxUIButton(0, 320, "取消任务", cancelClick);
		cancelButton.label.size = 16;
		cancelButton.label.systemFont = "隶书";
		cancelButton.label.color = 0xffffffff;
		cancelButton.resize(100, 20);
		add(cancelButton);
		
		rewardGoodsDesc = new FlxText(0, 200, 200, "奖励物品", 16, false);
		rewardImage1 = new MaterialElement(0, 220);
		rewardImage2 = new MaterialElement(50, 220);
		rewardImage3 = new MaterialElement(100, 220);
		rewardGoods1 = new FlxText(30, 220, 200, "", 16, false);
		rewardGoods2 = new FlxText(80, 220, 200, "", 16, false);
		rewardGoods3 = new FlxText(130, 220, 200, "", 16, false);
		rewardMoneyDesc = new FlxText(0, 250, 200, "奖励金钱", 16, false);
		
		add(rewardGoodsDesc);
		add(rewardImage1);
		add(rewardImage2);
		add(rewardImage3);
		add(rewardGoods1);
		add(rewardGoods2);
		add(rewardGoods3);
		add(rewardMoneyDesc);
		
		visible = false;
	}
	
	/**
	 * 取消任务
	 */
	private function cancelClick():Void
	{
		if (taskId == 0)
		{
			return;
		}
		
		cast(_window.state, SceneState).cancelTask(taskId);
	}
	
	public function load(taskId:Int):Void
	{
		visible = true;
		taskName.text = SystemConstants.task[taskId][3];
		taskDescription.text = SystemConstants.task[taskId][4];
		this.taskId = taskId;
		
		rewardGoods1.text = "";
		rewardGoods2.text = "";
		rewardGoods3.text = "";
		rewardImage1.visible = false;
		rewardImage2.visible = false;
		rewardImage3.visible = false;
		
		var status = cast(FlxG.data, PlayerData).taskData[taskId][0];
		if (status != SystemConstants.taskStatusAccept)
		{
			cancelButton.visible = false;
		}
		else
		{
			cancelButton.visible = true;
		}
		
		rewardMoneyDesc.text = rewardMoneyDesc.text + SystemConstants.task[taskId][8];
		
		var i = 0;
		var goodsList:Array<Array<Int>> = SystemConstants.task[taskId][9];
		for (reward in goodsList)
		{
			if (i == 0)
			{
				rewardImage1.visible = true;
				rewardImage1.loadElement(reward[0]);
				rewardGoods1.text = "X" + reward[1];
			}
			else if (i == 1)
			{
				rewardImage2.visible = true;
				rewardImage2.loadElement(reward[0]);
				rewardGoods2.text = "X" + reward[1];
			}
			else if (i == 2)
			{
				rewardImage3.visible = true;
				rewardImage3.loadElement(reward[0]);
				rewardGoods3.text = "X" + reward[1];
			}
			else
			{
				break;
			}
			i++;
		}
	}
	
}