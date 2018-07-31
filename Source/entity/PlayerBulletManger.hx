package entity;

import flixel.group.FlxGroup;
import flixel.util.FlxPoint;

class PlayerBulletManger extends FlxGroup
{
	public function new()
	{
		super();
		for(i in 0...30)
		{
			add(new PlayerBullet());
		}
	}
	public function fire(Location:FlxPoint, Target:FlxPoint):Void
	{
		if(getFirstAvailable() != null)
		{	
			cast((getFirstAvailable()), PlayerBullet).fire(Location, Target);
		}
	}
}
