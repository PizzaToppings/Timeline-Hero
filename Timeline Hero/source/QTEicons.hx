package;
import flixel.FlxSprite;

/**
 * ...
 * @author PizzaToppings
 */
class QTEicons extends FlxSprite
{
	var randomIcon:Int;

	public function new() 
	{
		super();
		
		randomIcon = Math.floor(Math.random()*4);
		this.loadGraphic(AssetPaths.UpArrow__png);
		pickShape();
		this.y = -50;
		this.scale.x = this.scale.y = 0.1;
		this.width = this.height = 100;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		this.x -= 1;
	}
	
	function pickShape()
	{
		if (randomIcon == 1)
		{
			this.angle = 90;
		}
		if (randomIcon == 2)
		{
			this.angle = 180;
		}
		if (randomIcon == 3)
		{
			this.angle = 270;
		}
		if (randomIcon == 4)
		{
			this.angle = 0;
		}
	}
	
}