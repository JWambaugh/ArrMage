package org.wambaugh.arrmage;

import nme.display.Sprite;
import nme.display.Stage;
import nme.events.Event;
import nme.Lib;
import org.wambaugh.arrmage.ImageRecord;
import org.wambaugh.arrmage.Database;
import org.wambaugh.arrmage.Library;
import org.wambaugh.arrmage.LibraryScanner;
import firmament.ui.FDialog;

/**
 * ...
 * @author Jordan Wambaugh
 */

class Main extends Sprite 
{
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		//make screen white
		var stage:Stage = Lib.current.stage;
		this.graphics.beginFill(0xFFFFFF);
		this.graphics.drawRect(0, 0, 2000,2000);
		this.graphics.endFill();
		
		Database.init();
		Library.init();
		if (Library.isNew) {
			FDialog.prompt("Looks like you're new! Please enter the location of your library.", function(s:String) {
				Library.setPath(s);
			});
		}
		var scanner = new LibraryScanner();
		scanner.scan(Library.getPath());
		var hasher = new LibraryHasher();
		hasher.hashLibrary();
		trace('scan complete');
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
