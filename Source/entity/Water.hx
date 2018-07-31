package entity;

import flash.display.BitmapData;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import openfl.display.Tilesheet;
/**
 * ...
 * @author grigri
 */
class Water extends FlxObject
{
	/* Variables */
	public var cells:Array<Array<Int>>;//contains the data.
	public var old_mass:Array<Array<Float>>;//to calculate step.
	private var new_mass:Array<Array<Float>>;// / to calculate step.
	
	private var waterMask:FlxTilemap;
	
	private var mapWidth:Int = 0;
	private var mapHeight:Int = 0;
	
	/* Constants */
	public static inline var MAX_MASS:Float = 1.0;
	public static inline var COMPRESSION:Float = 0.02;//how much extra water pressure in can be stored in the cell below.
	public static inline var MIN_MASS:Float = 0.0001;//ignore very dry cells.

	public static inline var MIN_FLOW:Float = 0.01;
	public static inline var MAX_MOVEMENT:Float = 1;//Max units of water moved between two cells per turn.
	
	private var tilesBmp:BitmapData;
	private var srcRect:Rectangle;
	private var dstPoint:Point;
	/*
	private var s:Sprite;
	private var g:Graphics;
	private var m:Matrix;
	*/
	
	public function new(grid:FlxTilemap, width:Int, height:Int) 
	{
		super();
		cells = new Array<Array<Int>>();//contains the data.
		old_mass = new Array<Array<Float>>();//to calculate step.
		new_mass = new Array<Array<Float>>();// / to calculate step.
		srcRect = new Rectangle(0, 0, 16, 16);
		dstPoint = new Point();
		
		waterMask = new FlxTilemap();
		mapWidth = width >> 4;
		mapHeight = height >> 4;
		
		//m = new Matrix;
		//s = new Sprite;
		//g = s.graphics;
		
		//type = "water";

		for(w in 0...mapWidth) 
		{
			cells[w] = new Array<Int>();
			old_mass[w] = new Array<Float>();
			new_mass[w] = new Array<Float>();
			
			for(h in 0...mapHeight)
			{
				cells[w][h] = 0;
				old_mass[w][h] = 0;
				new_mass[w][h] = 0;
			}
		}
		
		var i:Int = 0;
		var j:Int = 0;
		//read grid
		while(i < mapWidth)
		{
			j = 0;
			
			while(j < mapHeight)
			{
				if(grid.getTile(i >> 1, j >> 1) > 0)
				{
					cells[i][j] = 1;
					cells[i + 1][j] = 1;
					cells[i][j + 1] = 1;
					cells[i + 1][j + 1] = 1;
				}
				
				j += 2;
			}
			
			i += 2;
		}
		
		//layer = Layer.WATER;
		tilesBmp = new BitmapData(16 * 16, 16 * 2, true, 0);
		var alpha:Float;
		for (w in 0...16) {
			alpha = w / 15.0;
			if (alpha > 0.6) alpha = 0.6;
			rect(tilesBmp, w * 16, 16 - w - 1, 16, w + 1, 0x5980FF, alpha);
			rect(tilesBmp, w * 16, 16, 16, 16, 0x5980FF, alpha);
		}
		
		//waterMask.loadMap(Assets.getText("assets/tiled/waterTest.txt"), tilesBmp, 32, 32, 0, 1);
	}
	
	/**
	 * Draws a filled rectangle.
	 * @param	x			X position of the rectangle.
	 * @param	y			Y position of the rectangle.
	 * @param	width		Width of the rectangle.
	 * @param	height		Height of the rectangle.
	 * @param	color		Color of the rectangle.
	 * @param	alpha		Alpha of the rectangle.
	 */
	public function rect(_target:BitmapData, x:Float, y:Float, width:Float, height:Float, color:Int = 0xFFFFFF, alpha:Float = 1):Void
	{
		var _rect = new Rectangle();
		color = (Std.int(alpha * 0xFF) << 24) | (color & 0xFFFFFF);
		_rect.x = x - 0;
		_rect.y = y - 0;
		_rect.width = width;
		_rect.height = height;
		_target.fillRect(_rect, color);
	}
	
	/*
	override public function added():Void {
		super.added();
		world.addGraphic(new Stamp(tilesBmp), 0, 0, 100);
	}
	*/
	
	override public function update():Void
	{
		super.update();
		
		var flow:Float = 0;
		var remaining_mass:Float;
		//var w:Int, h:Int;
		var x:Int = mapWidth - 1;
		var y:Int = mapHeight - 1;
		var nMass:Float = 0;
		
		while(x > 0)
		{
			y = mapHeight - 1;
			
			while(y > 0)
			{
				if (cells[x][y] == 1) { y--; continue; }//Skip ground blocks.
				
				flow = 0;
				remaining_mass = old_mass[x][y];
				
				if(remaining_mass <= 0) { y--; continue; };
				
				//check flow beneath.
				if(y < mapHeight - 1 && cells[x][y+1] != 1)
				{
					nMass = old_mass[x][y + 1];
					//if (nMass < old_mass[x][y]) {
						flow = distributeWater(remaining_mass + nMass) - nMass;
						if(flow > MIN_FLOW)
						{
							flow *= 0.5;//smoothens water flow.
						}
						if (flow < 0) flow = 0;
						if (flow > MAX_MOVEMENT) flow = MAX_MOVEMENT;
						if (flow > remaining_mass) flow = remaining_mass;
						//flow = constrainRange(flow, 0, remaining_mass);
						
						new_mass[x][y] -= flow;
						new_mass[x][y + 1] += flow;
						remaining_mass -= flow;
					//}
				}
				
				if(remaining_mass <= 0) { y--; continue; };
				
				//Check to the left.
				if(x > 0 && cells[x-1][y] != 1)
				{
					//if (old_mass[x - 1][y] < old_mass[x][y]) {
						flow = (old_mass[x][y] - old_mass[x - 1][y]) * 0.25;
						if(flow > MIN_FLOW)
						{
							flow *= 0.5;
						}
						if (flow < 0) flow = 0;
						//if (flow > MAX_MOVEMENT) flow = MAX_MOVEMENT;
						if (flow > remaining_mass) flow = remaining_mass;
						//flow = constrainRange(flow, 0, remaining_mass);
						
						new_mass[x][y] -= flow;
						new_mass[x - 1][y] += flow;
						remaining_mass -= flow;
					//}
				}
				
				if(remaining_mass <= 0) { y--; continue; };
				
				//check to the right.
				if(x < mapWidth - 1 && cells[x+1][y] != 1)
				{
					//if (old_mass[x + 1][y] < old_mass[x][y]) {
						flow = (old_mass[x][y] - old_mass[x + 1][y]) * 0.25;
						if(flow > MIN_FLOW)
						{
							flow *= 0.5;
						}
						if (flow < 0) flow = 0;
						//if (flow > MAX_MOVEMENT) flow = MAX_MOVEMENT;
						if (flow > remaining_mass) flow = remaining_mass;
						//flow = constrainRange(flow, 0, remaining_mass);
						
						new_mass[x][y] -= flow;
						new_mass[x + 1][y] += flow;
						remaining_mass -= flow;
					//}
				}
				
				if(remaining_mass <= 0) { y--; continue; };
				
				//Up. Only compressed water should flows upwards.
				if(y > 0 && cells[x][y-1] != 1)
				{
					//if (old_mass[x][y-1] < remaining_mass) {
						flow = remaining_mass - distributeWater(remaining_mass + old_mass[x][y - 1]);
						if(flow > MIN_FLOW)
						{
							flow *= 0.5;
						}
						if (flow < 0) flow = 0;
						if (flow > MAX_MOVEMENT) flow = MAX_MOVEMENT;
						if (flow > remaining_mass) flow = remaining_mass;
						//flow = constrainRange(flow, 0, (MAX_MOVEMENT < remaining_mass) ? MAX_MOVEMENT : remaining_mass);
						
						new_mass[x][y] -= flow;
						new_mass[x][y - 1] += flow;
						remaining_mass -= flow;
					//}
				}
				
				y--;
			}
			
			x--;
		}
		
		//generate water.
		if (FlxG.mouse.pressed)
		{
			var xPos:Int = FlxG.mouse.screenX >> 4;
			var yPos:Int = FlxG.mouse.screenY >> 4;
			if(xPos < 0) xPos = 0;
			if(xPos > mapWidth - 1) xPos = mapWidth - 1; 
			if(yPos < 0) yPos = 0;
			if(yPos > mapHeight - 1) yPos = mapHeight - 1; 
			if (cells[xPos][yPos] != 1)
			{
				cells[xPos][yPos] = 2;
				//old_mass[xPos][yPos] = 1;
				new_mass[xPos][yPos] = 1;
			}
		}
		
		for(w in 0...mapWidth)
		{
			old_mass[w][0] = 0;
			old_mass[w][mapHeight - 1] = 0;
			
			for(h in 0...mapHeight)
			{
				nMass = new_mass[w][h];
				//old_mass[w][h] = nMass;
				

				if (cells[w][h] == 1) {
					//waterMask.clearTile(w, h);
				}
				else
				{
					if (old_mass[w][h] != nMass) {
						cells[w][h] = (nMass > MIN_MASS) ? 2 : 0;
						waterMask.setTile(w, h, (nMass > 0.5) ? 1 : 0);
						old_mass[w][h] = nMass;
					}

				}
			}
		}
		
		for (h in 0...mapHeight)
		{
			old_mass[0][h] = 0;
			old_mass[mapWidth - 1][h] = 0;
		}
	}
	
	private function distributeWater(total_mass:Float):Float
	{
		if ( total_mass <= 1 ) 
		{
			return 1;
		}
		else if ( total_mass < 2.02) //else if ( total_mass < 2 * MAX_MASS + COMPRESSION) 
		{
			return (1 + total_mass * 0.02) * 0.98;// / 1.02; //return (MAX_MASS + total_mass * COMPRESSION) / (MAX_MASS + COMPRESSION);
		}
		else
		{
			return (total_mass + COMPRESSION) * 0.5;
		}
	}
	
	private function constrainRange(value:Float, min:Float, max:Float):Float
	{
		if (value > max) return max;
		else if (value < min) return min;
		else return value;
	}
	
	//public function solid(x:Int, y:Int):Bool
	//{
		//var n:Int = cells[x][y];
		//return n == 1;
	//}
	
	public function water(x:Int, y:Int):Bool
	{
		return cells[x][y] == 2;
	}
	
	override public function draw():Void
	{
		var nMass:Float = 0;
		//var x:Float = 16, y:Float = 16;
		var height:Float, alpha:Float;
		
		dstPoint.x = 16;// - FP.camera.x;
		dstPoint.y = 16;// - FP.camera.y;
		
		//Draw.resetTarget();
		
		for(w in 1...(mapWidth - 1))
		{
			for(h in 1...(mapHeight - 1))
			{
				nMass = old_mass[w][h];
				//var x:Float = w << 4;
				//var y:Float = h << 4;
				
				if(cells[w][h] == 2)
				{
					height = old_mass[w][h];
					if (height < 0) continue;// height = 0;
					if (height > 1) height = 1;
					
					srcRect.x = Math.ceil(height * 15) * 16;
					//alpha = height;
					//height *= 16;
					//if (alpha > 0.6) alpha = 0.6;
					/*
					var height:Float = (16 * constrainRange(old_mass[w][h], 0, 1));
					va
					g.beginFill(0x5980FF, constrainRange(nMass, 0, 0.6));
					*/
					if((cells[w][h - 1] != 2) && (cells[w + 1][h - 1] != 2))
					{
						srcRect.y = 0;
						//Draw.rect(x, y + (16 - height), 16, height, 0x5980FF, alpha, true);
						//g.drawRect(x, y + (16 - height), 16, height);
					}
					else {
						srcRect.y = 16;
						//Draw.rect(x, y, 16, 16, 0x5980FF, alpha, true);
						//g.drawRect(x, y, 16, 16);
					}
					
					//if(cameras == null)
					//cameras = FlxG.cameras.list;
					//var camera:FlxCamera;
					//var i : Int = 0;
					//var l : Int = cameras.length;
					//
					//while(i < l)
					//{
						//camera = cameras[i++];
						//if(!onScreen(camera))
							//continue;
					//
						//camera.buffer.copyPixels(tilesBmp, srcRect, dstPoint);
					//}
					
					#if flash
					FlxG.camera.buffer.copyPixels(tilesBmp, srcRect, dstPoint);
					#elseif (cpp || neko)
					//var matrix:Matrix = new Matrix();
					//matrix.b = matrix.c = 0;
					//matrix.a = matrix.d = 1;
					//matrix.tx = -dstPoint.x;
					//matrix.ty = -dstPoint.y;
					//FlxG.camera._canvas.graphics.beginBitmapFill(tilesBmp, matrix);
					//FlxG.camera._canvas.graphics.drawRect(srcRect.x, srcRect.y, srcRect.width, srcRect.height);
					//FlxG.camera._canvas.graphics.endFill();
					
					//var tilesheet = new Tilesheet(tilesBmp);
					//tilesheet.addTileRect(new Rectangle(srcRect.x, srcRect.y, srcRect.width, srcRect.height));
					//var newData:Array<Float> = new Array<Float>();
					//newData[0] = dstPoint.x;
					//newData[1] = dstPoint.y;
					//FlxG.camera._canvas.graphics.drawTiles(tilesheet, newData);
					
					var tilesheet = new Tilesheet(tilesBmp);
					var tile = tilesheet.addTileRect(new Rectangle(srcRect.x, srcRect.y, srcRect.width, srcRect.height));
					tilesheet.drawTiles(FlxG.camera.canvas.graphics, [ dstPoint.x, dstPoint.y, tile ]);
					
					#end
				}
				dstPoint.y += 16;
			}
			dstPoint.y = 16;
			dstPoint.x += 16;
		}
		
		//m.tx = -FP.camera.x;
		//m.ty = -FP.camera.y;
		//FP.buffer.draw(s, m);
		//g.clear();
	}
}
