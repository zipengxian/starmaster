package state;
import flixel.addons.ui.FlxUIState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxG;

import ui.DialogBox;

class BaseState extends FlxUIState {	
	public var _lyr_stage:FlxGroup;
	public var _lyr_sprites:FlxGroup;
	private var _dialog_box:DialogBox;
	
	override public function create():Void {	
		_lyr_stage = new FlxGroup();
		_lyr_sprites = new FlxGroup();
		
		_lyr_stage.add(new FlxSprite(0, 0, "assets/menu/border.png"));
		
		add(_lyr_stage);
		add(_lyr_sprites);
		
		FlxG.mouse.show("assets/menu/cursor.png", 2);
		
		_dialog_box = null;
		
		super.create();
	}
	
	public function getLyrSprites():FlxGroup {
		return _lyr_sprites;
	}
	
	public function getLyrStage():FlxGroup {
		return _lyr_stage;
	}
	
	public function addVersionBeta():Void {
		_lyr_sprites.add(new FlxSprite(534, 500, "assets/menu/version.png"));
	}
	
	//public function dialogBoxError(Message:String):Void {
		//if (!hasDialogBox()) {
			//_dialog_box = new DialogBox(Message, this);
			//_dialog_box.createDefaultButtonOK();
		//}
	//}
	
	public function hasDialogBox():Bool 
	{
		if (_dialog_box != null)
			if (_dialog_box.length > 0)
				return true;
		
		return false;
	}
	
	public function dialogBox(id:Int, taskList:Map<Int, Array<Int>>):Void 
	{
		if (!hasDialogBox()) 
		{
			_dialog_box = new DialogBox(id, taskList, this);
		}
		else
		{
			//重新设置内容
			_dialog_box.reset(id, taskList);
			//_dialog_box.destroy();
		}
	}
	
	public function hideDialogBox()
	{
		if (hasDialogBox()) 
		{
			_dialog_box.visible = false;
		}
	}
	
	public function dialogBoxVisible():Bool
	{
		if (hasDialogBox()) 
		{
			return _dialog_box.visible;
		}
		
		return false;
	}
	
	//public function dialogBoxDefault(Message:Array<String>):Void {
		//if (!hasDialogBox()) {
			//dialogBox(Message);
			//_dialog_box.createDefaultButtonOK();
		//}
	//}
}