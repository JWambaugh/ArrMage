package org.wambaugh.arrmage;
import sys.db.Types;
import sys.db.Object;
/**
 * ...
 * @author Jordan Wambaugh
 */

class LibraryRecord extends Object
{
	public var id:SId;
	public var libraryPath:SString<255>;
	public var createDate:Date;

	public function new() 
	{
		this.libraryPath = '';
		super();
		
	}
	
}