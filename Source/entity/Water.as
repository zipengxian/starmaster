package  {
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author grigri
	 */
	public class Water extends Entity
	{
		/* Variables */
		public var cells:Vector.<Vector.<int>> = new Vector.<Vector.<int>>();//contains the data.
		public var mass:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();//to calculate step.
		private var new_mass:Vector.<Vector.<Number>> = new Vector.<Vector.<Number>>();// / to calculate step.
		
		private var waterMask:Grid;
		
		private var mapWidth:int = 0;
		private var mapHeight:int = 0;
		
		/* Constants */
		private const MAX_MASS:Number = 1.0;
		private const COMPRESSION:Number = 0.02;//how much extra water pressure in can be stored in the cell below.
		private const MIN_MASS:Number = 0.0001;//ignore very dry cells.

		private const MIN_FLOW:Number = 0.01;
		private const MAX_MOVEMENT:Number = 1;//Max units of water moved between two cells per turn.
		
		private var tilesBmp:BitmapData;
		private var srcRect:Rectangle = new Rectangle(0, 0, 16, 16);
		private var dstPoint:Point = new Point;
		/*
		private var s:Sprite;
		private var g:Graphics;
		private var m:Matrix;
		*/
		
		public function Water(grid:Grid, width:int, height:int) 
		{
			super(0, 0, null, waterMask);
			
			mask = waterMask = new Grid(width, height, 16, 16);
			mapWidth = width >> 4;
			mapHeight = height >> 4;
			
			//m = new Matrix;
			//s = new Sprite;
			//g = s.graphics;
			
			type = "water";
			
			var w:int, h:int;
			for(w = 0; w < mapWidth; w++) 
			{
				cells[w] = new Vector.<int>();
				mass[w] = new Vector.<Number>();
				new_mass[w] = new Vector.<Number>();
				
				for(h = 0; h < mapHeight; h++)
				{
					cells[w][h] = 0;
					mass[w][h] = 0;
					new_mass[w][h] = 0;
				}
			}
			
			//read grid
			for(w = 0; w < mapWidth; w += 2)
			{
				for(h = 0; h < mapHeight; h += 2)
				{
					if(grid.getTile(w >> 1, h >> 1))
					{
						cells[w][h] = 1;
						cells[w + 1][h] = 1;
						cells[w][h + 1] = 1;
						cells[w + 1][h + 1] = 1;
					}
				}
			}
			
			//layer = Layer.WATER;
			
			tilesBmp = new BitmapData(16 * 16, 16 * 2, true, 0);
			Draw.setTarget(tilesBmp);
			var alpha:Number;
			for (w = 0; w < 16; w++) {
				alpha = w / 15.0;
				if (alpha > 0.6) alpha = 0.6;
				Draw.rect(w * 16, 16 - w - 1, 16, w + 1, 0x5980FF, alpha, true);
				Draw.rect(w * 16, 16, 16, 16, 0x5980FF, alpha, true);
			}
			Draw.resetTarget();
		}
		
		/*
		override public function added():void {
			super.added();
			world.addGraphic(new Stamp(tilesBmp), 0, 0, 100);
		}
		*/
		
		override public function update():void
		{
			super.update();
			
			var flow:Number = 0;
			var remaining_mass:Number;
			var w:int, h:int, x:int, y:int;
			var nMass:Number = 0;
			
			for(x = mapWidth - 1; x > 0; x--)
			{
				for(y = mapHeight - 1; y > 0; y--)
				{
					if(cells[x][y] == 1) continue;//Skip ground blocks.
					
					flow = 0;
					remaining_mass = mass[x][y];
					
					if(remaining_mass <= 0) continue;
					
					//check flow beneath.
					if(y < mapHeight - 1 && cells[x][y+1] != 1)
					{
						nMass = mass[x][y + 1]
						//if (nMass < mass[x][y]) {
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
					
					if(remaining_mass <= 0) continue;
					
					//Check to the left.
					if(x > 0 && cells[x-1][y] != 1)
					{
						//if (mass[x - 1][y] < mass[x][y]) {
							flow = (mass[x][y] - mass[x - 1][y]) * 0.25;
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
					
					if(remaining_mass <= 0) continue;
					
					//check to the right.
					if(x < mapWidth - 1 && cells[x+1][y] != 1)
					{
						//if (mass[x + 1][y] < mass[x][y]) {
							flow = (mass[x][y] - mass[x + 1][y]) * 0.25;
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
					
					if(remaining_mass <= 0) continue;
					
					//Up. Only compressed water should flows upwards.
					if(y > 0 && cells[x][y-1] != 1)
					{
						//if (mass[x][y-1] < remaining_mass) {
							flow = remaining_mass - distributeWater(remaining_mass + mass[x][y - 1]);
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
				}
			}
			
			//generate water.
			if (Input.mouseDown)
			{
				var xPos:int = world.mouseX >> 4;
				var yPos:int = world.mouseY >> 4;
				if(xPos < 0) xPos = 0;
				if(xPos > mapWidth - 1) xPos = mapWidth - 1; 
				if(yPos < 0) yPos = 0;
				if(yPos > mapHeight - 1) yPos = mapHeight - 1; 
				if (cells[xPos][yPos] != 1)
				{
					cells[xPos][yPos] = 2;
					//mass[xPos][yPos] = 1;
					new_mass[xPos][yPos] = 1;
				}
			}
			
			for(w = 0; w < mapWidth; w++)
			{
				mass[w][0] = 0;
				mass[w][mapHeight - 1] = 0;
				
				for(h = 0; h < mapHeight; h++)
				{
					nMass = new_mass[w][h];
					//mass[w][h] = nMass;
					

					if (cells[w][h] == 1) {
						//waterMask.clearTile(w, h);
					}
					else
					{
						if (mass[w][h] != nMass) {

						cells[w][h] = nMass > MIN_MASS ? 2 : 0;
						waterMask.setTile(w, h, nMass > 0.5);

						mass[w][h] = nMass;
						}

					}
				}
			}
			
			for (h = 0; h < mapHeight; h++)
			{
				mass[0][h] = 0;
				mass[mapWidth - 1][h] = 0;
			}
		}
		
		private function distributeWater(total_mass:Number):Number
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
		
		private function constrainRange(value:Number, min:Number, max:Number):Number
		{
			if (value > max) return max;
			else if (value < min) return min;
			else return value;
		}
		
		protected function solid(x:int, y:int):Boolean
		{
			var n:int = cells[x][y]
			return n == 1;
		}
		
		protected function water(x:int, y:int):Boolean
		{
			return cells[x][y] == 2;
		}
		
		override public function render():void
		{
			var nMass:Number = 0;
			//var x:Number = 16, y:Number = 16;
			var height:Number, alpha:Number;
			
			dstPoint.x = 16;// - FP.camera.x;
			dstPoint.y = 16;// - FP.camera.y;
			
			//Draw.resetTarget();
			
			for(var w:int = 1; w < mapWidth - 1; w++)
			{
				for(var h:int = 1; h < mapHeight - 1; h++)
				{
					nMass = mass[w][h];
					//var x:Number = w << 4;
					//var y:Number = h << 4;
					
					if(cells[w][h] == 2)
					{
						height = mass[w][h];
						if (height < 0) continue;// height = 0;
						if (height > 1) height = 1;
						
						srcRect.x = Math.ceil(height * 15) * 16;
						//alpha = height;
						//height *= 16;
						//if (alpha > 0.6) alpha = 0.6;
						/*
						var height:Number = (16 * constrainRange(mass[w][h], 0, 1));
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
						FP.buffer.copyPixels(tilesBmp, srcRect, dstPoint);
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


}