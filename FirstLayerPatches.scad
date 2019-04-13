
// maximum X dimension of the bed, in mm
bedXMax = 250;  
// maximum Y dimension of the bed, in mm
bedYMax = 210;
// bed margins -- no patches in this border area
bedMargin = 10;
// the sides of the square patches, in mm
patchSize = 20;
// the thickness of the patches, in mm --- match your first layer height
patchThickness = 0.2;

module patch(centerX,centerY,patchSize){
    translate([centerX,centerY,0]) square(patchSize,center=true);
}
linear_extrude(patchThickness,center=false) {
for (x=[bedMargin+patchSize/2,bedXMax/2,bedXMax-bedMargin-patchSize/2]) {
    for(y=[bedMargin+patchSize/2,bedYMax/2,bedYMax-bedMargin-patchSize/2]) {
        patch(x, y, patchSize);
    }} // for y, x
}//extrude