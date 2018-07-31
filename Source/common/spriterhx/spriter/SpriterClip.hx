package common.spriterhx.spriter;

import flash.display.Bitmap;
import flash.geom.Matrix;
import flash.utils.Dictionary;
import flash.display.Sprite;
import flash.display.BitmapData;
import flash.display.DisplayObject;

import flash.Lib;
import flash.events.Event;
//import starling.textures.Texture;
//import starling.textures.TextureAtlas;
//import starling.textures.TextureSmoothing;


import common.spriterhx.spriter.core.Animation;
import common.spriterhx.spriter.core.Child;
import common.spriterhx.spriter.core.MainlineKey;
import common.spriterhx.spriter.core.Timeline;
import common.spriterhx.spriter.core.TimelineKey;
import msignal.Signal;
import common.spriterhx.textures.ITextureAtlas;
import common.spriterhx.textures.SubTextureData;

import common.spriterhx.utils.ConstValues;

class SpriterClip extends Sprite
{
	public var isPlaying(get, never) : Bool;

	static var TO_RADS : Float = Math.PI / 180;
	// Protected
	public var container : Sprite;
	var frameIndex : Int;
	var frame : MainlineKey;
	var nextFrame : MainlineKey;
	var callbackList : Array<Callback>;
	//var swapHash : Map<String, String>;
	var imagesByTimeline : Map<Int, DisplayObject>;
	var displaysByName : Map<String, DisplayObject>;
	var imagesByName : Map<String, DisplayObject>;
	var texturesByName : Dynamic;
	//var texturesByImage : Dictionary;
	var childImages : Array<DisplayObject>;
	var _isPlaying : Bool;
	var currentColor : Float;
	// Public
	public var textureAtlas : ITextureAtlas;
	public var animations : AnimationSet;
	public var animation : Animation;
	public var animationComplete : Signal1<SpriterClip>;
	//public var playbackSpeed : Float;
	public var position : Float;
	public var animationWidth : Float;
	public var animationHeight : Float;
	//public var animationFactor : Float;
	public var ignoredPieces : Map<String, Bool>;
	// tmp vars, to avoid memory allocation in the main loop. */
	//var lastTime : Int;
	var updateFrame : Bool;
	var timelineId : Int;
	var textures : Array<DisplayObject>;
	var firstRun : Bool;
	var pieceName : String;
	var minX : Float;
	var minY : Float;
	var r : Float;
	var child : Child;
	var nextChild : Child;
	var image : DisplayObject;
	var i : Int;
	var l : Int;
	var startTime : Int;
	var endTime : Int;
	var lerpAmount : Float;
	var timeline : Timeline;
	var key : TimelineKey;
	var spinDir : Int;
	var angle1 : Float;
	var angle2 : Float;
	var rangeValue : Float;
	var nameHash : String;
	var tmpNameHash : String;
	var clearChildren : Bool;
	var advanceFrame : Bool;
	var _last: Int;
	
	public var lastAngle:Map<Int, Float>;
	public var lastAngle2:Map<Int, Float>;
	public var lastFile:Map<Int, String>;
	// end tmp vars
	public function new(animationsV : AnimationSet, textureAtlasV : ITextureAtlas)
	{
		super();
		
		frameIndex = 0;
		//playbackSpeed = 1;
		//animationFactor = 1;
		textureAtlas = textureAtlasV;
		animations = animationsV;
		callbackList = new Array<Callback>();
		//swapHash = new Map<String, String>();
		imagesByTimeline = new Map<Int, DisplayObject>();
		texturesByName = null;
		displaysByName = new Map<String, DisplayObject>();
		imagesByName = new Map<String, DisplayObject>();//nouse
		ignoredPieces = new Map<String, Bool>();
		//texturesByImage = new Dictionary(true);
		childImages = new Array<DisplayObject>();
		container = new Sprite();
		addChild(container);
		animationComplete = new Signal1(SpriterClip);
		//this.touchable = false;
		
		lastAngle = new Map<Int, Float>();
		lastAngle2 = new Map<Int, Float>();
		lastFile = new Map<Int, String>();
	}

	//override public function setTouchable(value : Bool) : Bool
	//{
		//super.touchable = value;
		//container.touchable = value;
		//return value;
	//}

	public function addCallback(callback : Dynamic, time : Int, addOnce : Bool = true) : Void
	{
		if (time > animation.length) 
		{
			time = animation.length;
		}
		callbackList.push(new Callback(callback, Std.int(Math.min(time, animation.length)), addOnce));
	}

	public function get_isPlaying() : Bool
	{
		return _isPlaying;
	}

	public function setPosition(x : Int, y : Int) : Void
	{
		this.x = x;
		this.y = y;
	}

	public function play(name : String, startPosition : Int = 0, clearCallbacks : Bool = false) : Void
	{
		if (animations.getByName(name) == null) 
		//throw(new Error("[SpriterSprite] Unable to find animation name: " + name));
		{
			return;
		}
		animation = animations.getByName(name);
		position = startPosition;
		//Empty the callback list
		if (clearCallbacks) 
		{
			untyped callbackList.length = 0;
		}
		_isPlaying = true;
		frameIndex = -1;
		frame = nextFrame = animation.mainline.keys[0];
		if (animation.mainline.keys.length > 1) 
		{
			nextFrame = animation.mainline.keys[1];
		}
		//lastTime = Math.round(haxe.Timer.getStamp() / 1000)();
		//update(0, true);
		
		_last = 0;
		
		addEventListener(Event.ENTER_FRAME, update);
	}

	public function stop() : Void
	{
		_isPlaying = false;
	}

	public function clearCallbacks() : Void
	{
		untyped callbackList.length = 0;
	}

	/** Hook for Starling Juggler Interface **/	
	public function advanceTime(time : Float) : Void
	{
		//update(time * 1000);
	}

	//public function update(elapsed : Float = 0, forceNextFrame : Bool = false) : Void
	public function update(?pEvt:Event):Void
	{
		var _time: Int = Lib.getTimer();
		var elapsed: Int = _last == 0 ? 0 : _time - _last;
		//var elapsed : Float = (_time - _last) * 0.001;
		//if (elapsed > 33.3) elapsed = 33.3;
		_last = _time;
 		var forceNextFrame:Bool = true;
		
		if (!_isPlaying) 
		{
			return;
		}
		// Exit if we're not currently playing
		position += elapsed * 1;
		updateCallbacks();
		minX = minY = ConstValues.INT_MAX_VALUE;
		startTime = frame.time;
		endTime = (nextFrame != null) ? nextFrame.time : 0;
		if (endTime == 0 || endTime > animation.length) 
		{
			endTime = animation.length;
		}
		//lastTime = Math.round(haxe.Timer.getStamp() / 1000)();
		//Determine whether we need to advance a frame
		advanceFrame = false;
		//Clip is just starting...
		if (position == 0 || frameIndex == -1) 
		{
			advanceFrame = true;
		}
		//Key frame has been passed
		if (position > endTime) 
		{
			advanceFrame = true;
			//Reached the end of the timeline, don't advance keyFrame
			if (frameIndex == animation.mainline.keys.length - 2) 
			{
				advanceFrame = false;
			}
		}
		//Animation has completed, or Explicit override
		if (position > animation.length || forceNextFrame) 
		{
			advanceFrame = true;
		}
		if (advanceFrame) 
		//Advance playhead
		{
			if (frameIndex <= animation.mainline.keys.length - 2) 
			{
				if (frameIndex == -1) 
				{
					frameIndex = 0;
				}
				while(animation.mainline.keys[frameIndex].time < position)
				{
					frameIndex++;
					if (frameIndex > animation.mainline.keys.length - 2) 
					{
						frameIndex = animation.mainline.keys.length - 2;
						break;
					}
				}

				if (animation.mainline.keys[frameIndex].time > position) 
				{
					frameIndex--;
				}
			}
			else 
			{
				frameIndex = 0;
			}

			//trace("ADVANCE FRAME: " + position);
			//Animation complete?
			if (position > animation.length) 
			{
				position = 0;
				//Reset all callbacks, TODO: Check if any callbacks on this final frame?
				//Loop or stop pakying...
				i = callbackList.length - 1;
				while (i >= 0)
				{
					callbackList[i].called = false;
					i--;
				}
				if (animation.looping) 
				{
					frameIndex = 0;
				}
				else 
				{
					_isPlaying = false;
				}

				animationComplete.dispatch(this);
				if (!_isPlaying) 
				{
					return;
				}
			}
			
			if (frameIndex > 0 || animation.looping) 
			{
				frame = animation.mainline.keys[frameIndex];
				if (animation.mainline.keys.length > frameIndex + 1) 
				{
					nextFrame = animation.mainline.keys[frameIndex + 1];
				}
				startTime = frame.time;
				endTime = (nextFrame != null) ? nextFrame.time : 0;
				if (endTime == 0) 
				{
					endTime = animation.length;
				}
			}
			
			firstRun = container.numChildren == 0;
			//Optimization, check whether we need to remove any children?
			optimizedRemoveChildren();
			untyped childImages.length = 0;
			//Measure this animation
			i = 0;
			l = frame.refs.length;
			while (i < l)
			{
				timelineId = frame.refs[i].timeline;
				if (animation.timelineList[timelineId].keys.length == 0) 
				{
					i++;
					continue;
				}
				child = animation.timelineList[timelineId].keys[frame.refs[i].key].child;
				if (child.piece == null) 
				{
					i++;
					continue;
				}
				
				if (!lastFile.exists(i))
				{
					lastFile[i] = child.piece.name;
				}
				
				//image.matrix = matrix;
				//image.pivotX = child.pixelPivotX;
				//image.pivotY = child.pixelPivotY;
				setPivot(child.piece.name, child.pixelPivotX, child.pixelPivotY, fixRotation(child.angle) * TO_RADS);
				
				//Create one image/timeline, and cache it off.
				image = imagesByTimeline[timelineId];
				if (image == null || child.piece.name != lastFile[i]) 
				{
					image = createImageByName(child.piece.name);
					imagesByTimeline[timelineId] = image;
					
					lastFile[i] = child.piece.name;
				}
				childImages.push(image);
				//Add the child to displayList if it isn't already
				if (image.parent == null) 
				{
					container.addChild(image);
				}
				//Make sure the image has the textures it's supposed to (one timeline can have multiple images).
				//if (texturesByImage[image] != getDisplay(child.piece.name)) 
				//{
					//texturesByImage[image] = getDisplay(child.piece.name);
					//image = texturesByImage[image];
				//}
				//If this piece is set to be ignored, do not update any of it's position data
				if (ignoredPieces[image.name]) 
				{
					i++;
					continue;
				}
				
				image.x = child.x - child.pixelPivotX;
				if (image.x < minX) 
				{
					minX = image.x;
				}
				image.y = -child.y - child.pixelPivotY;
				if (image.y < minY) 
				{
					minY = image.y;
				}
				image.scaleX = child.scaleX;
				image.scaleY = child.scaleY;
				
				if (!lastAngle.exists(i))
				{
					lastAngle[i] = 0.0;
				}
				if (!lastAngle2.exists(i))
				{
					lastAngle2[i] = 0.0;
				}
				
				var m:Matrix = image.transform.matrix.clone();
				//m.translate(- child.pixelPivotX, - child.pixelPivotY);
				var dx:Float = m.tx;
				var dy:Float = m.ty;
				m.translate(-dx, -dy);            //把位移归零
				//m.translate(-image.width/2, -image.height/2);              //宽高的一半，设置旋转点到中心点
				m.rotate((fixRotation(child.angle) - lastAngle[i] - lastAngle2[i]) * TO_RADS);             //旋转45度，这个跟a.rotation略有不同
				//m.translate(image.width/2, image.height/2);
				m.translate(dx, dy);       //恢复位移
				//image.transform.matrix = m;
				
				lastAngle2[i] = 0.0;
				lastAngle[i] = child.angle;
				
				//image.rotation = fixRotation(child.angle) * TO_RADS;
				i++;
			}
			if (Math.isNaN(animationWidth) && Math.isNaN(animationWidth) && frameIndex == 0) 
			{
				animationWidth = Math.abs(minX * 2) + container.width;
				animationHeight = Math.abs(minY * 2) + container.height;
			}
		}
		//Small, Incremental interpolated update
		if (position < endTime) 
		{
			spinDir = 0;
			i = 0;
			l = frame.refs.length;
			while (i < l)
			{
				//Get the most recent previous timeline for reference
				timeline = animation.timelineList[frame.refs[i].timeline];
				if (timeline.keys.length == 0) 
				{
					i++;
					continue;
				}
				var lerpStart : Float = startTime;
				var lerpEnd : Float = endTime;
				child = null;
				nextChild = null;
				key = timeline.keys[0];
				//Find the previous and next key's for this particular timeline.
				//If we couldn't find a next frame, this animation file is probably missing an endFrame. Substitute startFrame.
				var i2 : Int = 0;
				var l2 : Int = timeline.keys.length;
				while (i2 < l2)
				{
					//Looks for end frame
					if (timeline.keys[i2].time > position) 
					{
						if (nextChild == null) 
						{
							nextChild = timeline.keys[i2].child;
							lerpEnd = timeline.keys[i2].time;
						}

						else 
						{
							break;
						}

					}
					//Look for start frame
					if (timeline.keys[i2].time <= position) 
					{
						child = timeline.keys[i2].child;
						lerpStart = timeline.keys[i2].time;
					}
						
					i2++;
				}
				if (nextChild == null) 
				{
					nextChild = timeline.keys[0].child;
					lerpEnd = animation.length;
				}
				//Determine interpolation amount
				lerpAmount = (position - lerpStart) / (lerpEnd - lerpStart);
				
				//if (child.pixelPivotX != nextChild.pixelPivotX) 
				//{
					//image.pivotX = lerp(child.pixelPivotX, nextChild.pixelPivotX, lerpAmount);
				//}
				//if (child.pixelPivotY != nextChild.pixelPivotY) 
				//{
					//image.pivotY = lerp(child.pixelPivotY, nextChild.pixelPivotY, lerpAmount);
				//}
				var pivotX:Float = 0;
				var pivotY:Float = 0;
				if (child.pixelPivotX != nextChild.pixelPivotX) 
				{
					pivotX = lerp(child.pixelPivotX, nextChild.pixelPivotX, lerpAmount);
				}
				if (child.pixelPivotY != nextChild.pixelPivotY) 
				{
					pivotY = lerp(child.pixelPivotY, nextChild.pixelPivotY, lerpAmount);
				}
				
				if (!lastAngle2.exists(i))
				{
					lastAngle2[i] = 0.0;
				}
				
				if (child.angle != nextChild.angle) 
				//Rotate to closest direction (ignore 'dir' for now, it's unsupported in the current Spriter A4 build)
				{
					angle1 = child.angle;
					angle2 = nextChild.angle;
					rangeValue = angle2 - angle1;
					rangeValue = fixRotation(rangeValue);
					r = rangeValue * lerpAmount;
					//image.rotation = r * TO_RADS;
					
					lastAngle2[i] += rangeValue * lerpAmount;
				}
								
				setPivot(child.piece.name, pivotX, pivotY, r * TO_RADS);
				
				image = imagesByTimeline[Std.parseInt(timeline.id)];
				if (image == null) 
				{
					image = createImageByName(child.piece.name);
					imagesByTimeline[timelineId] = image;
				}
				
				//If this piece is set to be ignored, do not update any of it's position data
				if (ignoredPieces[image.name]) 
				{
					i++;
					continue;
				}
				
				if (child.x != nextChild.x) 
				{
					image.x = lerp(child.x - child.pixelPivotX, nextChild.x - nextChild.pixelPivotX, lerpAmount);
				}
				if (child.y != nextChild.y) 
				{
					image.y = lerp(-child.y - child.pixelPivotY, -nextChild.y - nextChild.pixelPivotY, lerpAmount);
				}
				if (child.scaleX != nextChild.scaleX) 
				{
					image.scaleX = lerp(child.scaleX, nextChild.scaleX, lerpAmount);
				}
				if (child.scaleY != nextChild.scaleY) 
				{
					image.scaleY = lerp(child.scaleY, nextChild.scaleY, lerpAmount);
				}
				if (child.alpha != nextChild.alpha) 
				{
					image.alpha = lerp(child.alpha, nextChild.alpha, lerpAmount);
				}
				
				if (child.angle != nextChild.angle)
				{
					var m:Matrix = image.transform.matrix.clone();
					var dx:Float = m.tx;
					var dy:Float = m.ty;
					m.translate(-dx, -dy);            //把位移归零
					//m.translate(-image.width/2, -image.height/2);              //宽高的一半，设置旋转点到中心点
					m.rotate(r * TO_RADS);             //旋转45度，这个跟a.rotation略有不同
					//m.translate(image.width/2, image.height/2);
					m.translate(dx, dy);       //恢复位移
					//image.transform.matrix = m;
				}
				
				i++;
			}
		}
	}

	function fixRotation(rotation : Float) : Float
	{
		if (rotation > 180) 
		{
			rotation -= 360;
		}

		else if (rotation < -180) 
		{
			rotation += 360;
		}
		return rotation;
	}

	private inline function optimizedRemoveChildren() : Void
	{
		clearChildren = true;
		if (childImages.length > 0) 
		{
			tmpNameHash = "";
			i = 0;
			l = childImages.length;
			while (i < l)
			{
				tmpNameHash += childImages[i].name + "|";
				i++;
			}
			if (tmpNameHash == nameHash && nameHash != "") 
			{
				clearChildren = false;
			}
			nameHash = tmpNameHash;
		}
		if (clearChildren) 
		//trace("Remove Children");
		{
			container.removeChildren();
		}
	}

	private inline function updateCallbacks() : Void
	{
		var i : Int = callbackList.length - 1;
		while (i >= 0)
		{
			if (callbackList[i].time <= position && callbackList[i].called != true) 
			{
				callbackList[i].call();
				if (callbackList[i].addOnce) 
				{
					callbackList.splice(i, 1);
				}
				else 
				{
					callbackList[i].called = true;
				}
			}
			i--;
		}
	}

	private inline function lerp(val1 : Float, val2 : Float, amount : Float) : Float
	{
		return val1 + (val2 - val1) * amount;
	}

	function createImageByName(name : String) : Dynamic
	{
		//Check if there's an existing swap for this image
		var swapName : String = name;
		//if (swapHash[name] != null) 
		//{
			//swapName = swapHash[name];
		//}
		//trace("[CreateImage] " + name);
		var texture : DisplayObject = getDisplay(swapName);
		//If we couldn't retrieve a swap, use the original as a fallback
		if (texture == null)
		{
			texture = getDisplay(name);
		}
		//If we still can't find a texture, this is an invalid piece name;
		if (texture == null) 
		{
			trace("[SpriterSprite] ERROR: Unable to find a texture for piece named: " + name + ". Make sure you've passed the correct folder prefix to your Animation Set (if you're using one)");
		}
		//var image : Image = new Image(texture);
		//image.smoothing = TextureSmoothing.NONE;
		//image.name = name;
		//if (!Math.isNaN(currentColor)) 
		//{
			//image.color = currentColor;
		//}
		
		//texture.transform.colorTransform = colorTransform;
		displaysByName[name] = texture;
		return texture;
	}

	public function setColor(value : Float) : Void
	{
		//for (name in Reflect.fields(imagesByName))
		//{
			//imagesByName[name].color = value;
		//}

		currentColor = value;
	}
	
	public function getDisplay(name : String) : DisplayObject
	{
		if ((animations.prefix != null) && name.indexOf(animations.prefix) == -1) 
		{
			name = animations.prefix + name;
		}
		if (displaysByName[name] == null) 
		{
			var texture :DisplayObject = textureAtlas.createTextureDisplay(name);
			if (texture == null) 
			{
				return null;
			}
			displaysByName[name] = texture;
		}
		return displaysByName[name];
	}

	//public function getTexture(name : String) : Texture
	//{
		//if (animations.prefix && name.indexOf(animations.prefix) == -1) 
		//{
			//name = animations.prefix + name;
		//}
		//if (!texturesByName[name]) 
		//{
			//这里其实就是获取某一个texture
			//var textures : Array<Texture> = textureAtlas.getTextures(name);
			//if (textures.length == 0) 
			//{
				//return null;
			//}
			//texturesByName[name] = textures[0];
		//}
		//return texturesByName[name];
	//}

	public function getImage(name : String) : DisplayObject
	{
		return imagesByName[name];
	}

	public function excludePiece(piece : DisplayObject, ignore : Bool = true) : Void
	{
		//if (Std.is(piece, String)) 
		//{
			//ignoredPieces[piece] = ignore;
		//}
//
		//else if (Std.is(piece, DisplayObject)) 
		{
			ignoredPieces[piece.name] = ignore;
		}
	}

	public function includePiece(piece : Dynamic) : Void
	{
		excludePiece(piece, false);
	}

	public function swapPiece(piece : String, newPiece : String) : Void
	{
		if ((animations.prefix != null) && piece.indexOf(animations.prefix) == -1) 
		{
			piece = animations.prefix + piece;
		}
		var newTex : DisplayObject = getDisplay(newPiece);
		if (newTex == null) 
		{
			newTex = getDisplay(newPiece);
		}
		//Check for preceding forward slash, newer versions of Spriter seem to add this.
		if (newTex == null) 
		{
			return;
		}
		//Can't swap if we can't find this textures
		//var image : Image;
		//for (o in Reflect.fields(imagesByTimeline))
		//{
			//image = Std.is(imagesByTimeline[o], Image);
			//if (image.name == piece) 
			//{
				//image.texture = newTex;
			//}
		//}
	}

	public function swapAll(segment1 : String, segment2 : String) : Void
	{
		var name : String;
		var i : Int = 0;
		var l : Int = animations.pieces.length;
		while (i < l)
		{
			name = animations.pieces[i].name;
			if (name.indexOf(segment1) != -1) 
			{
				var swap : String = StringTools.replace(name, segment1, segment2);
				swapPiece(name, swap);
			}
			i++;
		}
	}

	public function unswapPiece(piece : String) : Void
	{
		if (animations.prefix != null && piece.indexOf(animations.prefix) == -1) 
		{
			piece = animations.prefix + piece;
		}
		//var image : Image;
		//for (o in Reflect.fields(imagesByTimeline))
		//{
			//image = Std.is(imagesByTimeline[o], Image);
			//if (image.name == piece) 
			//{
				//image.texture = getTexture(piece);
			//}
		//}
	}

	public function unswapAll() : Void
	{
		//var image : Image;
		//for (o in Reflect.fields(imagesByTimeline))
		//{
			//image = Std.is(imagesByTimeline[o], Image);
			//image.texture = getTexture(animation.timelineList[o].keys[0].child.piece.name);
		//}
	}
	
	public function setPivot(name:String, ?pivotX:Float, ?pivotY:Float, ?rotation:Float = 0) : Void
	{
		var rect = textureAtlas.getRegion(name);
		
		textureAtlas.helpMatrix.a = textureAtlas.helpMatrix.d = Math.cos(rotation);
		textureAtlas.helpMatrix.c = -(textureAtlas.helpMatrix.b = Math.sin(rotation));
		
		if(Std.is(rect, SubTextureData)){
			var subTexData:SubTextureData = cast(rect, SubTextureData);
			
			subTexData.pivotX = pivotX;
			subTexData.pivotY = pivotY;
		}
	}
}

class Callback
{
	public var call : Dynamic;
	public var time : Int;
	public var addOnce : Bool;
	public var called : Bool;
	public function new(call : Dynamic, time : Int, addOnce : Bool = false)
	{
		this.call = call;
		this.time = time;
		this.addOnce = addOnce;
	}
}

