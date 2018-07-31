package common.skeleton;

import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.FlxSprite;

class VehicleSkeleton extends FlxSkeleton
{
	private var center:FlxSkeletonBone;
	private var leftWheelCenter:FlxSkeletonBone;
	private var rightWheelCenter:FlxSkeletonBone;
	
	public var leftFoot(get, never) : FlxPoint;
	public var rightFoot(get, never) : FlxPoint;
	public var leftHand(get, never) : FlxPoint;
	public var rightHand(get, never) : FlxPoint;
	
	public function get_leftFoot():FlxPoint { return getBone("lower left leg").endPoint; }
	
	public function get_rightFoot():FlxPoint { return getBone("lower right leg").endPoint; }
	
	public function get_leftHand():FlxPoint { return getBone("lower left arm").endPoint; }
	
	public function get_rightHand():FlxPoint { return getBone("lower right arm").endPoint; }
	
	public function new(group:FlxGroup, Scale:Float)
	{
		super(group);
		makeBody(Scale);
		drag.x = 50;
		drag.y = 50;
		angularDrag = 50; 
	}
	
	private function makeBody(heightInPixels:Float = 64):Void
	{ 
		var scale:Float = heightInPixels / (64 + 64 + 64 + 64);//0.4
		var s1:Int = Math.ceil(Math.max(1, 8 * scale));//3.2
		var s4:Int = Math.ceil(Math.max(1, 32 * scale));//12.8
		var s8:Int = Math.ceil(Math.max(1, 64 * scale));//25.6
		
		height = s8 + s8 + s4;
		width  = s4 + s4; 
		
		center = addBone("center", 1, 1);
		leftWheelCenter = addBone("left wheel center", 1, 1);
		rightWheelCenter = addBone("right wheel center", 1, 1);
		addBone("body", s1, s8);
		addBone("head", s4, s4);
		addJoint("neck", "center", "head");
		addJoint("middle body", "center", "body");
		bend("neck", -180);
		bend("middle body", 90);
		
		addBone("left axle", s1, s4);
		addBone("right axle", s1, s4);
		addJoint("left axle body", "body", "left axle", 4, 0);
		addJoint("right axle body", "body", "right axle", 12, 0);
		bend("left axle body", -90);
		bend("right axle body", -90);
		
		addBone("left wheel", s4, s4);	
		addJoint("left wheel body", "left axle", "left wheel", 0, -4)
			.addAnimation("walk", [-90, -180, -270, -360], 2)
			.addAnimation("stand", [0], 1)
			.flipped = true;
		bend("left wheel body", 45);
		
		addBone("right wheel", s4, s4);
		addJoint("right wheel body", "right axle", "right wheel", 0, -4)
			.addAnimation("walk", [-90, -180, -270, -360], 2)
			.addAnimation("stand", [0], 1)
			.flipped = true;
		bend("right wheel body", 45);
		
		for(member in group.members)
		{
			var bone:FlxSprite = cast(member, FlxSkeletonBone);
			
			bone.y += s8 + s4;
			bone.x += width / 2;
		}
	}
}
