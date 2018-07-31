import flash.geom.Point;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import common.spriterhx.spriter.SpriterClip;
import common.spriterhx.spriter.SpriterLoader;

class ExampleDragAndDrop extends Sprite
{

	var spriter : SpriterClip;
	var loader : SpriterLoader;
	var dragTarget : DisplayObject;
	public function new()
	{
		SpriterAS_Demo.setText("Drag and Drop", "Click on any of the character's part's to begin dragging it. \nDemonstrates the ability to control specific body-parts outside of the animation. \nThis would allow for dismemberment (ala Plants vs Zombies).");
		loader = new SpriterLoader();
		loader.completed.addOnce(onLoadComplete);
		loader.load(["assets/spriter/brawler/brawler.scml"], .75);
	}

	function onLoadComplete(loader : SpriterLoader) : Void
	{
		spriter = new SpriterClip(loader.getAnimationSet("brawler"), loader.textureAtlas);
		spriter.x = 200;
		spriter.play("run");
		Starling.juggler.add(spriter);
		addChild(spriter);
		//For performance reasons, SpriterClip's are not touchable by default.
		spriter.touchable = true;
		spriter.addEventListener(TouchEvent.TOUCH, onSpriteTouched);
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

}

