package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var QTEtrigger:FlxSprite;
	var IconGroup:FlxTypedGroup<QTEicons>;
	var QTEicon:QTEicons;
	
	override public function create():Void
	{
		super.create();
		
		IconGroup = new FlxTypedGroup<QTEicons>();
		
		QTEtrigger = new FlxSprite();
		QTEtrigger.loadGraphic(AssetPaths.Trigger__png);
		QTEtrigger.scale.x = QTEtrigger.scale.y = 0.1;
		QTEtrigger.width = QTEtrigger.height = 0.1;
		add(QTEtrigger);
		
		CreateIcons();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		QTE();
	}
	
	function CreateIcons()
	{		
		for (i in 0...6)
		{
			QTEicon = new QTEicons();
			QTEicon.x = 100 + 150 * i;
			add(QTEicon);
			IconGroup.add(QTEicon);
		}	
		add(IconGroup);
	}
	
	function QTE() 
	{	
		if (FlxG.overlap(IconGroup, QTEtrigger) && FlxG.keys.pressed.UP)
		{
			QTEicon.kill();
			FlxG.camera.flash();
		}
		
		IconGroup.forEach(Test);
	}
}
