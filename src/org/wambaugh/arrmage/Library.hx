package org.wambaugh.arrmage;

/**
 * ...
 * @author Jordan Wambaugh
 */

class Library 
{
	static var record:LibraryRecord;
	public static var isNew:Bool=false;
	static public function init() 
	{
		record = LibraryRecord.manager.get(1);
		if (record == null) {
			record = new LibraryRecord();
			record.createDate = Date.now();
			record.insert();
			isNew = true;
		}
	}
	
	public static function setPath(path:String) {
		record.libraryPath = path;
		record.update();
	}
	
	public static function getPath():String {
		return record.libraryPath;
	}
	
}