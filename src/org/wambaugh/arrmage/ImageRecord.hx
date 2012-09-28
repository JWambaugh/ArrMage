package org.wambaugh.arrmage;

import sys.db.Types;
import sys.db.Object;
/**
 * ...
 * @author Jordan Wambaugh
 */

@:index(hash)
@:index(createDate)
class ImageRecord extends Object
{
	public var id:SId;
	public var name:SString<255>;
	public var pathFromLibrary:SString<255>;
	public var hash:SString<64>;
	public var createDate:Date;
	public var modifiedDate:Date;
	public var fileSize:Int;

	public function new() 
	{
		super();
	}
	
	
	
}