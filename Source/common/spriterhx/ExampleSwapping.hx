import flash.filesystem.File;
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.TextureAtlas;
import common.spriterhx.spriter.AnimationSet;
import common.spriterhx.spriter.SpriterClip;
import common.spriterhx.spriter.SpriterLoader;
import common.spriterhx.starling.TextureLoader;

class ExampleSwapping extends Sprite
{

	@:meta(Embed(source="/assets/spriter/orc/orc.scml",mimeType="application/octet-stream"))

	public var OrcScml : Class<Dynamic>;
	var atlas : TextureAtlas;
	var lastTick : Int;
	var spriter : SpriterClip;
	var loader : SpriterLoader;
	public function new()
	{
		lastTick = 0;
		SpriterAS_Demo.setText("Swap Example", "We can make the character blink at any point in their animation cycle, simply by swapping their Eye Sprites");
		loader = new SpriterLoader();
		loader.completed.addOnce(onLoadComplete);
		loader.load(["assets/spriter/orc/orc.scml"], .5);
	}

	function onLoadComplete(loader : SpriterLoader) : Void
	{
		spriter = loader.getSpriterClip("orc");
		spriter.x = 300;
		spriter.playbackSpeed = 1;
		addChild(spriter);
		Starling.juggler.add(spriter);
		spriter.play("idle");
		//Tell the Orc to attack every little while
		setInterval(attack, 3500);
		//Make the sprite Blink by swapping his Eye sprites every few seconds.
		setTimeout(blink, 2000);
	}

	function attack() : Void
	{
		spriter.play("attack");
		spriter.animationComplete.addOnce(function(spriterClip : SpriterClip)
		{
			spriter.play("idle");
		}
);
	}

	function blink() : Void
	{
		spriter.swapPiece("orc_0000_eyes", "orc_0000_eyes_closed");
		setTimeout(function() : Void
		{
			spriter.unswapPiece("orc_0000_eyes");
			//Sometimes blink twice
			if (Math.random() < .3) 
			{
				setTimeout(function()
				{
					spriter.swapPiece("orc_0000_eyes", "orc_0000_eyes_closed");
				}
, 60);
				setTimeout(function()
				{
					spriter.unswapPiece("orc_0000_eyes");
				}
, 90);
			}
			setTimeout(blink, 1000 + Math.random() * 2500);
		}
, 60);
	}

}

