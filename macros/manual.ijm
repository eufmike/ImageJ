dir = getDirectory("Image files");
list = getFileList(dir);
newdir = getDirectory("Save processed images to...");
result_dir = getDirectory("Save results to...");
File.makeDirectory(newdir + "/manual");

for (i=0; i<list.length; i++){
		
		open(dir + list[i]);
		imgName = getTitle();

		setThreshold(500, 65535); 
		run("Make Binary");

		saveAs("Tiff",  newdir +"/" + "manual" + "/"+ list[i]);
		run("Measure");
		
		selectWindow(imgName); 
		run("Close");
		
		}

		
		selectWindow("Results");
		saveAs("Results", result_dir + "manual.txt"); 

run("Clear Results");
run("Close All"); 
