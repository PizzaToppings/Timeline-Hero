package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;

/**
 * ...
 * @author PizzaToppings
 */
class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		var title:FlxText = new FlxText(0, 0, 0, "Timeline Hero", 90);
		title.setPosition(FlxG.stage.stageWidth / 2 - title.width / 2, 100);
		add(title);
		
		var instructions:FlxText = new FlxText(0, 0, 0, "Klik op het scherm om verder te gaan", 40);
		instructions.setPosition(FlxG.stage.stageWidth / 2 - instructions.width / 2, 550);
		add(instructions);
		FlxFlicker.flicker(instructions, 0, 0.5); 
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (FlxG.mouse.justPressed || FlxG.keys.anyJustPressed(["SPACE","ENTER"]))
		{
			FlxG.switchState(new ChooseCharacter());
		}
	}
}