package entity.group;
import entity.Tree;
import flixel.group.FlxGroup;

/**
 * ...
 * @author blaze
 */
class Plants extends FlxGroup
{

	public function new() 
	{
		super(0);
	}
	
	//树
	public function addTree(mX:Int, mY:Int):Void
	{
		var tree:Tree = new Tree(mX, mY);
		add(tree);
	}
	
}