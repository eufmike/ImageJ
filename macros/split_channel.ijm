dir = getDirectory("Choose a Directory");
list = getFileList(dir);
newdir = getDirectory("Choose a Directory");

for (i=0; i<list.length; i++) {
      open(dir + list[i]);
      imgName=getTitle(); 
      baseNameEnd=indexOf(imgName, ".tif"); 
      baseName=substring(imgName, 0, baseNameEnd); 
      
      run("Split Channels"); 
      run("Make Substack...", "channels=2 slices=2");
      saveAs("Tiff", newdir+baseName + ".tif");

      run("Close All"); 
   }