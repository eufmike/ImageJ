// Adapted from the 'basicMetadata.txt' file downloaded from Bio-Formats website
// Written by Chien-cheng Shih
// Date: 01-30-2018

// Uses Bio-Formats to extract 6D dimensions from Nikon ND2 file

run("Bio-Formats Macro Extensions");

// Gets input filename
filedir = File.openDialog("Choose the input file");
print("Image path: " + filedir);

// Extracts filename
name = File.getName(filedir);
baseNameEnd=indexOf(name, "."); 
baseName=substring(name, 0, baseNameEnd); 

// Gets output foldername
outputdir = getDirectory("Choose the output folder");
print("Output path: " + outputdir);

// Extract Series counts
Ext.setId(filedir);
Ext.getSeriesCount(seriesCount);
print("Sereis count: " + seriesCount);

// Batch saving
setBatchMode(true);
for(s = 0; s < seriesCount; s++){
	series = s + 1;
	print("Sereis #" + series);
	showProgress(s, seriesCount);	
	run("Bio-Formats Importer", 
	"open=[" + filedir + 
	"] color_mode=Composite rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT series_"+ series);
	
	saveAs("Tiff", outputdir + baseName + 'series_' + series + '.tif');
	run("Close All");
}
setBatchMode(false);
Ext.close();

//clear results (log window)
print("\\Clear");