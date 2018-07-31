package entity;

import entity.group.Package;
import entity.group.Shortcuts;
import flash.geom.Matrix;
import flixel.addons.display.shapes.FlxShapeLine;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.MultiVarTween;
import flixel.tweens.motion.LinearPath;
import flixel.util.FlxPoint;
import common.spriterhx.spriter.FlxSpriter;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxSpriteUtil.LineStyle;
import state.SceneState;
import flixel.tweens.FlxEase;
import constants.PlayerConstants;
import constants.MaterialConstants;
import flixel.util.FlxColor;

class PlayerExt extends FlxSpriter {
	public var gravity_on:Bool = true;
	public var in_water:Bool = false;
	public var push_up:Bool = false;        
	private var _move_speed:Int;

	public var won_game:Bool = false;
	private var _inverseMatrix:Matrix;
	
	public inline static var SIZE:Int = 24;
	public var light:Light;
	private var _text:FlxText;
	private var _tween:FlxTween;
	
	//public var holdMaterialType:Int;
	//public var holdStatus:Int;
	
	public var collectionDistance:Float = 20;
	
	public var holdMaterialType:Int;
	public var holdStatus:Int;
	
	private var factureToolLine:FlxShapeLine;
	private var materialShortCutId:Int; //快捷键编号id
	private var materialEnabled:Int;//可建设或重叠不可建设
	private var material:FlxSprite;
	private var state:SceneState;
	
	//人物属性定义
	//非固定属性
	//生命
	public var hp:Int;
	//体力
	public var sp:Int;
	//饥饿
	public var starve:Int;
	//健康
	public var hh:Int;
	//运气
	public var luck:Int;
	
	//固定属性
	//力量
	public var strength:Int;
	//体质
	public var physique:Int;
	//敏捷，速度更快
	public var agile:Int;
	//智商
	public var iq:Int;
	//情商
	public var eq:Int;
	
	//相对固定属性
	//攻击
	public var attack:Int;
	//命中
	public var hit:Int;
	//防御
	public var defense:Int;
	//躲避
	public var dodge:Int;
	//移动速度
	public var moveSpeed:Int;
	//攻击速度
	public var attackSpeed:Int;
	
	public function new(X:Float, Y:Float, scale:Float = 1.0, s:SceneState, lightsLayer:FlxGroup):Void {
		super(X, Y, scale);
		
		maxVelocity.x = 140;
		maxVelocity.y = 140;
		state = s;
		
		_inverseMatrix = new Matrix();
		_inverseMatrix.scale(scale, scale);
		
		light = new Light(0, 0, SIZE * 2);
		lightsLayer.add(light);
		
		//初始化status
		holdStatus = PlayerConstants.holdStatusNone;
		holdMaterialType = MaterialConstants.materialTypeNone;
		
		materialShortCutId = 0;
		materialEnabled = 0; //0 可以建设，1 重叠了不可以建设
		material = new FlxSprite();
		material.visible = false;
		FlxG.state.add(material);
		
		var lineStyle:LineStyle = { thickness:1, color:FlxColor.RED };
		factureToolLine = new FlxShapeLine(0, 0, new FlxPoint(0, 0), new FlxPoint(200 + width, 200 + height), lineStyle);
		factureToolLine.visible = false;
		FlxG.state.add(factureToolLine);
		
		//加载人物属性
		hp = 20;
		sp = 0;
		starve = 0;
		health = 20;
		strength = 0;
		physique = 0;
		iq = 0;
		eq = 0;
	}
	
	/**
	 * 改变手里的东西
	 * @param	i   快捷键id
	 */
	public function changeHolding(i:Int):Void
	{
		materialShortCutId = i;
		var type:Int = MaterialConstants.materials[state.shortcutsBar.data[i].id][1];
		var name:String = MaterialConstants.materials[state.shortcutsBar.data[i].id][2];
		
		holdMaterialType = type;
		
		if (holdMaterialType == MaterialConstants.materialTypeNone)
		{
			holdStatus = PlayerConstants.holdStatusNone;
			return;
		}
		else if (holdMaterialType == MaterialConstants.materialTypeMaterial)
		{
			material.loadFromSprite(state.shortcutsBar.data[i].icon);
			material.visible = true;
			if (holdStatus != PlayerConstants.holdStatusCollectionTool)
			{
				//提示错误
			}
			return;
		}
		else if (holdMaterialType == MaterialConstants.materialTypePlant)
		{
			if (holdStatus != PlayerConstants.holdStatusCollectionTool)
			{
				//提示错误
			}
			return;
		}
		else if (holdMaterialType == MaterialConstants.materialTypeFood)
		{
			holdStatus = PlayerConstants.holdStatusFood;
		}
		else if (holdMaterialType == MaterialConstants.materialTypeWeapon)
		{
			holdStatus = PlayerConstants.holdStatusWeapon;
			
			//增加攻击属性
		}
		else if (holdMaterialType == MaterialConstants.materialTypeGun)
		{
			holdStatus = PlayerConstants.holdStatusGun;
			
			//增加攻击属性
		}
		else if (holdMaterialType == MaterialConstants.materialTypeCollectionTool)
		{
			holdStatus = PlayerConstants.holdStatusCollectionTool;
		}
		else if (holdMaterialType == MaterialConstants.materialTypeManufactureTool)
		{
			holdStatus = PlayerConstants.holdStatusfactureTool;
		}
		
		changeComponent(PlayerConstants.holdStatusToName[holdStatus], name);
	}
	
	/**
	 * 改变装备
	 * @param	type
	 * @param	name
	 */
	public function changeEquipment(type:Int, name:String):Void
	{
		//增加装备属性
		
		if (type == MaterialConstants.materialBody)
		{
			changeComponent("body", name);
		}
	}
	
	//override public function handleAngle(wrapper:FlxSprite, angle:Float, name:String):Void
	//{
		//if (holdStatus == PlayerConstants.holdStatusGun && name == PlayerConstants.holdStatusToName[PlayerConstants.holdStatusGun])
		//{			
			//var _r:Float;
			//if (facing == FlxObject.RIGHT)
			//{
				//_r = Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
			//}
			//else
			//{
				//_r = Math.PI - Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
				//if (_r > Math.PI)
				//{
					//_r -= Math.PI * 2;
				//}
			//}
			//wrapper.angle = (fixRotation(_r * 0.25 * 360) * ((defaultFacing == facing) ? 1 : -1));
		//}
		//else
			//super.handleAngle(wrapper, angle, name);
	//}

	override public function update():Void {
		
		if (holdStatus == PlayerConstants.holdStatusGun)
		{			
			var _r:Float;
			if (facing == FlxObject.RIGHT)
			{
				_r = Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
			}
			else
			{
				_r = Math.PI - Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
				if (_r > Math.PI)
				{
					_r -= Math.PI * 2;
				}
			}
			
			setBoneAngle("bone_r", fixRotation(_r * 180 / 3.14 + 135));
			setBoneAngle("bone_l", fixRotation(_r * 180 / 3.14 + 80));
			
			//setBoneAngle("bone_r_1", fixRotation(_r * 180 / 3.14 + 45));
			//setBoneAngle("bone_l_1", fixRotation(_r * 180 / 3.14 + 20));
		}
		
		if (holdStatus == PlayerConstants.holdStatusfactureTool)
		{
			if (holdMaterialType == MaterialConstants.materialTypeMaterial)
			{
				factureToolLine.visible = true;
				
				factureToolLine.x = x - 100;
				factureToolLine.y = y - 100;
				factureToolLine.point = new FlxPoint(getFirePoint().x - factureToolLine.x, getFirePoint().y - factureToolLine.y);
				factureToolLine.point2 = new FlxPoint(FlxG.mouse.x - factureToolLine.x, FlxG.mouse.y - factureToolLine.y);
				
				material.x = FlxG.mouse.x - 16;
				material.y = FlxG.mouse.y - 16;
				
				material.color = FlxColor.WHITE;
				materialEnabled = 0;
				//material.setColorTransformation(0 , 1 , 1);
				
				cast(FlxG.state, SceneState).scene.map.overlapsWithCallback(material, changeMaterialAlpha);
				
				if (FlxG.mouse.pressed == true && materialEnabled == 0)
				{
					cast(FlxG.state, SceneState).scene.map.setTile(Std.int((FlxG.mouse.x- 16) / 16), Std.int((FlxG.mouse.y - 16) / 16), MaterialConstants.materialsToTiled[state.shortcutsBar.data[materialShortCutId].id]);
					state.shortcutsBar.data[materialShortCutId].number--;
					
					if (state.shortcutsBar.data[materialShortCutId].number <= 0)
					{
						state.shortcutsBar.data[materialShortCutId].destroy();
						state.shortcutsBar.data[materialShortCutId] = null;
						
						material.visible = false;
						factureToolLine.visible = false;
						
						state.shortcutsBar.shortButtonRelease(materialShortCutId);
						holdMaterialType = MaterialConstants.materialTypeNone;
					}
				}
			}
			else
			{
				material.visible = false;
				factureToolLine.visible = false;
			}
		}
		else
		{
			material.visible = false;
			factureToolLine.visible = false;
		}
		
		light.xy(this.x + this.width/2 - (FlxG.camera.scroll.x * _scrollFactor.x) - (_offset.x), this.y + this.height/2 + (FlxG.camera.height - cast(FlxG.state, SceneState).scene.sky.height) - 400);
		
		if (FlxG.mouse.x > x)
		{
			facing = FlxObject.RIGHT;
		}
		else
		{
			facing = FlxObject.LEFT;
		}
		
		//if (holdStatus == PlayerConstants.holdStatusGun)
		//{			
			//var _r:Float;
			//if (facing == FlxObject.RIGHT)
			//{
				//_r = Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
			//}
			//else
			//{
				//_r = Math.PI - Math.atan2(FlxG.mouse.y - (y + height/2), FlxG.mouse.x - (x + width/2));
				//if (_r > Math.PI)
				//{
					//_r -= Math.PI * 2;
				//}
			//}
			//
			//var wrapper:FlxSprite = drawSprite.get(PlayerConstants.holdStatusToName[PlayerConstants.holdStatusGun]);
			//wrapper.angle = _r * 0.25 * 360;
		//}
		
		if(!won_game) {
			// Physics/movement
			if(gravity_on) {
				acceleration.y = 420;
				drag.x = 500;
				drag.y = 0;
			} else {
				acceleration.y = 40;
				drag.x = drag.y = 300;
			}

			if(push_up) {
				acceleration.y = -40;
			}

			if (FlxG.keyboard.pressed("A")) {
				facing = FlxObject.LEFT;
				velocity.x -= _move_speed * FlxG.elapsed;
			} else if (FlxG.keyboard.pressed("D")) {
				facing = FlxObject.RIGHT;
				velocity.x += _move_speed * FlxG.elapsed;                
			}

			if(!gravity_on) {
				if (FlxG.keyboard.pressed("W")) {
					velocity.y -= _move_speed * FlxG.elapsed;
				} else if (FlxG.keyboard.pressed("S")) {
					velocity.y += _move_speed * FlxG.elapsed;                
				}
			}
		}

		// Animation
		if(in_water) {
			alpha = 0.7;
		} else {
			alpha = 1.0;
		}

		if(velocity.x != 0 || velocity.y < 0) {
			//play("walk");
		} else {
			//play("stopped");
		}
		
		super.update();
	}
	
	override public function play(action:String, startPosition:Float = 0.0) : Void
	{
		super.play(action + PlayerConstants.holdStatusToName[holdStatus], startPosition);
	}
	
	public function setText(text:String):Void {
		var ty:Float = y - text.split('\n').length * 10;
		if (_text == null) {
			_text = new FlxText(x, ty, 300, text, 6);
			//_text.setFormat(null, 48, FlxColor.WHITE, "center", FlxText.SHADOW);
			_text.antialiasing = true;
			FlxG.state.add(_text);
		}
		else {
			_text.text = text;
			_text.x = x;
			_text.y = ty;
		}
		_text.alpha = 1.0;
		_text.visible = true;
		
		//if (_tween != null)
		//{
			//_tween.cancel();
		//}
		
		//var _tween = new MultiVarTween(null, FlxTween.LOOPING);
		FlxTween.multiVar(_text, { y:_text.y - 10, alpha: 0.0 }, 1.0, null);// { type: FlxTween.PINGPONG, ease: FlxEase.quadOut } );

		//_tween.tween(_text, { y:_text.y-10, alpha: 0 }, 2, FlxEase.quadIn);
		
	}
	
	/**
	 * 是否在范围内
	 * @param	mouseX
	 * @param	mouseY
	 * @return
	 */
	public function inDistance(mouseX:Float, mouseY:Float):Bool
	{
		return (mouseX > x - collectionDistance && mouseX < x + width + collectionDistance) && (mouseY > y - collectionDistance && mouseY < y + height + collectionDistance);
	}
	
	/**
	 * 获取当前远程武器的发射点坐标
	 * @return
	 */
	public function getFirePoint():FlxPoint
	{
		var weapon:FlxSprite = drawSprite.get(PlayerConstants.holdStatusToName[PlayerConstants.holdStatusfactureTool]);
		
		return new FlxPoint(weapon.x, weapon.y);
	}
	
	public function changeMaterialAlpha(map:FlxObject, material:FlxObject):Bool
	{
		//materialArray[2].setColorTransformation(0 , 1 , 1);
		this.material.color = FlxColor.RED;
		materialEnabled = 1;
		
		return true;
	}
	
	/**
	 * 对玩家的伤害
	 * @param	pa
	 * @param	Ma
	 */
	public function injure(pa:Int, pac:Int, Ma:Int, Mac:Int):Void
	{
		var attack = pa + pac * Std.random(2) - 5;
		
		hurt(attack > 0 ? attack : 0);
		
		setText("-" + (attack > 0 ? attack : 0));
	}
}