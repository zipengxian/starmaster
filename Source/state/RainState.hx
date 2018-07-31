package state;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import nme.Assets;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author blaze
 */
class RainState extends FlxState 
{
	override public function create():Void 
	{
		#if !neko
		bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end
		
		var rainEmitter:FlxEmitter = new FlxEmitter(0, 0, 200);
		rainEmitter.setSize(FlxG.width, 0);
		rainEmitter.setXSpeed(5, 5);
		rainEmitter.setYSpeed(50, 50);
		rainEmitter.setRotation(0, 0);
		add(rainEmitter);
		
		var rainDrop:FlxParticle;
		for (i in 0...rainEmitter.maxSize) 
		{
			rainDrop = new FlxParticle();
			#if !neko
			rainDrop.makeGraphic(1, 6, FlxColor.SILVER);
			#else
			rainDrop.makeGraphic(2, 2, {rgb: 0xFFFFFF, a: 0xFF});
			#end
			rainDrop.visible = false; //Make sure the particle doesn't show up at (0, 0)
			rainEmitter.add(rainDrop);
		}
		#if (cpp || neko)
		var myAtlas = createAtlas("particles", 128, 128);
		rainEmitter.atlas = myAtlas;
		#end
		
		rainEmitter.start(false, 10, .1);
		
		FlxG.mouse.show();
	}
	
	override public function destroy():Void 
	{
		super.destroy();
	}

	override public function update():Void 
	{
		super.update();
	}	
	
}