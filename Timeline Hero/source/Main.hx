package;

import flixel.FlxGame;
import openfl.display.Sprite;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;

class Main extends Sprite
{
	public function new() // Makes the game fullscreen, and loads the menuscreen.
	{
		super();
		FlxG.fullscreen = true;
		addChild(new FlxGame(1280, 720, MenuState));
	}
}