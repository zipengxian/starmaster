package ui;
import entity.MaterialIcon;
import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.ui.FlxSlider;
import state.SceneState;
import flixel.FlxSprite;

/**
 * ...
 * @author blaze
 */
class TaskBackgroundUI extends FlxGroup
{
	private var _window:TaskWindow;
	public var background:FlxExtendedSprite;
	private var _backgroundLastX:Float; 
	private var _backgroundLastY:Float;
	
	// Construtor
	public function new(window:TaskWindow):Void 
	{
		super();
		
		_window = window;
		//	Enable the plugin - you only need do this once (unless you destroy the plugin)
		if (FlxG.plugins.get(FlxMouseControl) == null)
		{
			FlxG.plugins.add(new FlxMouseControl());
		}

		background = new FlxExtendedSprite(FlxG.width/2 - 600/2, FlxG.height / 2 - 400/2);			
		background.makeGraphic(600, 400, 0xff9999ff);
		background.enableMouseDrag(false, false);
		background.scrollFactor.set(0, 0);
		add(background);
		
		_backgroundLastX = background.x;
		_backgroundLastY = background.y;
	}
	
	override function update():Void
	{
		super.update();
		
		//同步components
		if (background.isDragged == true)
		{
			for (c in _window.components.members)
			{
				cast(c, FlxSprite).x += background.x - _backgroundLastX;
				cast(c, FlxSprite).y += background.y - _backgroundLastY;
			}
			
			_backgroundLastX = background.x;
			_backgroundLastY = background.y;
		}
	}
	
}