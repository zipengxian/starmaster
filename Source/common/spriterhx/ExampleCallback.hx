import com.bit101.components.HUISlider;
import starling.core.Starling;
import starling.display.Sprite;
import starling.textures.TextureAtlas;
import common.spriterhx.spriter.SpriterClip;
import common.spriterhx.spriter.SpriterLoader;

class ExampleCallback extends Sprite
{

	@:meta(Embed(source="/assets/spriter/orc/orc.scml",mimeType="application/octet-stream"))

	public var OrcScml : Class<Dynamic>;
	var atlas : TextureAtlas;
	var lastTick : Int;
	var spriter : SpriterClip;
	var speedSlider : HUISlider;
	var startX : Float;
	var startY : Float;
	var loader : SpriterLoader;
	public function new()
	{
		lastTick = 0;
		startX = 250;
		startY = 0;
		SpriterAS_Demo.setText("Callback Example", "Add a callback each time a foot touches the ground, and programtically 'shake' the character. \nNotice that this works independant of playback speed.");
		loader = new SpriterLoader();
		loader.completed.addOnce(onLoadComplete);
		loader.load(["assets/spriter/orc/orc.scml"], .5);
	}

	function onLoadComplete(loader : SpriterLoader) : Void
	{
		spriter = new SpriterClip(loader.getAnimationSet("orc"), loader.textureAtlas);
		spriter.x = startX;
		spriter.y = startY;
		spriter.play("run");
		Starling.juggler.add(spriter);
		addChild(spriter);
		//To determing when an animation has completed, just listen for the animationComplete signal.
		spriter.animationComplete.add(function(clip : SpriterClip)
		{
			trace("animationComplete");
		}
);
		//To respond an specific timed events, add a custom callback:
		spriter.addCallback(function()
		{
			trace("left Foot");
			shakeSprite(3);
		}
, 840, false);
		//Callback @ 840ms
		spriter.addCallback(function()
		{
			trace("Right Foot");
			shakeSprite(6);
		}
, 400, false);
		//Callback @ 400ms
		//Add slider to adjust playback speed
		speedSlider = new HUISlider(SpriterAS_Demo._stage, 100, 220, "Playback Speed", onSpeedChanged);
		speedSlider.minimum = .01;
		speedSlider.maximum = 3;
		speedSlider.value = .25;
		speedSlider.setSize(500, speedSlider.height);
		SpriterAS_Demo._stage.addChild(speedSlider);
		onSpeedChanged();
	}

	function onSpeedChanged(event : Dynamic = null) : Void
	{
		spriter.playbackSpeed = speedSlider.value;
	}

	function shakeSprite(amount : Int) : Void
	{
		var i : Int = 0;
		while (i < amount)
		{
			setTimeout(function()
			{
				spriter.x = startX - 5 + 10 * Math.random();
				spriter.y = -5 + 10 * Math.random();
			}
, i * 34);
			i++;
		}
		setTimeout(function()
		{
			spriter.x = startX;
			spriter.y = 0;
		}
, i * 34);
	}

}

