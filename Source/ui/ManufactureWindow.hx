package ui;

import entity.MaterialElement;
import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.addons.ui.FlxUIButton;
import flixel.FlxBasic;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import state.PlayUIState;
import flixel.FlxSprite;
import flixel.FlxG;
import ui.module.SelectNumber;
import constants.MaterialConstants;

class ManufactureWindow extends BaseUI{
	public var backgroundUI:ManufactureBackgroundUI;
	
	//右边
	public var rightText:FlxText;
	public var manufactureImage:MaterialElement;
	public var manufactureName:FlxText;
	public var manufactureDescription:FlxText;
	public var selectNumber:SelectNumber;
	public var makeButton:FlxUIButton;
	
	//左边
	public var leftText:FlxText;
	public var materialList:ManufactureList;
	//弹框窗口
	public var elementWindow:ManufactureElementWindow;
	//分类选择行
	public var categoryButtons:FlxGroup;
	
	// Construtor
	override public function new(baseState:PlayUIState):Void {
		super(baseState);
		
		components = new FlxGroup();
		state = baseState;
		
		backgroundUI = new ManufactureBackgroundUI(this);
		createElements();
		
		state.add(backgroundUI);
		state.add(components);
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
	 * 创建ui
	 */
	private function createElements():Void
	{
		//左边
		leftText = new FlxText(backgroundUI.background.x + 20, backgroundUI.background.y + 20, 60, "规划图", 16);
		leftText.systemFont = "隶书";
		leftText.color = 0xffffffff;
		components.add(leftText);
		createMaterials();
		createCategoryButtons();
		
		//右边
		rightText = new FlxText(backgroundUI.background.x + 300, backgroundUI.background.y + 20, 60, "产品", 16);
		rightText.systemFont = "隶书";
		rightText.color = 0xffffffff;
		components.add(rightText);
		manufactureImage = new MaterialElement(backgroundUI.background.x + 300, backgroundUI.background.y + 50);
		manufactureName = new FlxText(backgroundUI.background.x + 300, backgroundUI.background.y + 100, 200, "", 16, false);
		manufactureDescription = new FlxText(backgroundUI.background.x + 300, backgroundUI.background.y + 200, 200, "", 16, false);
		//manufactureImage.visible = manufactureName.visible = manufactureDescription.visible = false;
		components.add(manufactureImage);
		components.add(manufactureName);
		components.add(manufactureDescription);
		selectNumber = new SelectNumber(backgroundUI.background.x + 300, backgroundUI.background.y + 350);
		components.add(selectNumber);
		makeButton = new FlxUIButton(backgroundUI.background.x + 400, backgroundUI.background.y + 350, "制作", makeMaterial);
		//makeButton.loadGraphicSlice9(null, 60, 20, null, -1, true);
		makeButton.label.size = 16;
		makeButton.label.systemFont = "隶书";
		makeButton.label.color = 0xffffffff;
		makeButton.resize(60, 20);
		components.add(makeButton);
		
		//弹框
		//elementWindow = new ManufactureElementWindow(FlxG.mouse.x + 20, FlxG.mouse.y);
		//components.add(elementWindow);
	}
	
	/**
	 * 制作物品
	 */
	private function makeMaterial():Void
	{
		if (elementWindow.isEnough == true)
		{
			//制作成功
			//消除旧的物品
			for (key in elementWindow.elements.keys())
			{
				for (element in elementWindow.elements[key])
				{
					//如果物品消耗完了
					if (element[2] == 0)
					{
						//删除
						//背包
						if (element[0] == 0)
						{
							state.rightBar.packageWindow.components.remove(state.rightBar.packageWindow.data[element[1]], true);
							state.rightBar.packageWindow.data.remove(element[1]);
							state.rightBar.packageWindow.position[element[1]][2] = 0;
							
							//修改玩家背包属性
							cast(FlxG.state, PlayUIState).playerData.packageData.remove(element[1]);
						}
						//快捷键
						else
						{
							state.shortcutsBar.components.remove(state.shortcutsBar.data[element[1]], true);
							state.shortcutsBar.data.remove(element[1]);
							state.shortcutsBar.position[element[1]][2] = 0;
							
							//修改玩家装备属性
							cast(FlxG.state, PlayUIState).playerData.shortCutData.remove(element[1]);
						}
					}
					else
					{
						//背包
						if (element[0] == 0)
						{
							state.rightBar.packageWindow.data[element[1]].number = element[2];
							//修改玩家背包属性
							cast(FlxG.state, PlayUIState).playerData.packageData[element[1]][1] = element[2];
						}
						//快捷键
						else
						{
							state.shortcutsBar.data[element[1]].number = element[2];
							//修改玩家背包属性
							cast(FlxG.state, PlayUIState).playerData.packageData[element[1]][1] = element[2];
						}
					}
				}
			}
			
			//增加新的物品
			state.rightBar.packageWindow.addPackage(materialList.currentId, Std.parseInt(selectNumber.numberInput.text));
		}
		else
		{
			//返回提示
		}
	}
	
	/**
	 * 生成左边的物品列表
	 * @param	categoryId
	 */
	private function createMaterials(categoryId:Int = 0):Void
	{
		var materialIdArray:Array<Int> = [];
		
		if (categoryId != 0)
		{
			//进行分类处理
			for (materialId in MaterialConstants.materials.keys())
			{
				if (MaterialConstants.materials[materialId][MaterialConstants.materialIndexType] == categoryId)
				{
					if (MaterialConstants.manufactureToMaterials.exists(materialId) == true)
					{
						materialIdArray.push(materialId);
					}
				}
			}
		}
		else
		{			
			for (materialId in MaterialConstants.manufactureToMaterials.keys())
			{
				materialIdArray.push(materialId);
			}
		}
		
		materialList = new ManufactureList(backgroundUI.background.x + 20, backgroundUI.background.y + 60, materialIdArray, this);
		
		if (components.getFirstAvailable(ManufactureList) == null)
		{
			components.add(materialList);
		}
	}
	
	/**
	 * 生成分类按钮
	 */
	private function createCategoryButtons():Void
	{
		categoryButtons = new FlxGroup();
		
		var button8 = new FlxUIButton(backgroundUI.background.x + 20, backgroundUI.background.y + 350, "全部", changeCategory, [0]);
		button8.label.size = 16;
		button8.label.systemFont = "隶书";
		button8.label.color = 0xffffffff;
		button8.label.resize(60, 20);
		categoryButtons.add(button8);
		
		var button = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "耗材", changeCategory, [3]);
		button.label.size = 16;
		button.label.systemFont = "隶书";
		button.label.color = 0xffffffff;
		button.label.resize(60, 20);
		categoryButtons.add(button);

		var button2 = new FlxUIButton(backgroundUI.background.x + 180, backgroundUI.background.y + 350, "食物", changeCategory, [4]);
		button2.label.size = 16;
		button2.label.systemFont = "隶书";
		button2.label.color = 0xffffffff;
		button2.label.resize(60, 20);
		categoryButtons.add(button2);
		
		//var button3 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "近战", changeCategory, [5]);
		//button3.label.size = 16;
		//button3.label.systemFont = "隶书";
		//button3.label.color = 0xffffffff;
		//button3.label.resize(60, 20);
		//categoryButtons.add(button3);
		//
		//var button4 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "远程", changeCategory, [6]);
		//button4.label.size = 16;
		//button4.label.systemFont = "隶书";
		//button4.label.color = 0xffffffff;
		//button4.label.resize(60, 20);
		//categoryButtons.add(button4);
		//
		//var button5 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "衣物", changeCategory, [7]);
		//button5.label.size = 16;
		//button5.label.systemFont = "隶书";
		//button5.label.color = 0xffffffff;
		//button5.label.resize(60, 20);
		//categoryButtons.add(button5);
		//
		//var button5 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "家具", changeCategory, [8]);
		//button5.label.size = 16;
		//button5.label.systemFont = "隶书";
		//button5.label.color = 0xffffffff;
		//button5.label.resize(60, 20);
		//categoryButtons.add(button5);
		//
		//var button6 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "采矿", changeCategory, [9]);
		//button6.label.size = 16;
		//button6.label.systemFont = "隶书";
		//button6.label.color = 0xffffffff;
		//button6.label.resize(60, 20);
		//categoryButtons.add(button6);
		//
		//var button7 = new FlxUIButton(backgroundUI.background.x + 100, backgroundUI.background.y + 350, "建设", changeCategory, [10]);
		//button7.label.size = 16;
		//button7.label.systemFont = "隶书";
		//button7.label.color = 0xffffffff;
		//button7.label.resize(60, 20);
		//categoryButtons.add(button7);
		
		for (buttonElement in categoryButtons.members)
		{
			components.add(buttonElement);
		}
	}
	
	/**
	 * 分类按钮按下分类变更，修改物品列表
	 * @param	categoryId
	 */
	public function changeCategory(categoryId:Int):Void
	{
		components.remove(materialList);
		createMaterials(categoryId);
	}
	
	public function appear():Void {
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