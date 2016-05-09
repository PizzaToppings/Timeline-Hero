package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState2 extends FlxState
{
	var QTEtrigger:FlxSprite; // indicates the location when you have to press the button
	var QTEend:FlxSprite; //the end of the QTE
	var IconGroup:FlxTypedGroup<QTEicons>; //array for the buttons on the QTE
	var QTEicon:QTEicons; //creates an individual icon for the buttons 
	var QTEcounter:Int = 0; //counts the amount of icons that passed the QTE
	var failPoints:Int = 0; //counts the amount of times the player has failed
	var screen:FlxSprite;
	
	
	override public function create():Void
	{
		super.create();
		
		screen = new FlxSprite();
		screen.loadGraphic(AssetPaths.screen1correct__png);
		add(screen);
		
		var timeline:FlxSprite = new FlxSprite();
		timeline.loadGraphic(AssetPaths.Timeline__png);
		timeline.y = 545;
		add(timeline);
		
		QTEtrigger = new FlxSprite();	//create the trigger
		QTEtrigger.loadGraphic(AssetPaths.Trigger__png);
		QTEtrigger.setPosition(75, 500);
		add(QTEtrigger);
		
		QTEend = new FlxSprite();	//create the trigger
		QTEend.loadGraphic(AssetPaths.Trigger__png);
		QTEend.setPosition(-50, 500);
		QTEend.visible = false;
		add(QTEend);
		
		CreateIcons(); //fuctions that creates the array and adds the icons
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		DontSpam(); // function. prevents spamming
		
		FlxG.overlap(QTEtrigger, IconGroup, QTE); // checks when the icons should be pressed
		FlxG.overlap(QTEend, IconGroup, MissedIcon); // checks if the icons were missed
	}
	
	function CreateIcons()
	{		
		IconGroup = new FlxTypedGroup<QTEicons>();
		
		for (i in 0...18) //creates 6 icons for the QTE
		{
			QTEicon = new QTEicons();
			QTEicon.x = 1280 + 250 * i;
			add(QTEicon);
			IconGroup.add(QTEicon);
		}	
		add(IconGroup);
	}
	
	function QTE(QTEtrigger:FlxSprite, icon:QTEicons):Void //checks when the icons overlap the trigger
	{	
		if (FlxG.keys.pressed.UP && icon.button == "UP") // removes the icon if correct button is pressed
		{
			PressedCorrect(icon);
		}
		if (FlxG.keys.pressed.LEFT && icon.button == "LEFT")
		{
			PressedCorrect(icon);
		}
		if (FlxG.keys.pressed.DOWN && icon.button == "DOWN")
		{
			PressedCorrect(icon);
		}
		if (FlxG.keys.pressed.RIGHT && icon.button == "RIGHT")
		{
			PressedCorrect(icon);
		}
		
		//gives an error if a button is pressed at the wrong time
		if (FlxG.keys.pressed.UP && icon.button != "UP") 
		{
			FlxG.camera.flash(FlxColor.RED, 0.3);
			failPoints += 1;
		}
		if (FlxG.keys.pressed.LEFT && icon.button != "LEFT")
		{
			FlxG.camera.flash(FlxColor.RED, 0.3);
			failPoints += 1;
		}
		if (FlxG.keys.pressed.DOWN && icon.button != "DOWN")
		{
			FlxG.camera.flash(FlxColor.RED, 0.3);
			failPoints += 1;
		}
		if (FlxG.keys.pressed.RIGHT && icon.button != "RIGHT")
		{
			FlxG.camera.flash(FlxColor.RED, 0.3);
			failPoints += 1;
		}
	}
	
	function PressedCorrect(icon)
	{
		icon.kill();
		QTEcounter += 1;
		GetScreens(); //function. changes the screens depending on how well you do
	}
	
	function DontSpam()
	{
		if (FlxG.keys.anyJustPressed(["UP", "DOWN", "LEFT", "RIGHT"]) && !FlxG.overlap(QTEtrigger, IconGroup))
		{
			FlxG.camera.flash(FlxColor.RED, 0.3);
		}
	}
	
	function MissedIcon(QTEend:FlxSprite, icon:QTEicons):Void
	{
		icon.kill();
		QTEcounter += 1;
		failPoints += 1;
		GetScreens();
	}
	
	function GetScreens()
	{
		if (QTEcounter == 6 && failPoints <= 2)
		{
			screen.loadGraphic(AssetPaths.screen2correct__png);
			failPoints = 0; // resets failpoints
		}
		else if (QTEcounter == 6 && failPoints >= 3)
		{
			screen.loadGraphic(AssetPaths.screen2fail__png);
			failPoints = 0;
		}
		if (QTEcounter == 12 && failPoints <= 2)
		{
			screen.loadGraphic(AssetPaths.screen3correct__png);
			failPoints = 0; 
		}
		else if (QTEcounter == 12 && failPoints >= 3)
		{
			screen.loadGraphic(AssetPaths.screen3fail__png);
			failPoints = 0;
		}
	}
}
