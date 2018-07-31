package common.skeleton;

import flixel.FlxG;
import flixel.util.FlxPoint;

class FlxSkeletonJoint
{	
	public var parent:FlxSkeletonBone;
	public var child:FlxSkeletonBone;
	public var _animations:Map<String, FlxAnim>;
	public var _callback:String->UInt->Float->Void;
	public var _curAnim:FlxAnim;
	public var _fromAngle:Float;
	public var _curFrame:Int;
	public var _toAngle:Float;
	public var _frameTimer:Float;
	public var finished:Bool;
	public var flipped:Bool;
	public var angle:Float;
	
	public var endPoint(get, never):FlxPoint;
	
	public function get_endPoint():FlxPoint { return parent.endPoint; }
	
	public function new(Parent:FlxSkeletonBone, Child:FlxSkeletonBone)
	{
		parent = Parent;
		child = Child;
		_animations = new Map<String, FlxAnim>();
		_callback = null;
		_curAnim = null;
		_fromAngle = 0;
		_curFrame = 0;
		_toAngle = 0;
		_frameTimer = 0;
		angle = 0;
		finished = false;
	}
	
	public function play(AnimName:String, Force:Bool=true):Void
	{
		if((_curAnim != null) && (AnimName == _curAnim.name))
		{
			return;
		}
			
		var a:FlxAnim = _animations[AnimName];
		
		if (a != null)
		{
			_fromAngle = angle;
			_curFrame = _curFrame % a.frames.length;
			_curAnim = a;
			_toAngle = _curAnim.frames[_curFrame];			
		}
		else
		{
			FlxG.log.warn("WARNING: No animation called \""+AnimName+"\"");
		}
	}
	
	public function addAnimation(Name:String, Frames:Array<Int>, FrameRate:Float=0, Looped:Bool=true):FlxSkeletonJoint
	{
		//if(_animations[Name] == null)
		_animations[Name] = new FlxAnim(Name,Frames,FrameRate,Looped);
		
		return this;
	}
	
	public function addAnimationCallback(AnimationCallback:String->UInt->Float->Void):FlxSkeletonJoint
	{
		_callback = AnimationCallback;
		
		return this;
	}
	
	public function update():Void
	{
		updateAnimation();
		
		if (child != null)
			child.angle = (flipped ? 360-angle : angle) + parent.angle;
	}
	
	public function updateAnimation():Void
	{
		if((_curAnim != null) && (_curAnim.delay > 0) && (_curAnim.looped || !finished))
		{
			_frameTimer += FlxG.elapsed;
			while(_frameTimer > _curAnim.delay)
			{
				_frameTimer = _frameTimer - _curAnim.delay;
				if(_curFrame == _curAnim.frames.length-1)
				{
					if(_curAnim.looped)
						_curFrame = 0;
					finished = true;
				}
				else
					_curFrame++;
					
				_fromAngle = angle;
				_toAngle = _curAnim.frames[_curFrame];
			}
		}
		
		calcFrame();
		
		//只执行一次动作则初始化
		if ((_curAnim != null) && (!_curAnim.looped && finished))
		{
			_curAnim = null;
			_curFrame = 0;
			finished = false;
			_frameTimer = 0;
		}
	}
	
	public function calcFrame():Void
	{
		if (_curAnim != null)
		{
			var percent:Float = _frameTimer / _curAnim.delay;
			
			if (_toAngle - _fromAngle < -180)
				_toAngle += 360;
			
			angle = _fromAngle + (_toAngle - _fromAngle) * percent;
			
			if (angle < 0)
				angle += 360;
			else
				angle %= 360;
		}
		
		if(_callback != null)
			_callback(((_curAnim != null)?(_curAnim.name):null),_curFrame,angle);
	}
}
