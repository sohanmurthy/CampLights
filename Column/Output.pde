//Connects to local Fadecandy server and maps P3LX points to physical pixels 

FadecandyOutput buildOutput() {
  FadecandyOutput output = null;
  int[] pointIndices = buildPoints();
  output = new FadecandyOutput(lx, "127.0.0.1", 7890, pointIndices);
  
  lx.addOutput(output);
  return output;
}

//Function that maps point indices to pixels on led strips
int[] buildPoints() {
  int pointIndices[] = new int[100];
 
 //TODO: LOOP OR MANUAL REMAPPING GOES HERE
 
  return pointIndices; 
}