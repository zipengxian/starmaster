package com.Galaxisfarm {
	// Bibliotecas da game engine Flixel
	import com.adamatomic.flixel.*;
	import flash.geom.Point;
	
	public class ButtonRegionMataAtlantica extends FlxSprite {
		// Sprite da região da mata atlântica
		[Embed(source = "../../data/button_region_mata_atlantica.png")] private var ImgRegionMataAtlantica:Class;
		
		// Método construtor
		public function ButtonRegionMataAtlantica(X:Number, Y:Number):void {
			// Carrega o sprite
			super(ImgRegionMataAtlantica, X, Y, false, false, 193, 225);
			
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