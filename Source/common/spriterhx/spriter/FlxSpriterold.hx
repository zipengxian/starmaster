package common.spriterhx.spriter;

import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxCamera;
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

#if flash
import flash.geom.Matrix;
#elseif (cpp || neko)
import nme.display.Tilesheet;
#end

/**
 * Flixel implementation of Spriter
 * @author Adrien Fischer [http://revolugame.com]
 */
class FlxSpriterold extends FlxSprite
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
	private var childImages : Array<BitmapData>;
	private var _isPlaying : Bool;
	
	private var lastAngle:Map<Int, Float>;
	private var lastAngle2:Map<Int, Float>;
	private var lastFile:Map<Int, String>;
	// Public
	public var textureAtlas : ITextureAtlas;
	public var animations : AnimationSet;
	public var nowAnimation : Animation;
	public var position : Float;
	public var animationWidth : Float;
	public var animationHeight : Float;
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
	
	#if flash
	public var buffer:BitmapData;
	#elseif(cpp || neko)
	public var buffer:Array<TilesheetData>;
	#end
	
	public var currentName:String;
	
	/**
	 * @param pData : XML file name
	 */
	public function new(?pX: Float = 0, ?pY: Float = 0, scale:Float = 1.0)
	{
		super(pX, pY);
		
		//Use the SpriterLoader class to load individual SCML files, generate a TextureAtlas, and create AnimationSets, all at once.
		spriterLoader = new SpriterLoader();
		spriterLoader.assetsLoad("assets/sprite/brawler/brawler.scml", scale);
		
		frameIndex = 0;
		textureAtlas = spriterLoader.getTextureAtlas();
		animations = spriterLoader.getAnimationSet("assets/sprite/brawler/brawler.scml");
		imagesByTimeline = new Map<Int, BitmapData>();
		displaysByName = new Map<String, BitmapData>();
		ignoredPieces = new Map<String, Bool>();
		childImages = new Array<BitmapData>();
		
		lastAngle = new Map<Int, Float>();
		lastAngle2 = new Map<Int, Float>();
		lastFile = new Map<Int, String>();
		
		maxX = 0;
		maxY = 0;
	}
	
	/**
	 * Updates the animation.
	 */
	public override function update():Void 
	{	
		super.update();

		render(FlxG.elapsed * 1000);
		
		width = maxX;// - x;
		height = maxY;// - y;
	}
	
	public function play(name : String, startPosition : Int = 0) : Void
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
		
		animationWidth = animationHeight = 150;
	}
	
	/**
	 * Called by game loop, renders current frame of animation to the screen.
	 */
	override public function draw():Void 
	{		
		if(cameras == null)
			cameras = FlxG.cameras.list;
		
		var camera:FlxCamera;
		var i : Int = 0;
		var l : Int = cameras.length;
		
		while(i < l)
		{
			camera = cameras[i++];
			
			if(!onScreen(camera))
				continue;
				
			_point.x = x - Math.floor(camera.scroll.x * scrollFactor.x);
			_point.y = y - Math.floor(camera.scroll.y * scrollFactor.y);
			
			#if flash
			_point.x += (_point.x > 0) ? 0.0000001 : -0.0000001;
			_point.y += (_point.y > 0) ? 0.0000001 : -0.0000001;
			
			_flashPoint.x = _point.x;
			_flashPoint.y = _point.y;
			if (facing == FlxObject.RIGHT)
			{
				buffer = BitmapDataUtil.flipHorizontal(buffer);
			}
			
			camera.buffer.copyPixels(buffer, buffer.rect, _flashPoint, null, null, true);
			
			#elseif (cpp || neko)
			for(bufferData in buffer)
			{
				var newData : Array<Float> = bufferData.data.copy();
				newData[0] += Math.floor(_point.x) + origin.x;
				newData[1] += Math.floor(_point.y) + origin.y;

				camera._canvas.graphics.drawTiles(bufferData.tilesheet, newData, true, bufferData.flags);
			}
			#end
		}
	}
	
	public function render(elapsed:Float = 0, forceNextFrame:Bool = false, smooth:Bool = true) : Void
	{
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
			#if flash
			buffer = new BitmapData(Std.int(width), Std.int(height), true, 0);
			#elseif (cpp || neko)
			buffer = new Array();
			#end
			
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
			optimizedRemoveChildren();
			untyped childImages.length = 0;
			//Measure this animation
			i = 0;
			l = nowFrame.refs.length;
			while (i < l)
			{
				timelineId = nowFrame.refs[i].timeline;
				if (nowAnimation.timelineList[timelineId].keys.length == 0) 
				{
					i++;
					continue;
				}
				child = nowAnimation.timelineList[timelineId].keys[nowFrame.refs[i].key].child;
				if (child.piece == null) 
				{
					i++;
					continue;
				}
				
				if (!lastFile.exists(i))
				{
					lastFile[i] = child.piece.name;
				}
				
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
				
				renderToBuffer(child, image, smooth);
				
				i++;
			}
		}
		//Small, Incremental interpolated update
		if (position < endTime) 
		{
			#if flash
			buffer = new BitmapData(Std.int(width), Std.int(height), true, 0);
			#elseif (cpp || neko)
			buffer = new Array();
			#end
			
			spinDir = 0;
			i = 0;
			l = nowFrame.refs.length;
			while (i < l)
			{
				//Get the most recent previous timeline for reference
				timeline = nowAnimation.timelineList[nowFrame.refs[i].timeline];
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
					r = angle1 + rangeValue * lerpAmount;				
				}
								
				setPivot(child.piece.name, pivotX, pivotY, r * TO_RADS);
				
				image = imagesByTimeline[Std.parseInt(timeline.id)];
				if (image == null) 
				{
					image = createImageByName(child.piece.name);
					imagesByTimeline[timelineId] = image;
				}
				
				#if flash
					var matrix : Matrix = new Matrix();
					var point: Point = new Point();
					
					if (child.alpha != 1 || child.angle != 0 || child.scaleX != 1 || child.scaleY != 1)
					{
						if (!lastAngle.exists(i))
						{
							lastAngle[i] = 0.0;
						}
						if (!lastAngle2.exists(i))
						{
							lastAngle2[i] = 0.0;
						}
						
						matrix.identity();
						matrix.b = matrix.c = 0;
						matrix.a = child.scaleX;
						matrix.d = child.scaleY;
						
						if (child.scaleX != nextChild.scaleX) 
						{
							matrix.a = lerp(child.scaleX, nextChild.scaleX, lerpAmount);
						}
						if (child.scaleY != nextChild.scaleY) 
						{
							matrix.d = lerp(child.scaleY, nextChild.scaleY, lerpAmount);
						}
						
						//if (child.alpha != nextChild.alpha) 
						//{
							//image.alpha = lerp(child.alpha, nextChild.alpha, lerpAmount);
						//}
						
						matrix.tx = child.x - child.pixelPivotX - _origin.x;
						matrix.ty = -child.y - child.pixelPivotY - _origin.y;
						if (child.x != nextChild.x) 
						{
							matrix.tx = lerp(child.x - _origin.x - child.pixelPivotX, nextChild.x - _origin.x - nextChild.pixelPivotX, lerpAmount);
						}
						if (child.y != nextChild.y) 
						{
							matrix.ty = lerp(-child.y - _origin.y - child.pixelPivotY, -nextChild.y - _origin.y - nextChild.pixelPivotY, lerpAmount);
						}
						
						lastAngle2[i] = 0.0;
						lastAngle[i] = child.angle;
						
						//image.draw(image, matrix, null, null, null, smooth);
						image.copyPixels(image, image.rect, new Point(child.x - child.pixelPivotX - _origin.x, -child.y - child.pixelPivotY - _origin.y));
						
						var dx:Float = matrix.tx + child.pixelPivotX;
						var dy:Float = matrix.ty + child.pixelPivotY;

						matrix.translate(-dx, -dy);            //把位移归零

						if (child.angle != nextChild.angle)
						{
							matrix.rotate(r * TO_RADS); // much faster than Math.PI / 180
						}
						else
						{
							if (child.angle != 0) 
								matrix.rotate(child.angle * TO_RADS);
						}
						
						matrix.translate(dx, dy);            //把位移归零
						
						buffer.draw(image, matrix, null, null, null, smooth);				
					}
					else
					{
						point.x = child.x - _origin.x - child.pixelPivotX;
						if (point.x < minX) 
						{
							minX = point.x;
						}
						point.y = -child.y - _origin.y - child.pixelPivotY;
						if (point.y < minY) 
						{
							minY = point.y;
						}
						
						if (child.x != nextChild.x) 
						{
							point.x = lerp(child.x - _origin.x - child.pixelPivotX, nextChild.x - _origin.x - nextChild.pixelPivotX, lerpAmount);
							if (point.x < minX) 
							{
								minX = point.x;
							}
						}
						if (child.y != nextChild.y) 
						{
							point.y = lerp(-child.y - _origin.y - child.pixelPivotY, -nextChild.y - _origin.y - nextChild.pixelPivotY, lerpAmount);
							if (point.y < minY) 
							{
								minY = point.y;
							}
						}

						buffer.copyPixels(image, image.rect, point, null, null, true);
					}
				#elseif (cpp || neko)		
					var tilesheetData : TilesheetData;
					var tilesheet : Tilesheet;
					var flags : Int = 0; //Tilesheet.TILE_SCALE | Tilesheet.TILE_ROTATION | Tilesheet.RGB | Tilesheet.TILE_ALPHA;
					var data : Array<Float>;
					
					tilesheet = new Tilesheet(image);
					tilesheet.addTileRect(new Rectangle(0,0,image.width,image.height));
					
					data = new Array();
					data[0] = child.x + x - _origin.x;
					data[1] = child.y + y - _origin.y;
					data[2] = 0;
					
					if (child.x != nextChild.x) 
					{
						data[0] = lerp(child.x, nextChild.x, lerpAmount);
					}
					if (child.y != nextChild.y) 
					{
						data[1] = lerp(-child.y, -nextChild.y, lerpAmount);
					}
					
					// Tilesheet.TILE_SCALE | Tilesheet.TILE_ROTATION | Tilesheet.TILE_RGB | Tilesheet.TILE_ALPHA
					var scaleXtmp:Float = child.scaleX;
					var scaleYtmp:Float = child.scaleY;

					if (child.scaleX != nextChild.scaleX) 
					{
						scaleXtmp = lerp(child.scaleX, nextChild.scaleX, lerpAmount);
					}
					if (child.scaleY != nextChild.scaleY) 
					{
						scaleYtmp = lerp(child.scaleY, nextChild.scaleY, lerpAmount);
					}
					
					if( (child.scaleX != nextChild.scaleX && nextChild.scaleX != 1) || (child.scaleY != nextChild.scaleY && nextChild.scaleY != 1) )
					{
						flags |= Tilesheet.TILE_SCALE;
						data.push( Math.min(child.scaleX, child.scaleY) );
					}
					
					if (child.angle != nextChild.angle)
					{
						if( child.angle != 0 )
						{
							flags |= Tilesheet.TILE_ROTATION;
							data.push(r * 0.017453292519943295);
						}
					}
					else
					{
						if( child.angle != 0 )
						{
							flags |= Tilesheet.TILE_ROTATION;
							data.push(child.angle * 0.017453292519943295);
						}
					}
					
					tilesheetData = new TilesheetData(tilesheet, flags, data);
					buffer.push(tilesheetData);
				#end
				
				i++;
			}
		}
	}
	
	public function renderToBuffer(child: Child, image: BitmapData, smooth:Bool): Void
	{
		#if flash
			var matrix : Matrix = new Matrix();
			var point: Point = new Point();
			
			if (child.alpha != 1 || child.angle != 0 || child.scaleX != 1 || child.scaleY != 1)
			{
				matrix.identity();
				matrix.b = matrix.c = 0;
				matrix.a = child.scaleX;
				matrix.d = child.scaleY;
							
				//var dx:Float = x + child.x - _origin.x - child.pixelPivotX * 2;
				//var dy:Float = y - child.y - _origin.y - child.pixelPivotY * 2;
				//if (child.angle != 0) 
				//{
					//matrix.translate(-dx, -dy);            //把位移归零
					//matrix.rotate((fixRotation(child.angle)) * TO_RADS); // much faster than Math.PI / 180
					//matrix.translate(dx, dy);            //把位移归零
				//}
				
				matrix.tx = child.x - _origin.x - child.pixelPivotX;
				matrix.ty = - child.y - _origin.y - child.pixelPivotY;
				if (matrix.tx < minX) 
				{
					minX = matrix.tx;
				}
				if (matrix.ty < minY) 
				{
					minY = matrix.ty;
				}
				
				if (matrix.tx + image.width > maxX) 
				{
					maxX = matrix.tx + image.width;
				}
				if (matrix.ty + image.height > maxY) 
				{
					maxY = matrix.ty + image.height;
				}
				
				//image.draw(image, matrix, null, null, null, smooth);
				image.copyPixels(image, image.rect, new Point(child.x - _origin.x - child.pixelPivotX, - child.y - _origin.y - child.pixelPivotY));
				
				var dx:Float = matrix.tx + child.pixelPivotX;
				var dy:Float = matrix.ty + child.pixelPivotY;
				if (child.angle != 0) 
				{
					matrix.translate(-dx, -dy);            //把位移归零
					matrix.rotate((fixRotation(child.angle)) * TO_RADS); // much faster than Math.PI / 180
					matrix.translate(dx, dy);            //把位移归零
				}
				
				buffer.draw(image, matrix, null, null, null, smooth);
				
				var i = 1;
			}
			else
			{
				point.x = child.x - _origin.x - child.pixelPivotX;
				if (point.x < minX) 
				{
					minX = point.x;
				}
				if (point.x + image.width > maxX) 
				{
					maxX = point.x + image.width;
				}
				point.y = -child.y - _origin.y - child.pixelPivotY;
				if (point.y < minY) 
				{
					minY = point.y;
				}
				if (point.y + image.height > maxY) 
				{
					maxY = point.y + image.height;
				}

				buffer.copyPixels(image, image.rect, point, null, null, true);
			}
		#elseif (cpp || neko)		
			var tilesheetData : TilesheetData;
			var tilesheet : Tilesheet;
			var flags : Int = 0; //Tilesheet.TILE_SCALE | Tilesheet.TILE_ROTATION | Tilesheet.RGB | Tilesheet.TILE_ALPHA;
			var data : Array<Float>;
			
			tilesheet = new Tilesheet(image);
			tilesheet.addTileRect(new Rectangle(0,0,image.width,image.height));
			
			data = new Array();
			data[0] = child.x + x - _origin.x;
			data[1] = child.y + y - _origin.y;
			data[2] = 0;
			
			// Tilesheet.TILE_SCALE | Tilesheet.TILE_ROTATION | Tilesheet.TILE_RGB | Tilesheet.TILE_ALPHA
			if( child.scaleX != 1 || child.scaleY != 1 )
			{
				flags |= Tilesheet.TILE_SCALE;
				data.push( Math.min(child.scaleX, child.scaleY) );
			}
				
			if( child.angle != 0 )
			{
				flags |= Tilesheet.TILE_ROTATION;
				data.push(child.angle * 0.017453292519943295);
			}
				
			//if( child.color != 0xFFFFFF )
			//{
				//flags |= Tilesheet.TILE_RGB;
				//data.push(red);
				//data.push(green);
				//data.push(blue);
			//}
			
			//if( child.opacity != 1 )
			//{
				//flags |= Tilesheet.TILE_ALPHA;
				//data.push( sprite.opacity );
			//}
			
			tilesheetData = new TilesheetData(tilesheet, flags, data);
			buffer.push(tilesheetData);
		#end
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
		//clearChildren = true;
		//if (childImages.length > 0) 
		//{
			//tmpNameHash = "";
			//i = 0;
			//l = childImages.length;
			//while (i < l)
			//{
				//tmpNameHash += childImages[i].name + "|";
				//i++;
			//}
			//if (tmpNameHash == nameHash && nameHash != "") 
			//{
				//clearChildren = false;
			//}
			//nameHash = tmpNameHash;
		//}
	}
	
		private inline function lerp(val1 : Float, val2 : Float, amount : Float) : Float
	{
		return val1 + (val2 - val1) * amount;
	}
	
	public function createImageByName(name : String) : Dynamic
	{
		//Check if there's an existing swap for this image
		var swapName : String = name;
		//if (swapHash[name] != null) 
		//{
			//swapName = swapHash[name];
		//}
		//trace("[CreateImage] " + name);
		var texture : BitmapData = getDisplay(swapName);
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

	public function getDisplay(name : String) : BitmapData
	{
		if ((animations.prefix != null) && name.indexOf(animations.prefix) == -1) 
		{
			name = animations.prefix + name;
		}
		if (displaysByName[name] == null) 
		{
			var texture :BitmapData = textureAtlas.createBitmapData(name);
			
			if (texture == null) 
			{
				return null;
			}
			displaysByName[name] = texture;
		}
		return displaysByName[name];
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
	
	public function get_isPlaying() : Bool
	{
		return _isPlaying;
	}
	
	//#if (cpp || neko)
	//public override function setAntialiasing(value:Bool):Bool
	//#else
	//public function setAntialiasing(value:Bool):Void 
	//#end
	//{
		//antialiasing = value;
		//_propertiesChanged = true;
		//#if (cpp || neko)
		//return super.setAntialiasing(value);
		//#end
	//}
}
