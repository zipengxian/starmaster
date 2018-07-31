package common.spriterhx.spriter;

import flash.display.Sprite;

class NativeSpriter extends Sprite
{
	public var brawler:SpriterClip;
	public var spriterLoader:SpriterLoader;
	public var orc:SpriterClip;
	
	public function new(){
		super();
		//We can scale the PNG's to any size we like, allowing you to start with Hi-Res assets, and scale down to lower powered devices.
		//In this case, the source sprites are Retina-Size, so we will downscale them by 50%
		var textureScale:Float = 0.5;
		
		//Use the SpriterLoader class to load individual SCML files, generate a TextureAtlas, and create AnimationSets, all at once.
		spriterLoader = new SpriterLoader();
		spriterLoader.completed.addOnce(onSpriterLoaderComplete);
		spriterLoader.load(["../../../assets/sprite/brawler/brawler.scml"], textureScale);
		//spriterLoader.load(["brawler/brawler.scml"], textureScale);
	}
	
	public function onSpriterLoaderComplete(loader:SpriterLoader):Void {
		
		//Add Orc 1
		//orc = spriterLoader.getSpriterClip("orc");
		//orc.play("attack2", 0);
		//orc.animationComplete.add(function(clip:SpriterClip){
			//orc.play("dead", 0);
		//});
		//orc.scaleX = -1;
		//orc.y = 50;
		//orc.x = 300;
		//orc.playbackSpeed = .5;
		//addChild(orc);
		
		//Add a "Brawler"
		brawler = spriterLoader.getSpriterClip("brawler");
		brawler.setPosition(500, 50);
		brawler.play("run");
		addChild(brawler);
	}
}