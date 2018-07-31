package state;

import data.PlayerData;
import entity.LightsLayer;
import entity.Material;
import entity.MaterialIcon;
import entity.npc.Creature;
import entity.npc.Npc;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.plugin.control.FlxControl;
import flixel.addons.plugin.control.FlxControlHandler;
import flixel.FlxG;
import map.PointMap;
import map.PointMiniMap;
import common.spriterhx.spriter.FlxSpriter;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import entity.PlayerExt;
import entity.group.Materials;
import constants.MaterialConstants;
import constants.PlayerConstants;
import constants.SystemConstants;

class SceneState extends PlayUIState
{
	//	Test specific variables
	public var player:PlayerExt;
	public var scene:PointMap;
	private var minimap:PointMiniMap;
	public var lightsLayer:LightsLayer;
	private var materials:Materials;
	public var dragMaterialIcon:MaterialIcon;
	
	//npc列表
	public var npcList:Map<Int, Npc>;
	
	//creature列表
	public var creatureList:Map<Int, Creature>;
	
	//任务列表
	public var taskList:Map<Int, Int>;
	
	override public function create():Void
	{
		//	Test specific
		if (FlxG.plugins.get(FlxControl) == null)
		{
			FlxG.plugins.add(new FlxControl());
		}
		
		//初始化
		var playerData:PlayerData = cast(FlxG.data, PlayerData);
		var sceneId = playerData.sceneId;
		npcList = new Map<Int, Npc>();
		creatureList = new Map<Int, Creature>();
		
		//	A basic scene for our ship to fly around
		scene = new PointMap(sceneId);
		
		FlxG.worldBounds.set(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.setBounds(0, 0, scene.map.width, scene.map.height);
		FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		add(scene);
		
		add(lightsLayer);
		
		minimap = new PointMiniMap(sceneId);
		add(minimap);
		
		materials = new Materials();
		add(materials);

		dragMaterialIcon = null;
		//add(dragMaterialIcon);
		
		//	Enable the plugin - you only need do this once (unless you destroy the plugin)
		lightsLayer = new LightsLayer(1.0 / 3.0, 0.7);
		lightsLayer.visible = false;
		player = new PlayerExt(20, 200, 0.3, this, lightsLayer);
		player.x = playerData.x;
		player.y = playerData.y;
		//player.elasticity = 0.8;
		player.facing = FlxObject.RIGHT;
		player.defaultFacing = FlxObject.RIGHT;
		player.offset.x = 2;
		player.offset.y = 2;
		player.play(PlayerConstants.actionIdle);
		
		//	Control the sprite
		FlxControl.create(player, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
		FlxControl.player1.setCursorControl(false, false, true, true);
		FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
		FlxControl.player1.setWASDControl();
		
		//	Because we are using the MOVEMENT_ACCELERATES type the first value is the acceleration speed of the sprite
		//	Think of it as the time it takes to reach maximum velocity. A value of 100 means it would take 1 second. A value of 400 means it would take 0.25 of a second.
		FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
		
		//	Set a downward gravity of 400px/sec
		FlxControl.player1.setGravity(0, 400);
		
		add(player);
		
		//测试用 添加 武器等装备
		materials.add(new Material(100, 20, 2, this));
		materials.add(new Material(100, 20, 3, this));
		materials.add(new Material(100, 20, 4, this));
		materials.add(new Material(100, 20, 5, this));
		materials.add(new Material(100, 20, 6, this));
		
		//是否随机地图，否则增加对应npc等
		if (sceneId != 0)
		{
			for (npc in SystemConstants.npcInScene[sceneId])
			{
				var n = new Npc(npc[0], npc[1], npc[2]);
				n.setFacing((npc[3] == 0) ? FlxObject.LEFT : FlxObject.RIGHT);
				n.setAcceleration(0, 420);
				add(n);
				npcList[npc[0]] = n;
			}
		}
		
		//初始化场景任务 顺序： 进行、可接、完成
		for (taskId in playerData.taskData.keys())
		{
			if (SystemConstants.task[taskId][12] == sceneId)
			{
				npcList[SystemConstants.task[taskId][1]].loadTask(taskId, playerData.taskData[taskId]);
			}
			
			if (SystemConstants.task[taskId][13] == sceneId && playerData.taskData[taskId][0] == SystemConstants.taskStatusDone)
			{
				npcList[SystemConstants.task[taskId][2]].loadTask(taskId, playerData.taskData[taskId]);
			}
		}
		
		//初始化 生物
		var c = new Creature(1, 500, 200, this);
		add(c);
		creatureList[1] = c;
		
		super.create();
	}
	
	override public function update():Void
	{
		super.update();
		
		minimap.updatePos(new FlxPoint(player.x, player.y));
		
		FlxG.collide(player, scene.map);
		
		for (id in npcList.keys())
		{
			FlxG.collide(npcList[id], scene.map);
		}
		
		for (id in creatureList.keys())
		{
			FlxG.collide(creatureList[id], scene.map);
		}
				
		//for (sprite in player.orderSprite)
		//{
			//FlxG.collide(sprite, scene.map);
		//}
		
		if (FlxG.keyboard.pressed("M"))
		{
			FlxG.switchState(new MapState());
		}
		
		if (FlxG.keyboard.pressed("b"))
		{
			scene.weather.visible = true;
		}
		if (FlxG.keyboard.pressed("n"))
		{
			scene.weather.visible = false;
		}
		
		if (FlxG.keyboard.pressed("c"))
		{
			lightsLayer.visible = true;
		}
		if (FlxG.keyboard.pressed("x"))
		{
			lightsLayer.visible = false;
		}
		
		if (FlxG.keyboard.pressed("t"))
		{
			player.setText("100");
		}
		
		if (FlxG.keyboard.pressed("ESCAPE"))
		{
			rightBar.packageWindow.disappear();
			rightBar.releaseButton();
		}
		
		if (player.x < 0)
		{
			player.x = 0;
		}
				
		if (FlxG.mouse.pressed && dragMaterialIcon == null && player.holdStatus == PlayerConstants.holdStatusCollectionTool)
		{
			if (player.touching == FlxObject.FLOOR)
			{
				player.velocity.x = 0;
			}
			
			if (rightBar.packageWindow.inBackground(FlxG.mouse.x, FlxG.mouse.y) == false && shortcutsBar.inBackground(FlxG.mouse.x, FlxG.mouse.y) == false)
			{
				player.play(PlayerConstants.actionDo, player.position);
				
				if (player.inDistance(FlxG.mouse.x, FlxG.mouse.y) == true)
				{
					var tiledIndex:Int = scene.map.getTile(Std.int(FlxG.mouse.x / 16), Std.int(FlxG.mouse.y / 16));
					if (tiledIndex != 0)
					{
						scene.map.setTile(Std.int(FlxG.mouse.x / 16), Std.int(FlxG.mouse.y / 16), 0); //FlxG.keys.pressed.SHIFT ? 0 : 1
						materials.add(new Material(FlxG.mouse.x, FlxG.mouse.y - 16, MaterialConstants.tiledToMaterials[tiledIndex], this));
					}
				}
			}
		}
		else
		{
			if (player.touching == FlxObject.FLOOR)
			{
				if (player.velocity.x != 0)
				{
					player.play(PlayerConstants.actionRun, player.position);
				}
				else
				{
					player.play(PlayerConstants.actionIdle, player.position);
				}
			}
			else if (player.velocity.y < 0)
			{
				player.play(PlayerConstants.actionRun, player.position);
			}
			else
			{
				player.play(PlayerConstants.actionIdle, player.position);
			}
		}
	}
	
	override public function destroy():Void
	{
		//	Important! Clear out the plugin otherwise resources will get messed right up after a while
		FlxControl.clear();
		
		super.destroy();
	}
	
	/**
	 * 任务栏取消任务
	 * @param	taskId
	 */
	public function cancelTask(taskId:Int):Void
	{
		//修改playerdata
		cast(FlxG.data, PlayerData).taskData[taskId] = [SystemConstants.taskStatusTrigger, 0];
		
		//任务完成者
		if (npcList.exists(SystemConstants.task[taskId][2]) == true)
		{
			npcList[SystemConstants.task[taskId][2]].removeTask(taskId);
		}
		
		//任务接收者
		if (npcList.exists(SystemConstants.task[taskId][1]) == true)
		{
			npcList[SystemConstants.task[taskId][1]].loadTask(taskId, [SystemConstants.taskStatusTrigger, 0]);
		}
		
		rightBar.taskWindow.loadTaskList(SystemConstants.taskStatusAccept);
	}
}
