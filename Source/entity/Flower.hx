package Seagull
{
	import com.adamatomic.flixel.FlxArray;
	import com.adamatomic.flixel.FlxG;
	import com.adamatomic.flixel.FlxSprite;
	import com.adamatomic.flixel.FlxState;
	
	public class Flower extends FlxSprite
	{
		[Embed(source = "../data/flower.png")] public static var ImgFlower:Class;
		[Embed(source = "../data/flower_stem_unit_0.png")] private var ImgStem:Class;
		
		public var stem:FlxArray;
		
		public var locked:int = 0;
		private var falling:int = 0;
		
		private var shake_range:int = 1;
		private var shake_pos:Number = 0;
		private var shake_dir:int = -1;
		private var shake_speed:Number = 0.1;
		private var shake_timer:Number = 0;
		
		private var totalheight:int = height;
		
		private var parent:FlxState;
		
		public function Flower(parentstate:FlxState)
		{
			super(ImgFlower, 150, 240, false, false);
			parent = parentstate;
			stem = new FlxArray();
		}
		
		override public function update():Void
		{
			totalheight = this.height + this.y;
			
			x += shake();
			
			for (var i:int = 0; i < stem.length; i++)
			{
				if ((stem[i] as FlxSprite).y >= 240) (stem[i] as FlxSprite).kill();
				totalheight += (stem[i] as FlxSprite).height;
				stem[i].y++;
			}
			
			while (totalheight < 240)
			{
				var spr:FlxSprite = new FlxSprite(ImgStem, x, y + height, false, false, 32, 0, 0);
				stem.push(spr);
				parent.add(spr);
				totalheight += spr.height;
			}
			
			super.update();
			
			if (locked==0)
			{
				if(FlxG.kLeft)
				{
					if (x>1) x--;
				}
				if(FlxG.kRight)
				{
					if (x<276) x++;
				}
				if (falling==0)
				{
					if(FlxG.kUp)
					{
						if (y>1) y--;
					}
					if(FlxG.kDown)
					{
						if (y<192) y++;
					}
				}
			}
			
			x += shake();
		}

		private function shake():Int
		{
			/*shake_timer++;
			if (shake_timer==shake_speed) {
				if ((shake_pos >= shake_range) || (shake_pos <= -shake_range)) shake_dir = -shake_dir;
				shake_pos += shake_dir;
				shake_timer = 0;
			}*/
			
			shake_timer += FlxG.elapsed;
			if (shake_timer >= shake_speed)
			{
				shake_pos += shake_dir;
				shake_timer -= shake_speed;
				if ((shake_pos >= shake_range) || (shake_pos <= -shake_range)) shake_dir = -shake_dir;
			}
			
			return shake_pos;
		}
	}	
}