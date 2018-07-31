package common.spriterhx.spriter;

import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import flixel.util.loaders.CachedGraphics;
import flixel.util.loaders.TextureRegion;
import common.spriterhx.spriter.TilesheetData;
import flash.geom.Matrix;
import msignal.Signal;
import flash.display.BitmapData;
import common.spriterhx.spriter.core.Animation;
import common.spriterhx.spriter.core.Child;
import common.spriterhx.spriter.core.MainlineKey;
import common.spriterhx.spriter.core.Timeline;
import common.spriterhx.spriter.core.TimelineKey;
import msignal.Signal;
import common.spriterhx.textures.ITextureAtlas;
import common.spriterhx.textures.SubTextureData;
import flixel.FlxSprite;
import common.spriterhx.utils.ConstValues;
import flixel.FlxG;
import flixel.FlxObject;
import util.BitmapDataUtil;
import constants.PlayerConstants;
import util.FlxAngleExt;

/**
 * Flixel implementation of Spriter
 * @author Adrien Fischer [http://revolugame.com]
 */
class FlxSpriter extends FlxSprite
{
	public var spriterLoader:SpriterLoader;
	
	public var isPlaying(get, never) : Bool;

	static var TO_RADS : Float = Math.PI / 180;
	// Protected
	private var frameIndex : Int;
	private var nowFrame : MainlineKey;
	private var nextFrame : MainlineKey;
	private var imagesByTimeline : Map<Int, BitmapData>;
	private var displaysByName : Map<String, BitmapData>;
	private var _isPlaying : Bool;
	
	private var lastAngle:Map<Int, Float>;
	private var lastAngle2:Map<Int, Float>;
	private var lastFile:Map<Int, String>;
	// Public
	public var textureAtlas : ITextureAtlas;
	public var animations : AnimationSet;
	public var nowAnimation : Animation;
	public var position : Float;
	public var ignoredPieces : Map<String, Bool>;
	// tmp vars, to avoid memory allocation in the main loop. */
	var updateFrame : Bool;
	var timelineId : Int;
	//var textures : Array<DisplayObject>;
	var pieceName : String;
	var minX : Float;
	var minY : Float;
	var maxX : Float;
	var maxY : Float;
	var r : Float;
	var child : Child;
	var nextChild : Child;
	var image : BitmapData;
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
	
	public var currentName:String;
	
	public var drawSprite:Map<String, FlxSprite>;
	public var orderSprite:Array<FlxSprite>;
	
	// TODO: adjust collider's position
	public var collider:FlxObject;
	
	public var defaultFacing:Int;
	public var hasSize:Bool;
	public var moduleOffsetx:Float;
	public var moduleOffsety:Float;
	
	/**
	 * @param pData : XML file name
	 */
	public function new(?pX: Float = 0, ?pY: Float = 0, scale:Float = 1.0, 	ox:Float = 0.0, oy:Float = 0.0)
	{
		super(pX, pY);
		
		collider = new FlxObject(pX, pY);
		defaultFacing = FlxObject.RIGHT;//默认facing 朝向右边
		
		moduleOffsetx = ox * scale;
		moduleOffsety = oy * scale;
		
		//Use the SpriterLoader class to load individual SCML files, generate a TextureAtlas, and create AnimationSets, all at once.
		spriterLoader = new SpriterLoader();
		spriterLoader.assetsLoad("assets/sprite/test/first.scml", scale);
		
		frameIndex = 0;
		textureAtlas = spriterLoader.getTextureAtlas();
		animations = spriterLoader.getAnimationSet("assets/sprite/test/first.scml");
		imagesByTimeline = new Map<Int, BitmapData>();
		displaysByName = new Map<String, BitmapData>();
		ignoredPieces = new Map<String, Bool>();
		
		lastAngle = new Map<Int, Float>();
		lastAngle2 = new Map<Int, Float>();
		lastFile = new Map<Int, String>();
		drawSprite = new Map<String, FlxSprite>();
		orderSprite = new Array<FlxSprite>();
		
		hasSize = false;
	}
	
	/**
	 * Updates the animation.
	 */
	public override function update():Void 
	{	
		super.update();

		render(FlxG.elapsed * 1000);
		
		//width = maxX - x;// - x;
		//height = maxY - y;// - y;
	}
	
	public function play(name : String, startPosition : Float = 0.0) : Void
	{
		currentName = name;
		
		if (animations.getByName(name) == null) 
		//throw(new Error("[SpriterSprite] Unable to find animation name: " + name));
		{
			return;
		}
		nowAnimation = animations.getByName(name);
		position = startPosition;
		
		_isPlaying = true;
		frameIndex = -1;
		nowFrame = nextFrame = nowAnimation.mainline.keys[0];
		if (nowAnimation.mainline.keys.length > 1) 
		{
			nextFrame = nowAnimation.mainline.keys[1];
		}
		
		render(FlxG.elapsed * 1000, true);
	}
	
	/**
	 * Called by game loop, updates then blits or renders current frame of animation to the screen
	 */
	override public function draw():Void
	{
		for (sprite in orderSprite) 
		{
			sprite.antialiasing = antialiasing;
			sprite.visible = true;
			sprite.draw();
		}
	}
	
	override public function drawDebugOnCamera(Camera:FlxCamera = null):Void
	{
		super.drawDebugOnCamera(Camera);
		
		collider.drawDebugOnCamera(Camera);
		
		for (sprite in orderSprite) 
		{
			sprite.antialiasing = antialiasing;
			sprite.visible = true;
			sprite.drawDebugOnCamera(Camera);
		}
	}
	
	override public function destroy():Void
	{
		if (collider != null)
			collider.destroy();
		collider = null;
		
		drawSprite = null;
		orderSprite = null;
		
		super.destroy();
	}
	
	/**
	 * 替换骨骼动画中的某一块图片
	 * @param	componentName
	 * @param	regionName
	 */
	public function changeComponent(componentName:String, regionName:String):Void
	{
		var rect = textureAtlas.getRegion(regionName);
		var subTexData:SubTextureData = cast(rect, SubTextureData);
		
		var cachedGraphic:CachedGraphics = FlxG.bitmap.add(textureAtlas.bitmapData);
		var atlasRegion:TextureRegion = new TextureRegion(cachedGraphic, Math.round(subTexData.x), Math.round(subTexData.y));
		atlasRegion.region.tileWidth = atlasRegion.region.width = Std.int(subTexData.width);
		atlasRegion.region.tileHeight = atlasRegion.region.height = Std.int(subTexData.height);
		
		var wrapper:FlxSprite = new FlxSprite(0, 0, atlasRegion);
		wrapper.flipped = cachedGraphics.bitmap.width;
		drawSprite.set(componentName, wrapper);
	}
	
	public function render(elapsed:Float = 0, forceNextFrame:Bool = false, smooth:Bool = true) : Void
	{
		//orderSprite.splice(0, orderSprite.length);
		
		if (!_isPlaying) 
		{
			return;
		}
		
		// Exit if we're not currently playing
		position += elapsed * 1;
		minX = minY = ConstValues.INT_MAX_VALUE;
		startTime = nowFrame.time;
		endTime = (nextFrame != null) ? nextFrame.time : 0;
		if (endTime == 0 || endTime > nowAnimation.length) 
		{
			endTime = nowAnimation.length;
		}
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
			if (frameIndex == nowAnimation.mainline.keys.length - 2) 
			{
				advanceFrame = false;
			}
		}
		//Animation has completed, or Explicit override
		if (position > nowAnimation.length || forceNextFrame) 
		{
			advanceFrame = true;
		}
		
		if (advanceFrame) 
		//Advance playhead
		{
			if (frameIndex <= nowAnimation.mainline.keys.length - 2) 
			{
				if (frameIndex == -1) 
				{
					frameIndex = 0;
				}
				while(nowAnimation.mainline.keys[frameIndex].time < position)
				{
					frameIndex++;
					if (frameIndex > nowAnimation.mainline.keys.length - 2) 
					{
						frameIndex = nowAnimation.mainline.keys.length - 2;
						break;
					}
				}

				if (nowAnimation.mainline.keys[frameIndex].time > position) 
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
			if (position > nowAnimation.length) 
			{
				position = 0;
				//Reset all callbacks, TODO: Check if any callbacks on this final frame?
				if (nowAnimation.looping) 
				{
					frameIndex = 0;
				}
				else 
				{
					_isPlaying = false;
				}

				if (!_isPlaying) 
				{
					return;
				}
			}
			
			if (frameIndex > 0 || nowAnimation.looping) 
			{
				nowFrame = nowAnimation.mainline.keys[frameIndex];
				if (nowAnimation.mainline.keys.length > frameIndex + 1) 
				{
					nextFrame = nowAnimation.mainline.keys[frameIndex + 1];
				}
				startTime = nowFrame.time;
				endTime = (nextFrame != null) ? nextFrame.time : 0;
				if (endTime == 0) 
				{
					endTime = nowAnimation.length;
				}
			}
			
			//Optimization, check whether we need to remove any children?
			//optimizedRemoveChildren();
			//Measure this animation
			
			untyped orderSprite.length = 0;
			maxX = 0;
			maxY = 0;
			for (ref in nowFrame.refs)
			{
				timelineId = ref.timeline;
				if (nowAnimation.timelineList[timelineId].keys.length == 0) 
				{
					continue;
				}
				
				child = nowAnimation.timelineList[timelineId].keys[ref.key].child;
				
				if (child.piece == null) 
				{
					continue;
				}
				
				var wrapper:FlxSprite = null;
				
				if (drawSprite.get(child.piece.name) == null)
				{
					var rect = textureAtlas.getRegion(child.piece.name);
					var subTexData:SubTextureData = cast(rect, SubTextureData);
					
					var cachedGraphic:CachedGraphics = FlxG.bitmap.add(textureAtlas.bitmapData);
					var atlasRegion:TextureRegion = new TextureRegion(cachedGraphic, Math.round(subTexData.x), Math.round(subTexData.y));
					atlasRegion.region.tileWidth = atlasRegion.region.width = Std.int(subTexData.width);
					atlasRegion.region.tileHeight = atlasRegion.region.height = Std.int(subTexData.height);
					//if (region.rotate) 
					//{
						//atlasRegion.region.tileWidth = atlasRegion.region.width = region.getRegionHeight();
						//atlasRegion.region.tileHeight = atlasRegion.region.height = region.getRegionWidth();
					//}
					//else 
					//{
						//atlasRegion.region.tileWidth = atlasRegion.region.width = region.getRegionWidth();
						//atlasRegion.region.tileHeight = atlasRegion.region.height = region.getRegionHeight();
					//}
					
					wrapper = new FlxSprite(0, 0, atlasRegion);
					wrapper.flipped = cachedGraphics.bitmap.width;
					drawSprite.set(child.piece.name, wrapper);
				}
				else
				{
					wrapper = drawSprite.get(child.piece.name);
				}
				
				wrapper.facing = facing;
				
				//if (ref.parent != -1)
				//{
					//child.x += nowAnimation.timelineList[nowFrame.bonerefs[ref.parent].timeline].keys[nowFrame.bonerefs[ref.parent].key].child.x;
					//child.y += nowAnimation.timelineList[nowFrame.bonerefs[ref.parent].timeline].keys[nowFrame.bonerefs[ref.parent].key].child.y;
					//child.angle += nowAnimation.timelineList[nowFrame.bonerefs[ref.parent].timeline].keys[nowFrame.bonerefs[ref.parent].key].child.angle;
				//}
					
				handleAngle(wrapper, child.angle, child.piece.name);
				
				wrapper.origin.x = (defaultFacing == facing) ? child.pixelPivotX : wrapper.width - child.pixelPivotX; // Registration point.
				wrapper.origin.y = child.pixelPivotY;
				
				//wrapper.offset.x = (defaultFacing == facing) ? 0 : 2*(wrapper.width/2 - child.pixelPivotX);
				//wrapper.offset.y = child.pixelPivotY;
								
				//wrapper.scale.x = child.scaleX * ((defaultFacing == facing) ? 1 : -1);
				//wrapper.scale.y = child.scaleY;
				
				wrapper.x = (defaultFacing == facing) ? x + child.x - child.pixelPivotX - moduleOffsetx: x + width - child.x + child.pixelPivotX - wrapper.width + moduleOffsetx;
				wrapper.y = y - child.y - child.pixelPivotY - moduleOffsety;
				
				orderSprite.push(wrapper);
				
				if (hasSize == false)
				{
					if (x + child.x - child.pixelPivotX > maxX) 
					{
						maxX = x + child.x - child.pixelPivotX;
						width = maxX - x;
					}
					if (y - child.y - child.pixelPivotY > maxY) 
					{
						maxY = y - child.y - child.pixelPivotY;
						height = maxY - y;
					}
				}
			}
			
			hasSize = true;
		}
		//Small, Incremental interpolated update
		if (true && position < endTime) 
		{
			spinDir = 0;
			
			untyped orderSprite.length = 0;
			for (ref in nowFrame.refs)
			{
				//Get the most recent previous timeline for reference
				timeline = nowAnimation.timelineList[ref.timeline];
				if (timeline.keys.length == 0) 
				{
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
					lerpEnd = nowAnimation.length;
				}
				//Determine interpolation amount
				lerpAmount = (position - lerpStart) / (lerpEnd - lerpStart);
				
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
				
				if (child.angle != nextChild.angle) 
				//Rotate to closest direction (ignore 'dir' for now, it's unsupported in the current Spriter A4 build)
				{
					angle1 = child.angle;
					angle2 = nextChild.angle;
					rangeValue = angle2 - angle1;
					rangeValue = fixRotation(rangeValue);
					r = angle1 + rangeValue * lerpAmount;				
				}
				
				var wrapper:FlxSprite = null;
				
				if (drawSprite.get(child.piece.name) == null)
				{
					var rect = textureAtlas.getRegion(child.piece.name);
					var subTexData:SubTextureData = cast(rect, SubTextureData);
					
					var cachedGraphic:CachedGraphics = FlxG.bitmap.add(textureAtlas.bitmapData);
					var atlasRegion:TextureRegion = new TextureRegion(cachedGraphic, Math.round(subTexData.x), Math.round(subTexData.y));
					atlasRegion.region.tileWidth = atlasRegion.region.width = Std.int(subTexData.width);
					atlasRegion.region.tileHeight = atlasRegion.region.height = Std.int(subTexData.height);
					
					wrapper = new FlxSprite(0, 0, atlasRegion);
					wrapper.flipped = cachedGraphics.bitmap.width;
					drawSprite.set(child.piece.name, wrapper);
				}
				else
				{
					wrapper = drawSprite.get(child.piece.name);
				}
				
				if (child.angle != nextChild.angle)
				{
					wrapper.angle = (fixRotation(r) * ((defaultFacing == facing) ? 1 : -1));
				}
				
				wrapper.facing = facing;
				
				//wrapper.origin.x = child.pixelPivotX; // Registration point.
				//wrapper.origin.y = child.pixelPivotY;
				
				wrapper.origin.x = (defaultFacing == facing) ? lerp(child.pixelPivotX, nextChild.pixelPivotX, lerpAmount) : lerp(wrapper.width - child.pixelPivotX, wrapper.width - nextChild.pixelPivotX, lerpAmount); // Registration point.
				wrapper.origin.y = lerp(child.pixelPivotY, nextChild.pixelPivotY, lerpAmount);
				
				//wrapper.offset.x = (defaultFacing == facing) ? 0 : lerp(2*(wrapper.width/2 - nextChild.pixelPivotX), 2*(wrapper.width/2 - nextChild.pixelPivotX), lerpAmount);
				//wrapper.offset.y = child.pixelPivotY;
				
				//wrapper.scale.x = child.scaleX * ((defaultFacing == facing) ? 1 : -1);
				//wrapper.scale.y = child.scaleY;
				
				wrapper.x = (defaultFacing == facing) ? lerp(x + child.x - child.pixelPivotX - moduleOffsetx, x + nextChild.x - nextChild.pixelPivotX - moduleOffsetx, lerpAmount) : lerp(x + width - child.x + child.pixelPivotX - wrapper.width + moduleOffsetx, x + width - nextChild.x + nextChild.pixelPivotX - wrapper.width + moduleOffsetx, lerpAmount);
				wrapper.y = y + lerp(-child.y - child.pixelPivotY - moduleOffsety, -nextChild.y - nextChild.pixelPivotY - moduleOffsety, lerpAmount);
				
				orderSprite.push(wrapper);
			}
		}
	}
	
	public function handleAngle(wrapper:FlxSprite, angle:Float, name:String):Void
	{
		wrapper.angle = (fixRotation(angle) * ((defaultFacing == facing) ? 1 : -1));
	}
	
	public function fixRotation(rotation : Float) : Float
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

	public function optimizedRemoveChildren() : Void
	{
		clearChildren = true;
		if (drawSprite != null) 
		{
			tmpNameHash = "";
			for (name in drawSprite.keys())
			{
				tmpNameHash += name + "|";
			}
			if (tmpNameHash == nameHash && nameHash != "") 
			{
				clearChildren = false;
			}
			nameHash = tmpNameHash;
		}
		
		if(clearChildren){ 
			drawSprite = new Map<String, FlxSprite>();
		}
	}
	
	private inline function lerp(val1 : Float, val2 : Float, amount : Float) : Float
	{
		return val1 + (val2 - val1) * amount;
	}
	
	public function get_isPlaying() : Bool
	{
		return _isPlaying;
	}
	
	public function setBoneAngle(name:String, angle:Float)
	{
		var parent:Array<Int> = [];
		var parentTimelineId:Int = 0;
		var parentKey:Int = 0;
		for (ref in nowFrame.bonerefs)
		{
			if (nowAnimation.timelineList[ref.timeline].name == name)
			{
				parent.push(ref.id);
				angle = angle - nowAnimation.timelineList[ref.timeline].keys[ref.key].child.angle;
				nowAnimation.timelineList[ref.timeline].keys[ref.key].child.angle += angle;
				parentTimelineId = ref.timeline;
				parentKey = ref.key;
			}
			else if (Lambda.has(parent, ref.parent))
			{
				parent.push(ref.id);
				setTimeLineAngle(ref.timeline, ref.key, parentTimelineId, parentKey, angle);
			}
		}
		
		for (ref in nowFrame.refs)
		{
			if (Lambda.has(parent, ref.parent))
			{
				setTimeLineAngle(ref.timeline, ref.key, parentTimelineId, parentKey, angle);
			}
		}
	}
	
	public function setTimeLineAngle(timelineId:Int, key:Int, parentTimelineId:Int, parentKey:Int, angle:Float)
	{
		var point:FlxPoint = FlxAngleExt.rotateSimple(
			nowAnimation.timelineList[timelineId].keys[key].child.x, 
			nowAnimation.timelineList[timelineId].keys[key].child.y,
			nowAnimation.timelineList[parentTimelineId].keys[parentKey].child.x,
			nowAnimation.timelineList[parentTimelineId].keys[parentKey].child.y,
			angle
		);
		
		nowAnimation.timelineList[timelineId].keys[key].child.x = point.x;
		nowAnimation.timelineList[timelineId].keys[key].child.y = point.y;
		
		nowAnimation.timelineList[timelineId].keys[key].child.angle += angle;
	}
}
