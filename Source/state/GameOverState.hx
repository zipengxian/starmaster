package com.Galaxisfarm {
	// Bibliotecas da game engine Flixel
	import com.adamatomic.flixel.*;
	
	public class GameOverState extends FlxState {
		// Variável da camada do palco
		private static var lyrStage:FlxLayer;
		// Imagem versão beta
		[Embed(source = "../../data/version_beta.png")] protected var ImgVersionBeta:Class;
		// Sprite da borda
		[Embed(source = "../../data/border.png")] protected var ImgBorder:Class;
		
		override public function create():Void {		
			super.create();
			// Cria o objeto da camada do palco
			lyrStage = new FlxLayer;
			
			// Adiciona o background no palco
			var backgroundCerrado:BackgroundCerrado = new BackgroundCerrado(20, 0);
			backgroundCerrado.play("normal");
			lyrStage.add(backgroundCerrado);
			
			// Textos explicativos
			lyrStage.add(new FlxText(0, 40, FlxG.width, 80, "Parabéns!", 0xffffffff, null, 26, "center")) as FlxText;
			lyrStage.add(new FlxText(0, 200, FlxG.width, 80, "O tempo acabou. Precisamos melhorar.", 0xffffffff, null, 26, "center"));
			lyrStage.add(new FlxText(0, 280, FlxG.width, 80, "Pressione X para recomeçar", 0xffffffff, null, 16, "center"));
			
			// Adiciona o palco
			this.add(lyrStage);
			
			// Imagem versão beta
			lyrStage.add(new FlxSprite(ImgVersionBeta, 534, 3));
			
			var border:FlxSprite = new FlxSprite(ImgBorder);
			lyrStage.add(border);
		}
		
		// Método chamado constantemente
		override public function update():void {
			// Quando pressionar a tecla X
			// recomeça o jogo
			if (FlxG.kA) {
				FlxG.flash(0xffffffff, 0.75);
				
				// Vai para o menu
				FlxG.switchState(MenuState);	
			}
			
			super.update();
		}
	}
}