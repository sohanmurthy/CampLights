/********************************************************

Camping is more fun with funky lights

*********************************************************/

import ddf.minim.*;

final static int INCHES = 1;
final static int FEET = 12*INCHES;
final static int SECONDS = 1000;
final static int MINUTES = 60*SECONDS;

Model model;
P3LX lx;
LXOutput output;
UI3dComponent pointCloud;


void setup() {
  
  // Create the model, which describes where the light points are
  model = new Model();
 
  
  // Create the P3LX engine
  lx = new P3LX(this, model);
  
  // Set the patterns
  lx.setPatterns(new LXPattern[] {
    
    new BistroLights(lx),
    new ColorWaves(lx),
    new Noise(lx),
    
  });
  
  //Sets the transition type 
  final LXTransition multiply = new MultiplyTransition(lx).setDuration(15*SECONDS);
  
  for (LXPattern p : lx.getPatterns()) {
    p.setTransition(multiply);
  }
  
  //Auto transitions patterns after a set period of time
  lx.enableAutoTransition(10*MINUTES);
  
  //Output to LEDs
  output = buildOutput();
  
  // Adds UI elements -- COMMENT all of this out if running on Linux in a headless environment
  size(800, 600, P3D);
  lx.ui.addLayer(
    new UI3dContext(lx.ui) 
    .setCenter(model.cx, model.cy-(1*FEET), model.cz)
    .setRadius(18*FEET)
    .setTheta(PI/6)
    .setPhi(PI/90)    
    .addComponent(pointCloud = new UIPointCloud(lx, model).setPointSize(4))
  );
  
  println("Why haven't you memorized the model dimensions yet?");
  println("Ugh. Well, here they are again:");
  println("------------------------------");
  println("Model Height: " + model.yRange / 12 + " feet");
  println("Model Size: "+ model.size + " pixels");
  

}


void draw() {
  background(#292929);
}