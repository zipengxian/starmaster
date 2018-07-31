package com.Galaxisfarm {
	// Bibliotecas da game engine Flixel
	import com.adamatomic.flixel.*;
	import flash.geom.Point;
	
	public class ButtonRegionAmazonia extends FlxSprite {
		// Sprite da região amazônia
		[Embed(source = "../../data/button_region_amazonia.png")] private var ImgRegionAmazonia:Class;
		
		// Método construtor
		public function ButtonRegionAmazonia(X:Number, Y:Number):void {
			// Carrega o sprite
			super(ImgRegionAmazonia, X, Y, false, false, 280, 203);
			
			// Define as animações
			addAnimation("normal", [0]);
			addAnimation("selected", [1]);
		}
		
		// Método chamado quando o objeto está selecionado
		public function selected(player:Player):void {
			play("selected");
		}
		
		// Método chamado para deselecionar o objeto
		public function unselected():void {
			play("normal");
		}
		
		// Método que verifica se ocorreu onMouseOver
		public function checkOnMouseOver(position:Point):Boolean {
			if (this.overlapsPoint(position.x, position.y, true)) {
				play("selected");
				return true;
			} else {
				play("normal");
				return false;
			}
		}
	}
}