package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;

/**
 * ...
 * @author PizzaToppings
 */
class DressingRoom extends FlxState
{
	var character:FlxSprite;
	var outfits:Array<String> = ["Normal", "Roman", "Cavewoman"];
	var unlocked:Array<String> = ["Character", "Character", "Character"]; //Silhouette is locked, Character is unlocked
	var outfitNr:Int = 1;
	var gender:String = "Girl";

	override public function create() 
	{
		super.create();
		
		var background:FlxSprite = new FlxSprite();
		background.makeGraphic(1280, 720);
		add(background);
		
		character = new FlxSprite();
		character.x = 100;
		character.y = -50;
		add(character);
		
		AddButtons();
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		GetOutfit();
		
		CircleNumbers();
	}
	
	public function SetGender(newGender)
	{
		gender = newGender;
	}
	
	function GetOutfit()
	{
		if (outfits[outfitNr] != null) // prevents an error when outfitsnr reaches -1 or 3
		{
			character.loadGraphic("assets/images/Dressingroom/" + unlocked[outfitNr] + gender + outfits[outfitNr] + ".png");
		}
	}
	
	function CircleNumbers()
	{
		//makes sure the number resets when it hits max
		if (outfitNr == -1)
		{
			outfitNr = 2;
		}
		if (outfitNr == 3)
		{
			outfitNr = 0;
		}
	}
	
	function AddButtons()
	{
		var leftButton:FlxButton = new FlxButton(100, 200, "",LowerNumber);
		leftButton.loadGraphic(AssetPaths.LeftButton__png);
		add(leftButton);
		
		var rightButton:FlxButton = new FlxButton(500, 200, "", HigherNumber);
		rightButton.loadGraphic(AssetPaths.RightButton__png);
		add(rightButton);
		
		var returnButton:FlxButton = new FlxButton(10, 400, "", ToMenu);
		returnButton.loadGraphic(AssetPaths.ButtonTerug__png);
		add(returnButton);
	}
	
	function LowerNumber():Void 
	{
		outfitNr -= 1;
	}
	
	function HigherNumber():Void
	{
		outfitNr += 1;
	}
	
	function ToMenu()
	{
		FlxG.switchState(new MenuScreen());
	}
}