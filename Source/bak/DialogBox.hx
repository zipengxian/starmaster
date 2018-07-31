package ui;

import flixel.FlxSprite;
import flixel.group.FlxGroup;
import state.BaseState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.ui.FlxButton;

class DialogBox {
	
	// Componentes da Dialog Box
	private var _components:FlxGroup;
	
	private var state:BaseState;
	
	// Construtor
	public function new(message:String, state:BaseState, isPlayer:Bool = true):Void {
		_components = new FlxGroup();
		
		if (isPlayer) {			
			var bgInner:FlxSprite = new FlxSprite(21, 324);
			bgInner.loadGraphic("assets/ui/dialog_box_bg_inner.png", false, false, 95, 95);
			_components.add(bgInner);
			state.getLyrSprites().add(bgInner);
			
			var bgUp:FlxSprite = new FlxSprite(20, 322);
			bgUp.loadGraphic("assets/ui/dialog_box_bg_up.png", false, false, 100, 49);
			_components.add(bgUp);
			state.getLyrSprites().add(bgUp);
			
			// Ator
			var actor:FlxSprite = new FlxSprite(37, 298);
			actor.loadGraphic("assets/ui/dialog_box_actor.png", true, false, 76, 120);
			actor.animation.add("speak", [0, 1, 2, 3, 4, 5, 6, 7, 8], 5, true);
			actor.animation.play("speak");
			_components.add(actor);
			state.getLyrSprites().add(actor);
			
			var bgBottom:FlxSprite = new FlxSprite(20, 371);
			bgBottom.loadGraphic("assets/ui/dialog_box_bg_bottom.png", false, false, 100, 49);
			_components.add(bgBottom);
			state.getLyrSprites().add(bgBottom);
		} else {
			// Ator Error
			var actorError:FlxSprite = new FlxSprite(20, 292);
			actorError.loadGraphic("assets/ui/dialog_box_actor_error.png", true, false, 100, 126);
			actorError.animation.add("speak", [3, 4, 5, 6, 7, 8, 0, 1, 2], 5, true);
			actorError.animation.play("speak");
			_components.add(actorError);
			state.getLyrSprites().add(actorError);				
		}
		
		// Dialog Box
		var dialogBox:FlxSprite = new FlxSprite(120, 295);
		dialogBox.loadGraphic("assets/ui/dialog_box.png", false, false, 351, 90);
		_components.add(dialogBox);
		state.getLyrSprites().add(dialogBox);
		
		// Mensagem
		//var message:FlxText = new FlxText(155, 300, 351, 90, message, 0x000000, "fontVerdana", 12, "left");
		var text:FlxText = new FlxText(155, 300, 351, message, 12, false);
		text.color = FlxColor.BLACK;
		//text.font = "assets/fonts/SIMFANG.TTF";
		//text.setFormat("simsun", 24, FlxColor.BLACK, "left");
		_components.add(text);
		state.getLyrSprites().add(text);
	}
	
	// Remove os componentes
	public function destroy():Void {
		//for( i in (_components.length - 1)...0 ) {
			//_components[i].kill();
			//_components.remove(_components[i], true);
		//}
		
		_components.kill();
	}
	
	// Obtém a lista de componentes
	public function getComponents():FlxGroup {
		return _components;
	}
	
	// Adiciona um componente
	public function addComponent(Component:Dynamic):Void {
		_components.add(Component);
		state.getLyrSprites().add(Component);
	}
	
	// Cria o botão de ok apenas para desaparecer
	// com os elementos da dialog box da tela
	public function createDefaultButtonOK():Void {
		addComponent(new FlxButton(410, 365, "ok", function() {
			destroy();
		}));
	}
}