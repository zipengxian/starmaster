package common.spriterhx.spriter.core;

class Piece
{
	public var folderId(get, never) : String;

	public var id : String;
	public var folder : String;
	public var name : String;
	public var width : Int;
	public var height : Int;
	public function new()
	{
	}

	public function get_folderId() : String
	{
		return folder + "_" + id;
	}

}

