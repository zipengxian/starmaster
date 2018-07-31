package constants;

/**
 * ...
 * @author blaze
 */
class PlayerConstants
{
	//玩家手持状态
	public static inline var holdStatusNone:Int = 0;
	public static inline var holdStatusWeapon:Int = 1;
	public static inline var holdStatusGun:Int = 2;
	public static inline var holdStatusCollectionTool:Int = 3;
	public static inline var holdStatusfactureTool:Int = 4;
	public static inline var holdStatusFood:Int = 5;
	
	//手持状态对应的骨骼动画中的名称
	public static var holdStatusToName:Map<Int, String> = [
		holdStatusNone => "", 
		holdStatusWeapon => "hoe", 
		holdStatusGun => "gun", 
		holdStatusCollectionTool => "hoe", 
		holdStatusfactureTool => "gun", 
		holdStatusFood => "food"
	];
	
	//骨骼动画前缀
	public static inline var actionIdle:String = "idle_";
	public static inline var actionRun:String = "run_";
	public static inline var actionDo:String = "do_";
	
	//锻体、练气、筑基、虚丹、金丹、元婴、分神、合体、大乘
	public static var gradeToName:Map<Int, String> = [
		1 => "锻体一品",
		2 => "锻体二品",
		3 => "锻体三品",
		4 => "锻体四品",
		5 => "锻体五品",
		6 => "锻体六品",
		7 => "锻体七品",
		8 => "锻体八品", 
		9 => "锻体九品",
		10 => "锻体十品",
		11 => "练气一品",
		12 => "练气二品",
	];
}