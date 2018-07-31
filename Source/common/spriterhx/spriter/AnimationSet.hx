package common.spriterhx.spriter;

import common.spriterhx.spriter.core.BoneReference;
import flixel.util.FlxPoint;
import haxe.xml.Fast;
import common.spriterhx.spriter.core.Animation;
import common.spriterhx.spriter.core.Child;
import common.spriterhx.spriter.core.ChildReference;
import common.spriterhx.spriter.core.Mainline;
import common.spriterhx.spriter.core.MainlineKey;
import common.spriterhx.spriter.core.Piece;
import common.spriterhx.spriter.core.Timeline;
import common.spriterhx.spriter.core.TimelineKey;
import util.FlxAngleExt;

class AnimationSet
{
	public var scale(get, never) : Float;

	public var prefix : String;
	public var animationList : Array<Animation>;
	public var pieces : Array<Piece>;
	public var name : String;
	var piecesByFolderId : Map<String, Piece>;
	var animationsByName : Map<String, Animation>;
	var _scale : Float;
	public function new(data : Fast, scale : Float = 1, parentFolder : String = null)
	{
		animationsByName = null;
		prefix = parentFolder != null ?  parentFolder : "";
		if (prefix != "") 
		{
			prefix += "/";
		}
		_scale = scale;
		pieces = new Array<Piece>();
		piecesByFolderId = new Map<String, Piece>();
		for (folderXml in data.nodes.folder)
		{
			var folderId : String = folderXml.att.id;
			for (file in folderXml.nodes.file/* AS3HX WARNING could not determine type for var: file exp: EField(EIdent(folderXml),file) type: null*/)
			{
				var piece : Piece = new Piece();
				piece.id = file.att.id;
				piece.folder = folderId;
				piece.name = file.att.name;
				piece.name = piece.name.split(".")[0];
				//Strip preceding classes (Spriter is injecting them for no reason. Bug?)
				if (piece.name.substr(0, 1) == "/") 
				{
					piece.name = piece.name.substr(1);
				}
				piece.width = Math.round(Std.parseFloat(file.att.width) * _scale);
				piece.height = Math.round(Std.parseFloat(file.att.height) * _scale);
				piecesByFolderId[piece.get_folderId()] = piece;
			}

		}

		animationList = new Array<Animation>();
		animationsByName = new Map<String, Animation>();
		var anim : Animation;
		var mainlineKeys : Array<MainlineKey>;
		var mainlineKey : MainlineKey;
		var timelineKeys : Array<TimelineKey>;
		var timelineKey : TimelineKey;
		for (animData in data.node.entity.nodes.animation/* AS3HX WARNING could not determine type for var: animData exp: EField(EField(EIdent(data),entity),animation) type: null*/)
		{
			anim = new Animation();
			anim.id = Std.parseInt(animData.att.id);
			anim.name = animData.att.name;
			anim.length = Std.parseInt(animData.att.length);
			if (animData.has.looping)
			{
				anim.looping = (animData.att.looping == "true");
			}
			else
			{
				anim.looping = true;
			}
			//Add timelines
			//Add Mainline
			for (timelineData in animData.nodes.timeline/* AS3HX WARNING could not determine type for var: timelineData exp: EField(EIdent(animData),timeline) type: null*/)
			{
				timelineKeys = new Array<TimelineKey>();
				anim.timelineList.push(new Timeline(timelineData.att.id, timelineData.att.name, ((timelineData.has.object_type == false) ? "object": timelineData.att.object_type), timelineKeys));
				//Add TimelineKeys
				for (keyData in timelineData.nodes.key/* AS3HX WARNING could not determine type for var: keyData exp: EField(EIdent(timelineData),key) type: null*/)
				{
					timelineKey = new TimelineKey();
					timelineKey.id = Std.parseInt(keyData.att.id);
					if (keyData.has.time == true)
					{
						timelineKey.time = Std.parseInt(keyData.att.time);
					}
					else
					{
						timelineKey.time = 0;
					}
					timelineKey.spin = (keyData.has.spin == false) ? 0 : Std.parseInt(keyData.att.spin);
					//Check whether it's a bone (Assume: if not an object, it must be a bone)
					var isBone : Bool = false;
					var childData : Fast = keyData.hasNode.object ? keyData.node.object : null;
					if (childData == null) 
					{
						childData = keyData.node.bone;
						isBone = true;
					}
					if (childData == null && childData.has.file == false) 
					{
						continue;
					}
					var child : Child = new Child();
					child.x = ((childData.has.x == false)) ? 0 : Std.parseFloat(childData.att.x) * scale;
					child.y = ((childData.has.y == false)) ? 0 : Std.parseFloat(childData.att.y) * scale;
					child.angle = (childData.has.angle) ? Std.parseFloat(childData.att.angle) : 0;
					child.alpha = ((childData.has.a == false)) ? 1 : Std.parseFloat(childData.att.a);
					//Convert to flash degrees (spriters uses 0-360, flash used 0-180 and -180 to -1)
					var rotation : Float = child.angle;
					if (rotation >= 180) 
					{
						rotation = 360 - rotation;
					}

					else 
					{
						rotation = -rotation;
					}

					child.angle = rotation;
					//Ignore bones
					if (!isBone) 
					{
						child.piece = piecesByFolderId[childData.att.folder + "_" + childData.att.file];
						child.pivotX = ((childData.has.pivot_x == false)) ? 0 : Std.parseFloat(childData.att.pivot_x);
						child.pivotY = ((childData.has.pivot_y == false)) ? 1 : Std.parseFloat(childData.att.pivot_y);
						child.pixelPivotX = (child.piece.width * child.pivotX);
						child.pixelPivotY = (child.piece.height * (1 - child.pivotY));
					}
					child.scaleX = ((childData.has.scale_x == false)) ? 1 : Std.parseFloat(childData.att.scale_x);
					child.scaleY = ((childData.has.scale_y == false)) ? 1 : Std.parseFloat(childData.att.scale_y);
					timelineKey.child = child;
					timelineKeys.push(timelineKey);
				}
			}

			mainlineKeys = new Array<MainlineKey>();
			//A bit of a hack to support Animation Looping...
			for (mainKey in animData.node.mainline.nodes.key/* AS3HX WARNING could not determine type for var: mainKey exp: EField(EField(EIdent(animData),mainline),key) type: null*/)
			//Add Main Keyframes
			{
				mainlineKey = new MainlineKey();
				mainlineKey.id = Std.parseInt(mainKey.att.id);
				mainlineKey.time = (mainKey.has.time == false) ? 0 : Std.parseInt(mainKey.att.time);
				mainlineKeys.push(mainlineKey);
				//Add Object to KeyFrame
				mainlineKey.refs = new Array<ChildReference>();
				mainlineKey.bonerefs = new Array<BoneReference>();
				
				for (bonerefData in mainKey.nodes.bone_ref)
				{
					var ref : BoneReference = new BoneReference();
					ref.id = Std.parseInt(bonerefData.att.id);
					ref.timeline = Std.parseInt(bonerefData.att.timeline);
					//timelineId
					ref.key = Std.parseInt(bonerefData.att.key);
					//timelineKey
					ref.parent = bonerefData.has.parent ? Std.parseInt(bonerefData.att.parent) : -1;
					
					//处理父类骨骼
					if (ref.parent != -1)
					{
						anim.timelineList[ref.timeline].keys[ref.key].child.x += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.x;
						anim.timelineList[ref.timeline].keys[ref.key].child.y += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.y;
						
						var point:FlxPoint = FlxAngleExt.rotateSimple(
							anim.timelineList[ref.timeline].keys[ref.key].child.x, 
							anim.timelineList[ref.timeline].keys[ref.key].child.y,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.x,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.y,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.angle
						);
						
						anim.timelineList[ref.timeline].keys[ref.key].child.x = point.x;
						anim.timelineList[ref.timeline].keys[ref.key].child.y = point.y;
						
						anim.timelineList[ref.timeline].keys[ref.key].child.angle += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.angle;
					}
					
					mainlineKey.bonerefs.push(ref);
				}
				
				for (refData in mainKey.nodes.object_ref/* AS3HX WARNING could not determine type for var: refData exp: EField(EIdent(mainKey),object_ref) type: null*/)
				{
					var ref : ChildReference = new ChildReference();
					ref.id = Std.parseInt(refData.att.id);
					ref.timeline = Std.parseInt(refData.att.timeline);
					//timelineId
					ref.key = Std.parseInt(refData.att.key);
					//timelineKey
					ref.zIndex = Std.parseInt(refData.att.z_index);
					ref.parent = refData.has.parent ? Std.parseInt(refData.att.parent) : -1;
					
					//处理父类骨骼
					if (ref.parent != -1)
					{
						anim.timelineList[ref.timeline].keys[ref.key].child.x += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.x;
						anim.timelineList[ref.timeline].keys[ref.key].child.y += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.y;
						
						var point:FlxPoint = FlxAngleExt.rotateSimple(
							anim.timelineList[ref.timeline].keys[ref.key].child.x, 
							anim.timelineList[ref.timeline].keys[ref.key].child.y,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.x,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.y,
							anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.angle
						);
						
						anim.timelineList[ref.timeline].keys[ref.key].child.x = point.x;
						anim.timelineList[ref.timeline].keys[ref.key].child.y = point.y;
						
						anim.timelineList[ref.timeline].keys[ref.key].child.angle += anim.timelineList[mainlineKey.bonerefs[ref.parent].timeline].keys[mainlineKey.bonerefs[ref.parent].key].child.angle;
					}
					
					mainlineKey.refs.push(ref);
				}
			}

			if (anim.looping && anim.length > mainlineKey.time) 
			//Automatically insert a new MainLineKey at the very end of the animation,
			{
				var endKey : MainlineKey = new MainlineKey();
				endKey.time = anim.length;
				endKey.id = mainlineKey.id + 1;
				//Use the references from the first frame to create the looping effect
				endKey.refs = mainlineKeys[0].refs;
				endKey.bonerefs = mainlineKeys[0].bonerefs;
				mainlineKeys.push(endKey);
			}

			anim.mainline = new Mainline(mainlineKeys);
			animationsByName[anim.name] = anim;
			animationList.push(anim);
		}
	}

	public function get_scale() : Float
	{
		return _scale;
	}

	public function getByName(name : String) : Animation
	{
		return animationsByName[name];
	}

}

