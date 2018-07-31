package ui;

import entity.group.Materials;
import entity.group.Package;
import entity.group.Shortcuts;
import entity.MaterialIcon;
import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.addons.ui.FlxUIButton;
import flixel.FlxBasic;
import state.PlayUIState;
import flixel.FlxSprite;
import flixel.FlxG;
import constants.MaterialConstants;
import state.PlayUIState;

class PackageWindow extends BaseUI{
	//button组
	private var backgroundUI:PackageBackgroundUI;
	public var position:Array<Array<Float>>;//[x ,y ,0]  0为空，1为非空
	public var data:Map < Int, MaterialIcon >;//位置=>icon类别class
	public var materialNumber:Int;
	
	public var materialMax:Int = 20;
	public var rowNumber:Int = 10;
	public var incremental:Int;
	
	//[head,body,arm,hand,leg,foot]
	public static var equipmentPosition:Array<Array<Float>> = [[0, 100], [0, 150]];
		
	// Construtor
	override public function new(baseState:PlayUIState):Void 
	{
		super(baseState);
		
		state = baseState;
		
		backgroundUI = new PackageBackgroundUI(this);
		components = new Package();
		
		state.add(backgroundUI);
		state.add(components);
		
		data = new Map < Int, MaterialIcon > ();
		incremental = materialMax - MaterialConstants.materialHead;
		
		var x = 0.0;
		var y = 0.0;
		position = [];
		
		//初始化物品栏
		for (i in 0 ... materialMax)
		{
			if (i % rowNumber == 0)
			{
				x = 0;
			}
			y += 20 * Math.floor(i / rowNumber);
			position[i] = [x, y, 0];
			
			x += 20;
			y = 0;
		}
		
		var i = materialMax;
		//初始化装备
		for (j in equipmentPosition)
		{
			position[i] = [j[0], j[1], 0];
			i++;
		}
		
		for (key in state.playerData.packageData.keys())
		{
			data[key] = new MaterialIcon(backgroundUI.background.x + position[key][0] + 2, backgroundUI.background.y + position[key][1] + 2, state.playerData.packageData[key][0], state.playerData.packageData[key][1]);
			components.add(data[key]);
			position[key][2] = 1;
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
	
	/**
	 * 背包增加物品
	 * @param	id
	 * @param	number
	 */
	public function addPackage(id:Int, number:Int = 1):Void
	{
		//for (c in components.members)
		//{
			//if (id == cast(c, MaterialIcon).id)
			//{
				//cast(c, MaterialIcon).number += number;
				//
				//修改玩家属性
				//state.playerData.packageData[i][1] = state.playerData.packageData[i][1] + number;
				//return;
			//}
		//}
		
		for (i in 0 ... materialMax)
		{
			if (position[i][2] == 1 && id == data[i].id)
			{
				data[i].number += number;
				
				//修改玩家属性
				state.playerData.packageData[i][1] = state.playerData.packageData[i][1] + number;
				return;
			}
		}
		
		for (i in 0 ... materialMax)
		{
			if (position[i][2] == 0)
			{
				data[i] = new MaterialIcon(backgroundUI.background.x + position[i][0] + 2, backgroundUI.background.y + position[i][1] + 2, id, number);
				components.add(data[i]);
				position[i][2] = 1;
				
				//修改玩家属性
				state.playerData.packageData[i] = [id, number];
				
				break;
			}
		}
	}
	
	private function _onClickCharacterButton(params:Array<Dynamic> = null):Void {
		FlxG.log.add("FlxUI._onClickButton(" + params + ")");
	}
	
	public function appear():Void {
		backgroundUI.visible = true;
		components.visible = true;
	}
	
	public function disappear():Void {
		backgroundUI.visible = false;
		components.visible = false;
	}
	
	public function getBackground():FlxBasic {
		return components.getFirstExisting();
	}
	
	public function getVisible():Bool {
		return components.visible;
	}
	
	public function inBackground(x:Float, y:Float):Bool 
	{
		return backgroundUI.inBackground(x, y);
	}
}