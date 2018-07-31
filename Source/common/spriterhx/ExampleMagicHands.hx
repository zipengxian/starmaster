import flash.geom.Point;
import starling.animation.IAnimatable;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.extensions.PDParticleSystem;
import starling.textures.Texture;
import common.spriterhx.spriter.SpriterClip;
import common.spriterhx.spriter.SpriterLoader;
import starling.display.Image;

class ExampleMagicHands extends Sprite implements IAnimatable
{

	@:meta(Embed(source="/assets/particles/firehands/particle.pex",mimeType="application/octet-stream"))

	static public var particleXml : Class<Dynamic>;
	@:meta(Embed(source="/assets/particles/firehands/texture.png"))

	static public var particleBitmap : Class<Dynamic>;
	var spriter : SpriterClip;
	var loader : SpriterLoader;
	var dragTarget : DisplayObject;
	var emitterFront : PDParticleSystem;
	var emitterBack : PDParticleSystem;
	public function new()
	{
		SpriterAS_Demo.setText("Fire Hands", "Demonstrates how you can map other display objects to your animations. In this case, we're using 2 particle emitters, attached to the characters hands.");
		loader = new SpriterLoader();
		loader.completed.addOnce(onLoadComplete);
		loader.load(["assets/spriter/mage/mage.scml"], .75);
	}

	function onLoadComplete(loader : SpriterLoader) : Void
	{
		spriter = loader.getSpriterClip("mage");
		spriter.y = 150;
		spriter.x = 350;
		spriter.playbackSpeed = .75;
		spriter.play("run");
		Starling.juggler.add(spriter);
		addChild(spriter);
		emitterFront = new PDParticleSystem(new FastXML(Type.createInstance(particleXml, [])), Texture.fromBitmap(Type.createInstance(particleBitmap, [])));
		addChild(emitterFront);
		emitterFront.start();
		Starling.juggler.add(emitterFront);
		emitterBack = new PDParticleSystem(new FastXML(Type.createInstance(particleXml, [])), Texture.fromBitmap(Type.createInstance(particleBitmap, [])));
		addChildAt(emitterBack, 0);
		emitterBack.start();
		Starling.juggler.add(emitterBack);
		Starling.juggler.add(this);
	}

	function onSpriteTouched(event : TouchEvent) : Void
	{
		var target : DisplayObject = Std.is(event.target, DisplayObject);
		var touch : Touch = event.touches[0];
		//User Has Pressed on a Piece
		if (touch.phase == TouchPhase.BEGAN) 
		{
			dragTarget = target;
			spriter.excludePiece(target, true);
		}

		else //User has released a piece
		if (touch.phase == TouchPhase.ENDED) 
		{
			dragTarget = null;
			spriter.excludePiece(target, false);
		}

		else //User has moved the mouse while a piece is being dragged
		if (dragTarget != null && touch.phase == TouchPhase.MOVED) 
			//Convert global X/Y to local
		
		{
			var pt : Point = spriter.globalToLocal(new Point(touch.globalX, touch.globalY));
			dragTarget.x = pt.x;
			dragTarget.y = pt.y;
		}
;
	}

	public function advanceTime(time : Float) : Void
	{
		var frontHand : Image = spriter.getImage("mage_0000_handfront");
		emitterFront.emitterX = spriter.x + frontHand.x;
		emitterFront.emitterY = spriter.y + frontHand.y;
		var backHand : Image = spriter.getImage("mage_0004_handback");
		emitterBack.emitterX = spriter.x + backHand.x;
		emitterBack.emitterY = spriter.y + backHand.y;
	}

}

