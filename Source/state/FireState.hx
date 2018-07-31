package state;

import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;

class FireState extends FlxState {
	private var _flame_particles:FlxEmitter;
	private var _max_flame_particles:Int = 50; 

	override public function create():Void {
		createParticles(FlxG.height, FlxG.width / 2);
	}   

	override public function update():Void {
		super.update();
	}   

	private function createParticles(X:Float, Y:Float):Void {
		_flame_particles =  new FlxEmitter(X, Y); 
		//_flame_particles.delay = 0;
		_flame_particles.gravity = -10;
		_flame_particles.maxRotation = 0;
		_flame_particles.setYSpeed(-20, -25);
		_flame_particles.setXSpeed(-20, 20);
			
		for(i in 0..._max_flame_particles) {
			var particle:FlxParticle = new FlxParticle();

			if(i%2 == 0)
				particle.makeGraphic(4, 4, 0xFFFF0000);
			else
				particle.makeGraphic(4, 4, 0xFFFFFF00);
				
			particle.exists = false;
			_flame_particles.add(particle);
		}   

		add(_flame_particles);
		_flame_particles.start(false);
	}   
}   
