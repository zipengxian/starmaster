package constants;

/**
 * ...
 * @author ...
 */
class MaterialConstants
{
	//tiled 到 mid 转换
	public static var tiledToMaterials:Map < Int, Int > = [ 200 => 0, 201 => 0, 210 => 1, 125 => 1, 7 => 1, 8 => 1 ];
	
	//mid 到 tiled转换
	public static var materialsToTiled:Map < Int, Int > = [ 0 => 201, 1 => 210 ];
	
	//这里的英文名称为对应的图片名称
	//mid => []
	public static var materials:Map < Int, Array<Dynamic> > = [ 
		0 => [0, materialTypeMaterial, "tukuai1", "土块", "描述"], 
		1 => [1, materialTypeMaterial, "tukuai2", "土块", "描述"],
		2 => [2, materialTypeCollectionTool, "sword", "刀", "描述", 2, 0, 1],
		3 => [3, materialTypeCollectionTool, "hoe", "锄头", "描述"],
		4 => [4, materialTypeGun, "gun", "枪", "描述", 2, 0, 1],
		5 => [5, materialTypeManufactureTool, "tool", "工具", "描述"],
		6 => [6, materialBody, "body_1", "衣服1", "衣服1描述", 0, 2, 0],
	];
	
	//刀锋
	public static var blade:Map < Int, Array<Dynamic> > = [ 
		1 => ["blade1", "黄色剑气"], 
	];
	
	//子弹
	public static var bullet:Map < Int, Array<Dynamic> > = [ 
		1 => ["bullet1", "黄色的箭"], 
	];
	
	//合成物品  id + number
	public static var manufactureToMaterials:Map < Int, Array<Array<Int>> > = [ 
		3 => [[0, 1], [2, 1]]
	];
	
	//materials的index含义
	public static inline var materialIndexPic:Int = 0;//图片番号，pic和icon对应的spritesheet中的序号
	public static inline var materialIndexType:Int = 1;//物品种类
	public static inline var materialIndexAnim:Int = 2;//骨骼动画中anim的图片名称
	public static inline var materialIndexName:Int = 3;//名称
	public static inline var materialIndexDiscribe:Int = 4;//描述
	//攻击力、防御力、刀锋Id/子弹Id
	
	//物品种类
	public static inline var materialTypeNone:Int = 0;//无
	public static inline var materialTypeMaterial:Int = 1;//原始材料
	public static inline var materialTypePlant:Int = 2;//植物材料
	public static inline var materialTypeSimple:Int = 3;//简单制作类物品
	public static inline var materialTypeFood:Int = 4;//食物
	public static inline var materialTypeWeapon:Int = 5;//近战武器
	public static inline var materialTypeGun:Int = 6;//远程武器
	public static inline var materialTypeWeather:Int = 7;//衣物
	public static inline var materialTypeFurniture:Int = 8;//家具
	public static inline var materialTypeCollectionTool:Int = 9;//采矿工具
	public static inline var materialTypeManufactureTool:Int = 10;//建设工具
	public static inline var materialHead:Int = 11;
	public static inline var materialBody:Int = 12;
	public static inline var materialArm:Int = 13;
	public static inline var materialHand:Int = 14;
	public static inline var materialLeg:Int = 15;
	public static inline var materialFoot:Int = 16;
	
	//用户默认皮肤
	public static var defaultSkin:Map < Int, String > = [
		materialHead => "head",
		materialBody => "body",
	];
}