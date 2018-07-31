package entity;
import flixel.FlxSprite;
import flixel.FlxG;
import map.PointMap;
import constants.MaterialConstants;
import state.SceneState;

/**
 * ...
 * @author blaze
 */
class Material extends FlxSprite
{
	private var _state:SceneState;
	private var _id:Int;
	public function new(x:Float, y:Float, id:Int, state:SceneState)
	{
		super(x, y);
		loadGraphic("assets/sprite/material.png", true, false, 16, 16);
		_state = state;
		_id = id;
		animation.add(MaterialConstants.materials[_id][MaterialConstants.materialIndexAnim], [MaterialConstants.materials[_id][MaterialConstants.materialIndexPic]], 1, false);
		animation.play(MaterialConstants.materials[_id][MaterialConstants.materialIndexAnim]);
		
		acceleration.y = 420;
		//exists = false;
	}
	
	override public function update():Void
	{
		super.update();
		
		//和地图碰撞处理
		FlxG.collide(this, _state.scene.map);
		
		//和玩家碰撞处理
		FlxG.overlap(this, _state.player, pickup);
	}
	
	public function pickup(material:Material, player:PlayerExt):Void
	{
		_state.pickup(_id);
		this.destroy();
	}
}
