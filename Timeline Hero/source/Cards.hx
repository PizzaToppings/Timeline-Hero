package;
/**
 * ...
 * @author Willem Meijer
 */
class Cards {
	static public var CE:Array<Int> 	= new Array<Int>();		// Card Event
	static public var CX:Array<Float> 	= new Array<Float>(); 	// Card X value
	static public var CY:Array<Float> 	= new Array<Float>(); 	// Card Y value
	static public var CES:Array<String> = new Array<String>(); 	// Card Event String
	static public var CC:Array<String> 	= new Array<String>(); 	// Card Counter
	static public var triggered:Bool = false;
	var maxEvents:Int;
	
	public function new(level:Int) { // this class creates the information of the location, events, and counters
		triggered = true;
		switch level {
			case 1: maxEvents = 6;
			case 2: maxEvents = 8;
		}
		
		for (e in 0...4) {
			
			// Generates & orders the events
			var rndEvent:Int = Math.ceil(maxEvents * Math.random());
			
			var a:Int = 0;
			while (a <= CE.length) { // makes sure one event cannot occur multiple times.
				if (rndEvent == CE[a]) {
					rndEvent = Math.ceil(maxEvents * Math.random());
					a = -1;
				}
				a ++;
			}
		
			// Generates & orders the X value
			var rndX:Int = Math.ceil(800 * Math.random()) + 100;
			
			var a:Int = 0;
			while (a <= CX.length) {
				if (rndX >= CX[a] - 100 && rndX <= CX[a] + 100) {
					rndX = Math.ceil(800 * Math.random()) + 100; 
					a = -1;
				}
				a ++;
			}
			
			var rndY:Int = Math.ceil(300 * Math.random()) + 80;
			
			CE.push(rndEvent);
			CX.push(rndX);
			CY.push(rndY);
			
			CES.push("assets/images/Events/Level_" + level + "_Event_" + rndEvent + ".png");
			CC.push("assets/images/Events/Level_" + level + "_Counter_" + rndEvent + ".png");
		}
	}
}