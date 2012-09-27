package org.wambaugh.arrmage;
import sys.db.Sqlite;
import org.wambaugh.arrmage.ImageRecord;
/**
 * ...
 * @author Jordan Wambaugh
 */

class Database 
{

	public static function init() {
		
		//initialize DB stuff
		sys.db.Manager.initialize();
		var cnx = Sqlite.open("ArrMage.db");
		sys.db.Manager.cnx = cnx;
		if ( !sys.db.TableCreate.exists(ImageRecord.manager) )
		{
			sys.db.TableCreate.create(ImageRecord.manager);
		}
		if ( !sys.db.TableCreate.exists(LibraryRecord.manager) )
		{
			sys.db.TableCreate.create(LibraryRecord.manager);
		}
		
	}
	
}