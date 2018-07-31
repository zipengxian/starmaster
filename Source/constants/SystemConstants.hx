package constants;

/**
 * ...
 * @author ...
 */
class SystemConstants
{
	//id,名称，图片
	public static var plant:Array<Array<Dynamic>> = [ 
		[1, "树1", "tree1"], 
		[2, "树2", "tree2"],
		[3, "草1", "grass1"],
	];
	
	//id,名称，图片，类型（中立，攻击性，胆小型），攻击形式（近战/近战带武器/远程），hp，物理伤害，物理暴击，物理防御，法术伤害，法术防御，法术暴击，速度
	public static var creature:Map<Int, Array<Dynamic>> = [
		1 => ["动物1", "gorilla", 1, 0, "", 20, 2, 5, 1, 0, 1, 0, 20],
		2 => ["动物2", "tree2", 1, 0, "", 20, 2, 5, 1, 0, 1, 0, 20],
		3 => ["动物3", "grass1", 2, 1, "", 20, 2, 5, 1, 0, 1, 0, 20],
	];
	
	//id => 名称，图片，默认动作，类型（普通npc、商人），默认会话，商人卖的东西，钱财
	//类型：普通npc 0， 商人 1，任务怪 2
	public static var npc:Map<Int, Array<Dynamic>> = [ 
		1 => ["npc1", "master", "idle", 0, ["小伙子，好好干", "..."], "", 100], 
		2 => ["npc2", "gorilla", "idle", 0, ["小伙子，好好干", "..."], "", 100], 
	];
	
	//scene对应的npc
	//sceneId => [npcId, 坐标, 朝向]   //朝向 0 向左，1 向右
	public static var npcInScene:Map < Int, Array<Array<Int>> > = [ 
		1 => [
			[1, 200, 100, 0],
			[2, 400, 100, 0],
		]
	];
	
	//任务组文件 id => 任务类型（主线任务、支线任务、每日任务、循环任务），类型说明（主线任务或是其他支线任务、每日任务、循环任务），等级限制
	//任务类型（主线任务0、支线任务1、每日任务2、循环任务3）
	public static var taskGroup:Map<Int, Array<Dynamic>> = [
		1 => [0, "主线任务", 0], 
	];
	
	//任务信息文件 id => 任务组id, 接收npcid，提交npcid，名称、描述、npc对话内容，接收者对话，需要：物品[物品id, 物品数量]/怪物[怪物id, 怪物数量]，奖励金钱，奖励物品[物品id, 物品数量]
	//，上一个任务id，下一个任务id，接收场景id，提交场景id, 任务类型（0提交任务，1,位置任务, 2物品任务，3怪物任务）
	public static var task:Map<Int, Array<Dynamic>> = [
		1 => [1, 1, 2, "第一个任务", ["去找小李子。"], ["你好", "你好", "去找小李"], ["我就是小李子。你来的正好。"], [[1, 2]], 10, [[6, 1]], 0, 2, 1, 1, 0], 
	];
	
	//固定场景 id => 地图名称, 地图加载文件名, 地图加载的图片名, 背景加载文件名，背景图片名，默认x，默认y
	public static var scene:Map<Int, Array<Dynamic>> = [
		1 => ["第一个场景", "mapCSV_Group1_tiled", "point", "mapCSV_Group1_background", "backdrop", 100, 100],
	];
	
	//场景 矿产及动植物出现概率
	//矿产概率 场景 => [矿产id => 概率]
	public static var sceneMaterial:Map<Int, Map<Int, Float>> = [
		1 => [
			1 => 0.1
		]
	];
	
	//动物概率
	public static var sceneAnimal:Map<Int, Map<Int, Float>> = [
		1 => [
			1 => 0.1
		]
	];
	
	//植物概率
	public static var scenePlant:Map<Int, Map<Int, Float>> = [
		1 => [
			1 => 0.1
		]
	];
	
	//地图中tiled 到 sceneid 转换
	public static var mapTiledToScene:Map < Int, Int > = [ 1 => 1];
	
	//任务状态：未触发，触发，接受，完成
	public static var taskStatusUnTrigger:Int = 0;
	public static var taskStatusTrigger:Int = 1;
	public static var taskStatusAccept:Int = 2;
	public static var taskStatusDone:Int = 3;
	
	//任务类型
	public static var taskTypeSubmit:Int = 0;
	public static var taskTypePosition:Int = 1;
	public static var taskTypeGoods:Int = 2;
	public static var taskTypeMonster:Int = 3;
	
	//生物类别
	public static var creatureTypePeace:Int = 0;
	public static var creatureTypeAttack:Int = 1;
	public static var creatureTypeTimid:Int = 2;
	
	public function new() 
	{
		
	}
	
}