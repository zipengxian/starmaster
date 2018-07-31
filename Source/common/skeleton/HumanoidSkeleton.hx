package common.skeleton;

import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import flixel.FlxSprite;

class HumanoidSkeleton extends FlxSkeleton
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
	
	public function changeWeapon(newWeapon:String, oldWeapon:String)
	{
		addBone(newWeapon);
		group.remove(bonesByName[oldWeapon], true);
		
		if (newWeapon == "sword")
		{
			//addJoint("left shoulder", "center", "upper left arm");
				//.addAnimation("stand", [-10], 2)
				//.addAnimation("walk", [-20, 20], 1)
				//.addAnimation("run", [-60, 60], 2)
				//.addAnimation("jump up", [-80], 2)
				//.addAnimation("jump down", [-40, -20], 1)
				//.addAnimation("fall", [90, 180, 270, 0], 5);
			//addJoint("left elbow", "upper left arm", "lower left arm")
				//.addAnimation("stand", [15], 2)
				//.addAnimation("walk", [15, 10], 1)
				//.addAnimation("run", [80, 90], 2)
				//.addAnimation("jump up", [15], 1)
				//.addAnimation("jump down", [15], 1)
				//.flipped = true;
			addJoint("left weapon", "lower left arm", "sword", -5, -5)
				.addAnimation("stabbed", [-120, -30], 5, false);
			bend("left weapon", -45);
			bend("left shoulder", 45);
			bend("left elbow", 45);
		}
		else
		{
			//addJoint("left shoulder", "center", "upper left arm");
				//.addAnimation("stand", [-70], 1)
				//.addAnimation("walk", [-20, 20], 1)
				//.addAnimation("run", [-60, 60], 2)
				//.addAnimation("jump up", [-80], 2)
				//.addAnimation("jump down", [-40, -20], 1)
				//.addAnimation("fall", [90, 180, 270, 0], 5);
			//addJoint("left elbow", "upper left arm", "lower left arm")
				//.addAnimation("stand", [30], 2)
				//.addAnimation("walk", [15, 10], 1)
				//.addAnimation("run", [80, 90], 2)
				//.addAnimation("jump up", [15], 1)
				//.addAnimation("jump down", [15], 1)
				//.addAnimation("shoot", [50], 5, false)
				//.flipped = true;
			addJoint("left weapon", "lower left arm", newWeapon, 2, -10);
			bend("left weapon", 90);
			bend("left shoulder", -70);
			bend("left elbow", 45);
		}
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
		
		addBone("upper left arm", s1, s4, "assets/sprite/player/upperarm.png");
		addBone("lower left arm", s1, s4, "assets/sprite/player/lowerarm.png");
		addBone("sword", s1, s8, "assets/sprite/player/weapon.png");
		addBone("gun", s1, s8, "assets/sprite/player/weapon.png", false);
		
		addBone("body", s1, s8, "assets/sprite/player/body.png");
		addBone("head", s4, s4, "assets/sprite/player/header.png");
		addJoint("neck", "center", "head")
			.flipped = true;
		addJoint("middle body", "center", "body")
			.addAnimation("stand", [0], 2)
			.addAnimation("walk", [3], 1)
			.addAnimation("run", [5], 1);
		bend("middle body", 0);
		
		addJoint("left shoulder", "center", "upper left arm", -2, -2, 8, 5)
			//.addAnimation("stand", [-10], 2)
			//.addAnimation("walk", [-20, 20], 1)
			//.addAnimation("run", [-60, 60], 2)
			//.addAnimation("jump up", [-80], 2)
			//.addAnimation("jump down", [-40, -20], 1)
			//.addAnimation("fall", [90, 180, 270, 0], 5)
			.addAnimation("stabbed", [-40, -20], 5, false);
		addJoint("left elbow", "upper left arm", "lower left arm")
			//.addAnimation("stand", [15], 2)
			//.addAnimation("walk", [15, 10], 1)
			//.addAnimation("run", [80, 90], 2)
			//.addAnimation("jump up", [15], 1)
			//.addAnimation("jump down", [15], 1)
			.addAnimation("stabbed", [50, 30], 5, false)
			.flipped = true;
		addJoint("left weapon", "lower left arm", "sword", 0, -5)
			.addAnimation("stabbed", [-120, -30], 5, false);
		bend("left weapon", -45);
		bend("left shoulder", 45);
		bend("left elbow", 45);
		
		addBone("upper right arm", s1, s4, "assets/sprite/player/upperarm.png");
		addBone("lower right arm", s1, s4, "assets/sprite/player/lowerarm.png");
		addJoint("right shoulder", "center", "upper right arm", 2, -2, -8, 5)
			.addAnimation("stand", [-10], 2)
			.addAnimation("walk", [20, -20], 1)
			.addAnimation("run", [60, -60], 2)
			.addAnimation("jump up", [70], 2)
			.addAnimation("jump down", [40, 20], 1)
			.addAnimation("fall", [270, 0, 90, 180], 5);
		addJoint("right elbow", "upper right arm", "lower right arm")
			.addAnimation("stand", [15], 2)
			.addAnimation("walk", [15, 10], 1)
			.addAnimation("run", [90, 80], 2)
			.addAnimation("jump up", [15], 1)
			.addAnimation("jump down", [15], 1)
			.flipped = true;
		bend("right shoulder", -80);
		bend("right elbow", 45);
		
		addBone("upper left leg", s1, s4, "assets/sprite/player/upperleg.png");
		addBone("lower left leg", s1, s4, "assets/sprite/player/lowerleg.png");
		addJoint("left hip", "body", "upper left leg")
			.addAnimation("stand", [-5], 2)
			.addAnimation("walk", [0, 25, 0, -25], 2)
			.addAnimation("run", [0, 40, 0, -65], 4)
			.addAnimation("jump up", [-25], 3)
			.addAnimation("jump down", [-10, 50, -10, -75], 2);
		addJoint("left knee", "upper left leg", "lower left leg")
			.addAnimation("stand", [5], 2)
			.addAnimation("walk", [0, 25, 45, 0], 2)
			.addAnimation("run", [0, 45, 90, 0], 4)
			.addAnimation("jump up", [60], 3)
			.addAnimation("jump down", [50, 30, 10, 30], 2);
		
		addBone("upper right leg", s1, s4, "assets/sprite/player/upperleg.png");
		addBone("lower right leg", s1, s4, "assets/sprite/player/lowerleg.png");
		addJoint("right hip", "body", "upper right leg")
			.addAnimation("stand", [0], 2)
			.addAnimation("walk", [0, -25, 0, 25], 2)
			.addAnimation("run", [0, -65, 0, 40], 4)
			.addAnimation("jump up", [5], 3)
			.addAnimation("jump down", [-10, -75, -10, 50], 2);
		addJoint("right knee", "upper right leg", "lower right leg")
			.addAnimation("stand", [5], 2)
			.addAnimation("walk", [45, 0, 0, 25], 2)
			.addAnimation("run", [90, 0, 0, 45], 4)
			.addAnimation("jump up", [15], 3)
			.addAnimation("jump down", [10, 30, 50, 30], 2);
		
		for(member in group.members)
		{
			var bone:FlxSprite = cast(member, FlxSkeletonBone);
			
			bone.y += s4;
			bone.x += width / 2;
		}
	}
}
