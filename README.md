# udacity_sensor_fusion_radar_project
Udacity Sensor Fusion Radar Project Work. 

## Implementation steps for the 2D CFAR process:
	- Select Training Cell Number, including both direction: Tr & Td
	- Select Guard Cell Number, including both direction: Gr & Gd
	- Select Offset value of the threshold by SNR value in dB
	- Loop the whole RDM's each CUT
	  %note: be careful of index beyond the matrix boundary
		for each CUT:
		    find all the training cell of this CUT.Total size: (2Tr+2Gr+1)(2Td+2Gd+1) - (2Gr+1)(2Gd+1).
				for each training cell
				    use db2pow to get the training cell value.
				sum all the training cell value, get the mean value.
				use pow2db to transfer the mean value back to frequency, get basic threshold value.
				add the offset to the threshold, get the CFAR threshold of this CUT.
				compare the CUT to the threshold,
				    if CUT < threshold
						    Result of this CUT =0
						else
						    Result of this CUT =1
				
## Selection of Training, Guard cells and offset.
#### Training Cell
Training Cell is used for noise estimation. The number of training cells should be decided based on the environment. If a dense traffic scenario then the fewer training cells should be used, as closely spaced targets can impact the noise estimate. 
#### Guard Cell 
Guard Cell is used for prevent the impact of the target signal on noise estimate. So the guard cell number should depend on the level of target signal. If the signal strength is high, we need more guard cells. 
#### Offset value 
Offset value is used for scale the noise threshold. If the signal strength is defined in logarithmic form then add this offset value to the average noise estimate, else multiply it. 

## Steps taken to suppress the non-thresholded cells at the edges.
To keep the map size same as it was before CFAR, equate all the non-thresholded cells to 0. 
