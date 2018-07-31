package common.spriterhx.utils;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.FileListEvent;
import flash.filesystem.File;

class FileFinder extends EventDispatcher
{
	public var fileList(getFileList, never) : Array<Dynamic>;

	/**
	 * The filePath of every file found. 
	 */	var _fileList : Array<Dynamic>;
	public function getFileList() : Array<Dynamic>
	{
		return _fileList;
	}

	/**
	* Array of valid fileTypes to be returned;
	*/	public var fileTypes : Array<Dynamic>;
	var directoryList : Array<Dynamic>;
	var currentFolder : File;
	var startTime : Int;
	var dirCount : Int;
	var rootCount : Int;
	public function new()
	{
		fileTypes = ["png", "jpeg", "gif", "bmp", "jpg"];
		directoryList = [];
		dirCount = 0;
		rootCount = 0;
	}

	public function run(directoryList : Array<Dynamic> = null) : Void
	{
		if (directoryList != null) 
		{
			_fileList = [];
			this.directoryList = directoryList.concat();
			directoryList = this.directoryList;
			//Trim child directories, keep only the roots:
			var indexOf : Int;
			var matchCount : Int;
			dirCount = directoryList.length;
			directoryList.sort();
			var i : Int = 0;
			while (i < directoryList.length)
			{
				var j : Int = directoryList.length - 1;
				while (j >= 0)
				{
					if (directoryList[j].indexOf(directoryList[i]) != -1 && j != i) 
					{
						directoryList.splice(j, 1);
					}
					j--;
				}
				i++;
			}
			dirCount = directoryList.length;
			rootCount = directoryList.length;
			startTime = Math.round(haxe.Timer.getStamp() / 1000)();
			trace("[FileFinder] Begin directory search...", directoryList[0]);
		}
		if (this.directoryList.length == 0) 
		{
			trace("[FileFinder] Search Complete -- Directories Searched: ", dirCount, ", Files Found:", fileList.length, ", Elapsed Time: ", (Math.round(haxe.Timer.getStamp() / 1000)() - startTime) / 1000, "seconds");
			dispatchEvent(new Event(Event.COMPLETE));
			return;
		}
		var file : File = new File(this.directoryList.shift());
		getFileListing(file.url);
	}

	function getFileListing(folder : String) : Void
	{
		//the current folder object
		
		{
			currentFolder = new File(folder);
			//Skip hidden files / directories
			if (currentFolder.isHidden && currentFolder.parent != null) 
			{
				run();
				return;
			}
			//the current folder's file listing
			currentFolder.getDirectoryListingAsync();
			currentFolder.addEventListener(FileListEvent.DIRECTORY_LISTING, onDirectoryListing);
		}

	}

	function onDirectoryListing(event : FileListEvent) : Void
	{
		var files : Array<Dynamic> = event.files;
		var l : Int = files.length;
		//iterate and put files in the result and process the sub folders recursively
		var i : Int = 0;
		while (i < l)
		{
			var file : File = Std.is(files[i], File);
			if (file.isDirectory) 
			{
				if (file.name != "." && file.name != "..") 
					//it's a directory
				
				{
					directoryList.push(files[i].url);
					dirCount++;
					trace(files[i].url);
				}
;
			}

			else //it's a file
			
			{
				if (file.extension && fileTypes.indexOf(file.extension.toLowerCase()) != -1) 
				{
					fileList.push(file.url);
				}
			}

			i++;
		}
		currentFolder.removeEventListener(FileListEvent.DIRECTORY_LISTING, onDirectoryListing);
		run();
	}

	public function destroy() : Void
	{
		_fileList = null;
		directoryList = null;
		currentFolder = null;
	}

}

