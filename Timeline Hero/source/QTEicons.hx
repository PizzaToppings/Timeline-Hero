package;

import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;

/**
 * ...
 * @author PizzaToppings
 */
class QTEicons extends FlxSprite
{
	var randomIcon:Int;
	public var button:String; // gives an button to they icon, which matches with the button pressed
	
	public function new() 
	{
		super();
		
		randomIcon = Math.floor(Math.random()*4);
		this.loadGraphic(AssetPaths.UpArrow__png);
		pickShape();
		this.y = 540;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		this.x -= 8;
	}
	
	function pickShape()
	{
		if (randomIcon == 1) // points to the right
		{
			this.angle = 90;
			this.button = "RIGHT"; 
		}
		if (randomIcon == 2) //points downwards
		{
			this.angle = 180;
			this.button = "DOWN";
		}
		if (randomIcon == 3) // points to the left
		{
			this.angle = 270;
			this.button = "LEFT";
		}
		if (randomIcon == 0) // points up
		{
			this.angle = 0;
			this.button = "UP";
		}
	}
	
}