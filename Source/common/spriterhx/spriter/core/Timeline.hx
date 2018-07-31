package common.spriterhx.spriter.core;

class Timeline
{

	public var id : String;
	public var name : String;
	public var object_type : String; //object、bone
	public var keys : Array<TimelineKey>;
	public function new(id : String, name : String, object_type : String, keys : Array<TimelineKey>)
	{
		this.id = id;
		this.keys = keys;
		this.name = name;
		this.object_type = object_type;
	}

}

