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
	var id:SId;
	var name:SString<255>;
	var pathFromLibrary:SString<255>;
	var hash:SString<64>;
	var createDate:Date;
	var modifiedDate:Date;

	public function new() 
	{
		super();
	}
	
}