package data;

/**
 * ...
 * @author blaze
 */
class PlayerData
{
	public var name:String; //名称
	
	public var title:String; //称号
	
	public var grade:Int; //等级
	
	//背包
	public var packageData:Map < Int, Array<Int> > ; //位置 => mid，数量
	
	//快捷键
	public var shortCutData:Map < Int, Array<Int> > ; //位置 => mid，数量
	
	//属性
	public var attributeData:Array<Int>; //mid
	
	//装备
	public var equipmentData:Array<Int>; //mid
	
	//任务
	public var taskData:Map < Int, Array<Int> > ; //tid => 状态(1触发，2接收，3完成), 计数
	
	//当前场景是大地图，还是场景区域
	public var isMap:Bool;
	
	//当前场景
	public var sceneId:Int;
	
	//当前mapId，目前就一个大地图，所以未用到
	public var mapId:Int;
	
	//x坐标
	public var x:Int;
	
	//y坐标
	public var y:Int;
	
	//mapx坐标
	public var mapX:Int;
	
	//mapy坐标
	public var mapY:Int;
	
	//初始化
	public function new() 
	{
		load();
	}
	
	//加载
	public function load()
	{
		name = "小剑仙";
		title = "幽默大师";
		grade = 11;
		
		packageData = [1 => [1, 2]];
		shortCutData = [0 => [1, 2]];
		equipmentData = [0, 0, 0, 0, 0, 0];
		attributeData = [];
		taskData = [1 => [1, 2]];
		
		sceneId = 1;
		x = 100;
		y = 100;
		
		mapX = 100;
		mapY = 100;
		
		isMap = true;
	}
	
	//保存
	public function save()
	{
		
	}
}