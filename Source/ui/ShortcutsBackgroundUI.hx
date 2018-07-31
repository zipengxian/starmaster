package ui;
import entity.MaterialIcon;
import flixel.addons.plugin.FlxMouseControl;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import state.SceneState;
import state.PlayUIState;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUIButton;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;
import constants.ShortCutsConstants;
import constants.MaterialConstants;

/**
 * ...
 * @author blaze
 */
class ShortcutsBackgroundUI extends FlxSpriteGroup
{
	private var _bar:ShortcutsBar;
	public var background:FlxSprite;
	public var selectButtonIndex:Int;
	
	// Construtor
	public function new(bar:ShortcutsBar):Void 
	{
		super();
		
		_bar = bar;

		background = new FlxSprite(20, FlxG.height - 30 * _bar.row - 10);
		background.makeGraphic(FlxG.width - 40, _bar.row * 30 + 10, 0xff9999ff);
		background.scrollFactor.set(0, 0);
		add(background);
		
		for (i in 0...(_bar.row * 10)){
			var shortcutsButton:ShortcutsButton = new ShortcutsButton(20 * 2 + (i % 10) * 30, FlxG.height - 30 * _bar.row + Math.floor(i / 10) * 30);
			shortcutsButton.scrollFactor.set(0, 0);
			add(shortcutsButton);
		}
		
		var button = new FlxUIButton(background.width - 20, FlxG.height - 30 * _bar.row, "a", _onClickButton);
		button.loadGraphicSlice9(null, 20, 0, null, -1, true);
		button.scrollFactor.set(0, 0);
		add(button);
		
		if (_bar.open == false) {
			setPosition(0, 30 * (_bar.row - 1));
			for (c in _bar.components.members)
			{
				cast(c, FlxSprite).y += 30 * (_bar.row - 1);
			}
		}
	}
	
	private function _onClickButton()
	{
		if (_bar.open == false)
		{
			//这里和上面的初始化是相反的
			setPosition(0, 0);
			_bar.open = true;
			
			for (c in _bar.components.members)
			{
				cast(c, MaterialIcon).setOffsetXY(0 ,- 30 * (_bar.row - 1));
			}
		}
		else
		{
			setPosition(0, 30 * (_bar.row - 1));
			_bar.open = false;
			for (c in _bar.components.members)
			{
				cast(c, MaterialIcon).setOffsetXY(0 ,30 * (_bar.row - 1));
			}
		}
	}
	
	override function update():Void 	
	{
		super.update();
		
		var x = FlxG.mouse.x - background.x - 20 - FlxG.camera.scroll.x;
		var y = FlxG.mouse.y - background.y - FlxG.camera.scroll.y;
		
		//快捷键定义
		var i = 1;
		for (shortcut in ShortCutsConstants.MaterialsShortCuts)
		{
			if (FlxG.keyboard.pressed(shortcut) && _bar.data[i - 1] != null)
			{
				if (selectButtonIndex != 0)
				{
					cast(members[selectButtonIndex], ShortcutsButton).doRelease();
				}
				cast(members[i], ShortcutsButton).doSelect();
				//触发player事件
				_bar.state.player.changeHolding(i - 1);
				selectButtonIndex = i;
			}
			
			i++;
		}
		
		//拖动
		if ((x > 0 && x < background.width) && (y > 0 && y < background.height))
		{
			var rowx = Math.floor(x / 30);
			var rowy = Math.floor(y / 30);
			if (rowx < _bar.rowNumber && rowy < _bar.row)
			{
				var i = rowy * _bar.rowNumber + rowx;
				
				//鼠标上有图标
				if (FlxG.mouse.justPressed == true && cast(FlxG.state, SceneState).dragMaterialIcon != null) 
				{
					//该位置非空
					if (_bar.position[i][2] == 1)
					{
						//如果有则不执行，使用materialicon里边的点击事件判断
						
						FlxG.state.remove(cast(FlxG.state, SceneState).dragMaterialIcon, true);
						//临时存储
						var temp = cast(FlxG.state, SceneState).dragMaterialIcon;
						
						//变成鼠标上的icon
						_bar.components.remove(_bar.data[i], true);
						cast(FlxG.state, SceneState).dragMaterialIcon = _bar.data[i];
						cast(FlxG.state, SceneState).dragMaterialIcon.isDragMaterialIcon = true;
						FlxG.state.add(cast(FlxG.state, SceneState).dragMaterialIcon);
						
						//变成固定icon
						temp.setXY(background.x + 20 + _bar.position[i][0] + 7, background.y + _bar.position[i][1] + 7);
						temp.isDragMaterialIcon = false;
						temp.windowMark = 0;
						_bar.data[i] = temp;
						//_bar.data[i].components = _bar.components;
						_bar.components.add(_bar.data[i]);
						
						//修改玩家属性
						cast(FlxG.state, PlayUIState).playerData.packageData[i] = [_bar.data[i].id, _bar.data[i].number];
					}
					//该位置空
					else
					{
						FlxG.state.remove(cast(FlxG.state, SceneState).dragMaterialIcon, true);
						
						//临时存储
						var temp = cast(FlxG.state, SceneState).dragMaterialIcon;
						
						//变成固定icon
						temp.setXY(background.x + 20 + _bar.position[i][0] + 7, background.y + _bar.position[i][1] + 7);
						temp.isDragMaterialIcon = false;
						temp.windowMark = 0;
						_bar.data[i] = temp;
						//_bar.data[i].components = _bar.components;
						_bar.components.add(_bar.data[i]);
						_bar.position[i][2] = 1;
						
						cast(FlxG.state, SceneState).dragMaterialIcon = null;
						
						//修改玩家属性
						cast(FlxG.state, PlayUIState).playerData.packageData[i] = [_bar.data[i].id, _bar.data[i].number];
					}
				}
				//鼠标上没有图标
				else if(FlxG.mouse.justPressed == true && cast(FlxG.state, SceneState).dragMaterialIcon == null && _bar.position[i][2] == 1) 
				{
					//变成鼠标上的icon
					_bar.components.remove(_bar.data[i], true);
					cast(FlxG.state, SceneState).dragMaterialIcon = _bar.data[i];
					cast(FlxG.state, SceneState).dragMaterialIcon.isDragMaterialIcon = true;
					FlxG.state.add(cast(FlxG.state, SceneState).dragMaterialIcon);
					_bar.position[i][2] = 0;
					
					//修改玩家装备属性
					cast(FlxG.state, PlayUIState).playerData.shortCutData.remove(i);
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
	
	public function shortButtonRelease(index:Int):Void
	{
		//index需要加1
		cast(members[index + 1], ShortcutsButton).doRelease();
	}
	
}