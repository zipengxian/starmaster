package common.spriterhx.spriter.core;

class Animation
{

	public var name : String;
	public var id : Int;
	public var length : Int;
	public var position : Int;
	public var looping : Bool;
	public var timelineList : Array<Timeline>;
	public var mainline : Mainline;
	public function new()
	{
		timelineList = new Array<Timeline>();
	}

}

