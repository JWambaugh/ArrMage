
package org.wambaugh.arrmage;
import org.wambaugh.arrmage.ImageRecord;
import org.wambaugh.arrmage.Database;
import org.wambaugh.arrmage.Library;
import org.wambaugh.arrmage.LibraryScanner;
class FlickrSyncr{

	public static function main(){

		trace("Hello");
		Database.init();
		Library.init();
		if(Library.isNew){
			Sys.print("Looks like this is the first time running. Which folder would you like to watch?");
			var n=Sys.stdin();
			Library.setPath(n.readLine());
			Sys.print("ok, watching "+Library.getPath());
		}
		Sys.print("Starting scan of "+Library.getPath());
		var scanner = new LibraryScanner();
		scanner.scan(Library.getPath());
		var hasher = new LibraryHasher();
		hasher.hashLibrary();

	}

}