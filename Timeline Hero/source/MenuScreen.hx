package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuScreen extends FlxState
{
	var startButton:FlxButton;
	var DressingRoomButton:FlxButton;
	
	override public function create():Void
	{
		super.create();
		
		startButton = new FlxButton(20, 50, "", StartGame);
		add(startButton);
		
		DressingRoomButton = new FlxButton(20, 150, "", GoToDressingroom);
		add(DressingRoomButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		ButtonOverlap();
	}
	
	function StartGame()
	{
		FlxG.switchState(new PlayState(1));
	}
	
	function GoToDressingroom()
	{
		FlxG.switchState(new DressingRoom());
	}
	
	function ButtonOverlap()
	{
		if (FlxG.mouse.overlaps(startButton))
		{
			startButton.loadGraphic(AssetPaths.ButtonStart2__png);
		}
		else 
		{
			startButton.loadGraphic(AssetPaths.ButtonStart__png);
		}
		
		if (FlxG.mouse.overlaps(DressingRoomButton))
		{
			DressingRoomButton.loadGraphic(AssetPaths.ButtonKleedkamer2__png);
		}
		else 
		{
			DressingRoomButton.loadGraphic(AssetPaths.ButtonKleedkamer__png);
		}
	}
}
