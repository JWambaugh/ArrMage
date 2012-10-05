package org.wambaugh.arrmage;
import haxe.Md5;
import sys.io.File;
import sys.db.Object;
/**
 * ...
 * @author Jordan Wambaugh
 */

class FileHasher 
{

	public static function hashFile(fileName:String):String {
		return FileHasher.hashString(File.getContent(fileName));
	}
	
	public static function hashString(s:String):String {
		return Md5.encode(s);
	}
	
}