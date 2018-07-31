package common.skeleton;

import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.FlxSprite;

class PetSkeleton extends FlxSkeleton
{
	private var center:FlxSkeletonBone;
	
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
		addBone("body", s1, s8);
		addBone("head", s4, s4);
		addJoint("neck", "center", "head");
		addJoint("middle body", "center", "body")
			.addAnimation("stand", [90 + 1], 2)
			.addAnimation("walk", [90 + 3], 1)
			.addAnimation("run", [90 + 5], 1);
		bend("middle body", 0);
		
		addBone("upper left arm", s1, s4);
		addBone("lower left arm", s1, s4);	
		addJoint("left shoulder", "center", "upper left arm")
			.addAnimation("stand", [-10], 2)
			.addAnimation("walk", [-20, 20], 1)
			.addAnimation("run", [-60, 60], 2)
			.addAnimation("jump up", [-80], 2)
			.addAnimation("jump down", [-40, -20], 1)
			.addAnimation("fall", [90, 180, 270, 0], 5)
			.addAnimation("attack", [-60, -40], 5);
		addJoint("left elbow", "upper left arm", "lower left arm")
			.addAnimation("stand", [15], 2)
			.addAnimation("walk", [15, 10], 1)
			.addAnimation("run", [30, 20], 2)
			.addAnimation("jump up", [15], 1)
			.addAnimation("jump down", [15], 1)
			.addAnimation("attack", [15, -15], 5)
			.flipped = true;
		bend("left shoulder", 45);
		bend("left elbow", 45);
		
		addBone("upper right arm", s1, s4);
		addBone("lower right arm", s1, s4);
		addJoint("right shoulder", "center", "upper right arm")
			.addAnimation("stand", [-10], 2)
			.addAnimation("walk", [20, -20], 1)
			.addAnimation("run", [60, -60], 2)
			.addAnimation("jump up", [70], 2)
			.addAnimation("jump down", [40, 20], 1)
			.addAnimation("fall", [270, 0, 90, 180], 5);
		addJoint("right elbow", "upper right arm", "lower right arm")
			.addAnimation("stand", [15], 2)
			.addAnimation("walk", [15, 10], 1)
			.addAnimation("run", [30, 20], 2)
			.addAnimation("jump up", [15], 1)
			.addAnimation("jump down", [15], 1)
			.flipped = true;
		bend("right shoulder", -80);
		bend("right elbow", 45);
		
		addBone("upper left leg", s1, s4);
		addBone("lower left leg", s1, s4);
		addJoint("left hip", "body", "upper left leg")
			.addAnimation("stand", [-90-5], 2)
			.addAnimation("walk", [-90 + 0, -90 + 25, -90 + 0, -90 -25], 2)
			.addAnimation("run", [-90 + 0, -90 + 40, -90 + 0, -90 -65], 4)
			.addAnimation("jump up", [-90 -25], 3)
			.addAnimation("jump down", [-90 -10, -90 + 50, -90 -10, -90 -75], 2);
		addJoint("left knee", "upper left leg", "lower left leg")
			.addAnimation("stand", [5], 2)
			.addAnimation("walk", [0, 25, 45, 0], 2)
			.addAnimation("run", [0, 45, 90, 0], 4)
			.addAnimation("jump up", [60], 3)
			.addAnimation("jump down", [50, 30, 10, 30], 2);
		
		addBone("upper right leg", s1, s4);
		addBone("lower right leg", s1, s4);
		addJoint("right hip", "body", "upper right leg")
			.addAnimation("stand", [-90 + 0], 2)
			.addAnimation("walk", [-90 + 0, -90 -25, -90 + 0, -90 + 25], 2)
			.addAnimation("run", [-90 + 0, -90 -65, -90 + 0, -90 + 40], 4)
			.addAnimation("jump up", [-90 + 5], 3)
			.addAnimation("jump down", [-90 -10, -90 -75, -90 -10, -90 + 50], 2);
		addJoint("right knee", "upper right leg", "lower right leg")
			.addAnimation("stand", [5], 2)
			.addAnimation("walk", [45, 0, 0, 25], 2)
			.addAnimation("run", [90, 0, 0, 45], 4)
			.addAnimation("jump up", [15], 3)
			.addAnimation("jump down", [10, 30, 50, 30], 2);
			
		addBone("tailer", s1, s4);
		addJoint("main tailer", "body", "tailer")
			.addAnimation("stand", [0], 2)
			.addAnimation("walk", [0 + 0, 0 -25, 0 + 0, 0 + 25], 2)
			.addAnimation("run", [0 + 0, 0 -65, 0 + 0, 0 + 40], 4)
			.addAnimation("jump up", [0 + 5], 3)
			.addAnimation("jump down", [0 -10, 0 -75, 0 -10, 0 + 50], 2);
		
		for(member in group.members)
		{
			var bone:FlxSprite = cast(member, FlxSkeletonBone);
			
			bone.y += s8 + s4;
			bone.x += width / 2;
		}
	}
}
