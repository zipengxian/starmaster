package common.spriterhx;

import flash.display.Sprite;
import flash.Lib;
//import common.spriterhx.spriter.NativeSpriter;

/**
 * @author SlavaRa
 */
class Main extends Sprite {
	
	public static function main() Lib.current.addChild(new Main());
	
	public function new() {
		super();
		initialize();
	}
	
	inline function initialize() addChild(new GameDemo());
}