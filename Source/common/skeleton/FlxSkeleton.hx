package common.skeleton;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;
import util.MathExt;

class FlxSkeleton extends FlxObject
{
	//公共
	public var beyondControl:Bool;
	
	private var bonesByName:Map<String, FlxSkeletonBone>;
	private var jointsByName:Map<String, FlxSkeletonJoint>;
	public var group:FlxGroup;
	public var _facing : UInt;
	
	private var _oldX:Float;
	private var _oldY:Float;
	
	public var facing(get, set):UInt;
	
	public function get_facing():UInt { return _facing; }
	public function set_facing(direction:UInt):UInt 
	{
		if (direction != facing && (direction == FlxObject.LEFT || direction == FlxObject.RIGHT))
		{
			for (joint in jointsByName)
				joint.flipped = !joint.flipped;
			for (bone in bonesByName)
				bone.facing = direction;
		}
		return _facing = direction;
	 }
	
	public function new(Group:FlxGroup)
	{
		super();
		group = Group;
		bonesByName = new Map<String, FlxSkeletonBone>();
		jointsByName = new Map<String, FlxSkeletonJoint>();
		_facing = FlxObject.RIGHT;
		_oldX = x;
		_oldY = y;
		width = 16;
		height = 16;
	}
	
	public function addBone(name:String, width:Int = 8, length:Int = 64, ?SimpleGraphic:Dynamic, visiable:Bool = true):FlxSkeletonBone
	{
		if (bonesByName[name] == null)
		{
			var bone:FlxSkeletonBone = new FlxSkeletonBone(width, length, SimpleGraphic);
			
			bonesByName[name] = bone;
		}
		
		bonesByName[name].visible = visiable;
		
		group.add(bonesByName[name]);

		return bonesByName[name];
	}
	
	public function addJoint(Name:String, Parent:String, Child:String, offsetX:Float = 0, offsetY:Float = 0, absoluteX:Float = 0, absoluteY:Float = 0, Angle:Float = 180):FlxSkeletonJoint
	{
		if (bonesByName[Child].parent == null)
		{
			var joint:FlxSkeletonJoint = new FlxSkeletonJoint(bonesByName[Parent], bonesByName[Child]);
			joint.angle = Angle;
			
			bonesByName[Child].parent = joint;
			bonesByName[Child].offsetX = offsetX;
			bonesByName[Child].offsetY = offsetY;
			bonesByName[Child].absoluteX = absoluteX;
			bonesByName[Child].absoluteY = absoluteY;
			jointsByName[Name] = joint;
		}
		else
		{
			jointsByName[Name] = bonesByName[Child].parent;
		}
		
		return jointsByName[Name];
	}
	
	public function getBone(name:String):FlxSkeletonBone
	{
		return bonesByName[name];
	}
	
	public function getJoint(name:String):FlxSkeletonJoint
	{
		return jointsByName[name];
	}
	
	public function bend(JointName:String, AngleInDegrees:Float):Void
	{
		getJoint(JointName).angle = AngleInDegrees;
	}
	
	override public function draw():Void
	{
		super.draw();
		group.draw();
	}
	
	override public function update():Void
	{
		super.update();
		
		for (joint in jointsByName)
			joint.update();
		
		group.update();
		
		for (bone in bonesByName)
		{
			bone.x += x - _oldX;
			bone.y += y - _oldY;
		}
		
		// resetWidthAndHeight();
		
		_oldX = x;
		_oldY = y;
	}
	
	
	public function resetWidthAndHeight():Void
	{
		var l:Float = MathExt.MAX_VALUE;
		var t:Float = MathExt.MAX_VALUE;
		var r:Float = MathExt.MIN_VALUE;
		var b:Float = MathExt.MIN_VALUE;
		
		for (bone in bonesByName)
		{
			if (bone.startPoint.x < l)
				l = bone.startPoint.x;
			else if (bone.startPoint.x > r)
				r = bone.startPoint.x;
			
			if (bone.endPoint.x < l)
				l = bone.endPoint.x;
			else if (bone.endPoint.x > r)
				r = bone.endPoint.x;
				
			if (bone.startPoint.y < t)
				t = bone.startPoint.y;
			else if (bone.startPoint.y > b)
				b = bone.startPoint.y;
			
			if (bone.endPoint.y < t)
				t = bone.endPoint.y;
			else if (bone.endPoint.y > b)
				b = bone.endPoint.y;
		}
		
		x += (l - x) / 2;
		//y += (t - y) / 2; 
		
		width = r - l;
		//height = b - t; 
	}
	
	public function play(AnimName:String, Force:Bool=true):Void
	{
		for (joint in jointsByName)
		{
			joint.play(AnimName, Force);
		}
	}
	
	public function detatchAll(Velocity:Float):FlxGroup
	{
		for (bone in bonesByName)
			detatchBone(bone, Velocity);
			
		jointsByName = new Map<String, FlxSkeletonJoint>();
		bonesByName = new Map<String, FlxSkeletonBone>();
		
		return group;
	}
	
	public function detatch(Name:String, Velocity:Float):FlxSkeletonBone
	{
		var bone:FlxSkeletonBone = bonesByName[Name];
		
		if (bone == null)
			return null;
		
		detatchBone(bone, Velocity);
		
		bonesByName[Name] = null;
		
		return bone;
	}
	
	private function detatchBone(bone:FlxSkeletonBone, Velocity:Float):Void
	{
		if (bone.parent != null)
			bone.parent.child = null;
			
		bone.parent = null;
		
		bone.angularVelocity = angularVelocity + (Math.random() * Velocity * 2) - Velocity;
		bone.velocity.x = velocity.x + (Math.random() * Velocity * 2) - Velocity;
		bone.velocity.y = velocity.y + (Math.random() * Velocity * 2) - Velocity;
		bone.acceleration.x = acceleration.x;
		bone.acceleration.y = acceleration.y;
		bone.drag.x = drag.x;
		bone.drag.y = drag.y;
		bone.angularDrag = angularDrag;
	}
}
