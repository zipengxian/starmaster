package state; 

import data.PlayerData;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxBar;

import flash.geom.Rectangle;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUI9SliceSprite;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUICheckBox;
import flixel.addons.ui.FlxUIRadioGroup;
import flixel.addons.ui.FlxUISprite;
import flixel.addons.ui.FlxUITabMenu;
import flixel.addons.ui.FlxUIText;
import flixel.text.FlxText;
import haxe.xml.Fast;
import flash.Lib;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxInputText;
import openfl.Assets;
import util.FireTongueEx;

import ui.ShortcutsBar;
import ui.RightBar;

class PlayUIState extends BaseState
{
	private var tab_menu:FlxUITabMenu;
	
	public var shortcutsBar:ShortcutsBar;
	public var rightBar:RightBar;
	public var portrait:FlxSprite;
	public var health:FlxBar;
	public var vigor:FlxBar;
	
	public var playerData:PlayerData;
	
	override public function create():Void 
	{
		if (GameClass.tongue == null) {
			GameClass.tongue = new FireTongueEx();
			GameClass.tongue.init("en-US");
			FlxUIState.static_tongue = GameClass.tongue;
		}
		
		super.create();
		//_xml_id = "play";
		
		_lyr_stage.visible = false;
		
		//初始化数据
		init();

		createUI();
	}
	
	override public function update():Void 
	{
		super.update();
	}
	
	public override function getRequest(id:String, target:Dynamic, data:Dynamic):Dynamic {
		return null;
	}	
	
	public override function eventResponse(id:String,target:Dynamic,data:Array<Dynamic>):Void {
		if (data != null) {
			switch(cast(data[0], String)) {
				case "back": FlxG.switchState(new MenuState());
			}
		}
	}
	
	private function init():Void
	{
		playerData = new PlayerData();
	}
	
	private function createUI():Void
	{
		//添加对话框
		
		
		//添加道具bar
		shortcutsBar = new ShortcutsBar(this, 2);
		
		//添加工具bar
		rightBar = new RightBar(this);
		
		//头像
		portrait = new FlxSprite(10, 10);
		portrait.loadGraphic("assets/gfx/other/portrait_mane.png", true, true ,48 ,48);
		portrait.scrollFactor.set(0, 0);
		add(portrait);
		
		health = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 50, 10, portrait, "health");
		health.trackParent(60, 20);
		health.killOnEmpty = true;
		add(health);
		
		vigor = new FlxBar(0, 0, FlxBar.FILL_LEFT_TO_RIGHT, 50, 10, portrait, "health");
		vigor.createFilledBar(0x88888888, 0x33333333);
		vigor.trackParent(60, 40);
		vigor.killOnEmpty = true;
		add(vigor);
	}
	
	public function pickup(id:Int)
	{
		rightBar.packageWindow.addPackage(id);
	}
}