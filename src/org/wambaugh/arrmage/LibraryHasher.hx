package org.wambaugh.arrmage;
import sys.FileSystem;
import sys.FileStat;
import haxe.io.Path;
import Lambda;
import org.wambaugh.arrmage.ImageRecord;
/**
 * ...
 * @author Jordan Wambaugh
 */

class LibraryHasher 
{

	public function new() 
	{
		
	}
	
	public function hashLibrary() {
		var libPath = Library.getPath();
		var records = ImageRecord.manager.search($hash == "");
		var x = 0;
		for (record in records) {
			trace(++x + " of "+records.length + "  "+record.name);
			var path = libPath +record.pathFromLibrary + "/"+ record.name;
			var hash = FileHasher.hashFile(path);
			record.hash = hash;
			record.update();
		}
	}
	
	
}