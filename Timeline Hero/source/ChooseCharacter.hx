package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
 * ...
 * @author PizzaToppings
 */
class ChooseCharacter extends FlxState
{
	var characterSelection:FlxSprite;

	override public function create()
	{
		characterSelection = new FlxSprite();
		add(characterSelection);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.mouse.x <= 350) // change highlights for boy/girl selection
		{
			characterSelection.loadGraphic(AssetPaths.ChooseGirl__png);
			if (FlxG.mouse.justPressed)
			{
				Selected("Girl");
			}
		}
		else
		{
			characterSelection.loadGraphic(AssetPaths.ChooseBoy__png);
			if (FlxG.mouse.justPressed)
			{
				Selected("Boy");
			}
		}
	}
	
	function Selected(gender:String)
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, StartGame);
		
		var dressingRoom:DressingRoom = new DressingRoom();
		dressingRoom.SetGender(gender);
		// TODO: show the player which character was chosen (boy or girl)
	}
	
	function StartGame()
	{
		FlxG.switchState(new MenuScreen());
	}
}