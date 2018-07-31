package ui;
import constants.EquipmentConstants;
import constants.MaterialConstants;
import entity.MaterialIcon;
import flixel.addons.plugin.FlxMouseControl;
import flixel.group.FlxGroup;
import flixel.FlxG;
import state.SceneState;
import state.PlayUIState;
import ui.module.Background;
import flixel.FlxSprite;

/**
 * ...
 * @author blaze
 */
class PackageBackgroundUI extends FlxGroup
{
	private var _window:PackageWindow;
	private var _backgroundLastX:Float; 
	private var _backgroundLastY:Float;
	
	public var background:Background;
	
	// Construtor
	public function new(window:PackageWindow):Void 
	{
		super();
		
		_window = window;
		//	Enable the plugin - you only need do this once (unless you destroy the plugin)
		if (FlxG.plugins.get(FlxMouseControl) == null)
		{
			FlxG.plugins.add(new FlxMouseControl());
		}

		background = new Background(FlxG.width/2 - 500/2, FlxG.height / 2 - 200/2);			
		background.makeGraphic(500, 200, 0xff9999ff);
		background.enableMouseDrag(false, false);
		background.scrollFactor.set(0, 0);
		add(background);
		
		_backgroundLastX = background.x;
		_backgroundLastY = background.y;
	}
	
	override function update():Void 	
	{
		super.update();
		
		//同步图标
		if (background.isDragged == true)
		{
			for (c in _window.components.members)
			{	
				cast(c, MaterialIcon).setOffsetXY(background.x - _backgroundLastX, background.y - _backgroundLastY);
			}
			
			_backgroundLastX = background.x;
			_backgroundLastY = background.y;
		}
		
		if (visible == true && FlxG.mouse.justPressed == true)
		{
			var x = FlxG.mouse.x - background.x - FlxG.camera.scroll.x;
			var y = FlxG.mouse.y - background.y - FlxG.camera.scroll.y;
			
			if ((x > 0 && x < background.width) && (y > 0 && y < background.height))
			{
				var i:Int = checkPosition(x, y);
				
				if (i != -1)
				{		
					//鼠标上有图标
					if (FlxG.mouse.justPressed == true && cast(FlxG.state, SceneState).dragMaterialIcon != null) 
					{
						var materialType:Int = MaterialConstants.materials[cast(FlxG.state, SceneState).dragMaterialIcon.id][MaterialConstants.materialIndexType];
						
						if (i >= _window.materialMax)
						{
							//判断该地方是否可以放该装备
							if (materialType + _window.incremental != i)
							{
								//改物品放错位置，返回
								return;
							}
						}
						
						//该位置非空
						if (_window.position[i][2] == 1)
						{
							//如果有则不执行，使用materialicon里边的点击事件判断
							FlxG.state.remove(cast(FlxG.state, SceneState).dragMaterialIcon, true);
							//临时存储
							var temp = cast(FlxG.state, SceneState).dragMaterialIcon;
							
							//变成鼠标上的icon
							_window.components.remove(_window.data[i], true);
							cast(FlxG.state, SceneState).dragMaterialIcon = _window.data[i];
							cast(FlxG.state, SceneState).dragMaterialIcon.isDragMaterialIcon = true;
							FlxG.state.add(cast(FlxG.state, SceneState).dragMaterialIcon);
							
							//变成固定icon
							temp.setXY(background.x + _window.position[i][0] + 2, background.y + _window.position[i][1] + 2);
							temp.isDragMaterialIcon = false;
							temp.windowMark = 0;
							_window.data[i] = temp;
							//_window.data[i].components = _window.components;
							_window.components.add(_window.data[i]);
							
							//修改玩家属性
							cast(FlxG.state, PlayUIState).playerData.packageData[i] = [_window.data[i].id, _window.data[i].number];
							
							if (i >= _window.materialMax)
							{
								//修改玩家属性值，增加属性值，去除属性值
								if (EquipmentConstants.equipments.exists(_window.data[i].id))
								{
									cast(FlxG.state, SceneState).player.attack += EquipmentConstants.equipments[_window.data[i].id][0];
									cast(FlxG.state, SceneState).player.defense += EquipmentConstants.equipments[_window.data[i].id][1];
								}
								
								temp = cast(FlxG.state, SceneState).dragMaterialIcon;
								if (EquipmentConstants.equipments.exists(temp.id))
								{
									cast(FlxG.state, SceneState).player.attack += EquipmentConstants.equipments[temp.id][0];
									cast(FlxG.state, SceneState).player.defense += EquipmentConstants.equipments[temp.id][1];
								}
								
								//变更玩家服装
								cast(FlxG.state, SceneState).player.changeEquipment(MaterialConstants.materials[_window.data[i].id][MaterialConstants.materialIndexType], MaterialConstants.materials[_window.data[i].id][MaterialConstants.materialIndexAnim]);
							}
						}
						//该位置空
						else
						{
							FlxG.state.remove(cast(FlxG.state, SceneState).dragMaterialIcon, true);
							
							//临时存储
							var temp = cast(FlxG.state, SceneState).dragMaterialIcon;
							
							//变成固定icon
							temp.setXY(background.x + _window.position[i][0] + 2, background.y + _window.position[i][1] + 2);
							temp.isDragMaterialIcon = false;
							temp.windowMark = 0;
							_window.data[i] = temp;
							//_window.data[i].components = _window.components;
							_window.components.add(_window.data[i]);
							_window.position[i][2] = 1;
							
							cast(FlxG.state, SceneState).dragMaterialIcon = null;
							
							//修改玩家属性
							cast(FlxG.state, PlayUIState).playerData.packageData[i] = [_window.data[i].id, _window.data[i].number];
							
							if (i >= _window.materialMax)
							{
								//修改玩家属性值，增加属性值
								if (EquipmentConstants.equipments.exists(_window.data[i].id))
								{
									cast(FlxG.state, SceneState).player.attack += EquipmentConstants.equipments[_window.data[i].id][0];
									cast(FlxG.state, SceneState).player.defense += EquipmentConstants.equipments[_window.data[i].id][1];
								}
								
								//变更玩家服装
								cast(FlxG.state, SceneState).player.changeEquipment(MaterialConstants.materials[_window.data[i].id][MaterialConstants.materialIndexType], MaterialConstants.materials[_window.data[i].id][MaterialConstants.materialIndexAnim]);
							}
						}
					}
					//鼠标上没有图标
					else if(FlxG.mouse.justPressed == true && cast(FlxG.state, SceneState).dragMaterialIcon == null && _window.position[i][2] == 1) 
					{
						//变成鼠标上的icon
						_window.components.remove(_window.data[i], true);
						cast(FlxG.state, SceneState).dragMaterialIcon = _window.data[i];
						cast(FlxG.state, SceneState).dragMaterialIcon.isDragMaterialIcon = true;
						FlxG.state.add(cast(FlxG.state, SceneState).dragMaterialIcon);
						_window.position[i][2] = 0;
						
						//修改玩家背包属性
						cast(FlxG.state, PlayUIState).playerData.packageData.remove(i);
						
						if (i >= _window.materialMax)
						{
							//修改玩家属性值，去除属性值
							if (EquipmentConstants.equipments.exists(_window.data[i].id))
							{
								cast(FlxG.state, SceneState).player.attack -= EquipmentConstants.equipments[_window.data[i].id][0];
								cast(FlxG.state, SceneState).player.defense -= EquipmentConstants.equipments[_window.data[i].id][1];
							}
							
							//默认玩家服装或皮肤
							var defaultType = i - _window.materialMax + MaterialConstants.materialHead;
							cast(FlxG.state, SceneState).player.changeEquipment(defaultType, MaterialConstants.defaultSkin[defaultType]);
						}
					}
				}
			}
		}
	}
	
	public function inBackground(x:Float, y:Float):Bool 
	{
		if (visible == true)
		{
			return (x > background.x && x < background.x + background.width) && (y > background.y && y < background.y + background.height);
		}
		
		return false;
	}
	
	/**
	 * 判断是否在装备栏的栏中
	 * @param	x
	 * @param	y
	 * @return  返回对应的位置编号
	 */
	public function checkPosition(x:Float, y:Float):Int
	{
		var rowx = Math.floor(x / 20);
		var rowy = Math.floor(y / 20);
		
		var data = -1;
		
		//物品栏判断
		if (rowx < _window.rowNumber && rowy < _window.materialMax / _window.rowNumber)
		{
			data = rowy * _window.rowNumber + rowx;
		}
		//装备判断
		else
		{
			var i = 0;
			for (pos in PackageWindow.equipmentPosition)
			{
				if (x > pos[0] && x < pos[0] + 20 && y > pos[1] && y < pos[1] + 20)
				{
					data = _window.materialMax + i;
					break;
				}
				i++;
			}
		}
		
		return data;
	}
	
}