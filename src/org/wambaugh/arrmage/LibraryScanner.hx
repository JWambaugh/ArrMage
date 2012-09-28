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
using StringTools;
class LibraryScanner 
{

	var extensionERegs:Array<EReg>;
	public function new() 
	{
		var extensions = Library.getValidExtensions();
		extensionERegs = new Array<EReg>();
		for (ext in extensions) {
			var reg = new EReg(ext+"$","i");
			extensionERegs.push(reg);
		}
	}
	
	
	public function scan(folder:String) {
		var files = FileSystem.readDirectory(folder);
		var pathFromLibrary = folder.replace(Library.getPath(), "");
		for (file in files) {
			if (FileSystem.isDirectory(folder+"/"+file)) {
				this.scan(folder + "/"+file);
			}else if (this.isImageFile(file)) {
				var path = folder + "/" + file;
				trace(path);
				//get file info
				var stat:FileStat=FileSystem.stat(path);
				//see if we already have that image in the library
				var records = ImageRecord.manager.search($pathFromLibrary == pathFromLibrary && $name == file);
				var record:ImageRecord;
				if (records.length > 0) {
					record = records.first();
					//setup file for rehashing if changed since last scan
					if (record.modifiedDate.toString() != stat.mtime.toString() || record.fileSize != stat.size) {
						trace("change detected in "+path);
						record.hash = "";
						record.modifiedDate = stat.mtime;
						record.fileSize = stat.size;
						record.update();
					}
					
				}else {
					record = new ImageRecord();
					record.name = file;
					record.pathFromLibrary = pathFromLibrary;
					record.createDate = Date.now();
					record.modifiedDate = stat.mtime;
					record.hash = "";
					record.fileSize = stat.size;
					record.insert();
				}
			}
			
		}
		
	}
	
	private function isImageFile(fileName:String):Bool {
		for (reg in extensionERegs) {
			if (reg.match(fileName)) {
				return true;
			}
		}
		return false;
	}
}