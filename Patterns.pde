class Noise extends LXPattern {
  
  private float accum = 0; 
  final float spd = 0.4;
  final float scale = 0.285;
  
  private final SinLFO sync = new SinLFO(18*SECONDS, 29*SECONDS, 47*SECONDS);
  private final SinLFO range = new SinLFO(100,200, sync.getValuef());
  private final SinLFO hueCenter = new SinLFO(model.xMax/3, model.xMax*.667, sync.getValuef()*1.61);
  
  
  Noise(LX lx) {
    super(lx);
    addModulator(hueCenter.randomBasis()).start();
    addModulator(sync.randomBasis()).start();
    addModulator(range.randomBasis()).start();
  }
  
  public void run(double deltaMs) {
    accum += deltaMs/1000. * spd;
    float sv = scale;
    float sat = scale/2;
    for (LXPoint p : model.points) {
      colors[p.index] = LXColor.hsb(
      //(lx.getBaseHuef() + (p.y / model.yRange) * 90) % 360,
      (lx.getBaseHuef() + (abs(p.y - model.yMax) / model.yRange) * 120 - (abs(p.x - hueCenter.getValuef()) / model.xRange) * 120) % 360,
      constrain(50 + range.getValuef()*(-1 + 2*noise(sat*p.x, sat*p.y, accum)), 0, 100),
      constrain(50 + range.getValuef()*(-1 + 2*noise(sv*p.x, sv*p.y, accum)), 0, 100)
      );
    }
    lx.cycleBaseHue(5*MINUTES);
  }
}

class Waves extends LXPattern{

    private final SinLFO sync = new SinLFO(15*SECONDS, 20*SECONDS, 1.61*MINUTES);
    
    private final SinLFO speed = new SinLFO(10000, 12000, sync);    
    private final SinLFO tight = new SinLFO(7,10, sync);
    private final SinLFO hr = new SinLFO(30, 180, sync);
    
    private final SawLFO move = new SawLFO(TWO_PI, 0, speed);
  
    Waves(LX lx){
    super(lx);
    addModulator(sync.randomBasis()).start();
    addModulator(speed.randomBasis()).start();
    addModulator(tight.randomBasis()).start();
    addModulator(hr.randomBasis()).start();
    addModulator(move.randomBasis()).start();
    }
    
    
    public void run(double deltaMs){
      for (LXPoint p : model.points) {
        
        float dx = (abs(p.x - model.xMax) + 0.1 * abs(p.y - model.yMin)) / model.xRange;
        float b = 50 + 50 * sin(dx * tight.getValuef() + move.getValuef());
         colors[p.index]= LXColor.hsb(
         //lx.getBaseHuef() + hOffset,
         (lx.getBaseHuef() + (dist(p.x, p.y, model.xMax, model.yMin) / model.yRange) * hr.getValuef()) % 360,
         45,
         b
         );
      }
    }
  
  

}


class BistroLights extends LXPattern{
  
  class BistroLight extends LXLayer {
    
    private final SinLFO sync = new SinLFO(6*SECONDS, 18*SECONDS, 38*SECONDS);
    private final SinLFO bright = new SinLFO(0,100, sync);
    private final SinLFO sat = new SinLFO(35,100, sync);
    
    private int sPixel;
    private int fPixel;
    private float hOffset;
      
    BistroLight(LX lx, int s, int f, float o){
      super(lx);
      sPixel = s;
      fPixel = f;
      hOffset = o;
      addModulator(sync.randomBasis()).start();
      addModulator(bright.randomBasis()).start();
      addModulator(sat.randomBasis()).start();
    }
    
    public void run(double deltaMs) {
      float s = sat.getValuef();
      float b = bright.getValuef();
      
      for(int i = sPixel; i < fPixel; i++){
        blendColor(i, LXColor.hsb(
          lx.getBaseHuef() + hOffset,
          s,
          b
          ), LXColor.Blend.LIGHTEST);
        }
    }    
    
  }
  
  BistroLights(LX lx){
   super(lx);
   for(int s = 0; s <= 95; s+=5){
     addLayer(new BistroLight(lx, s, s+5, s*0.805));
   }
  }
  
  public void run(double deltaMs) {
    setColors(#000000);
    lx.cycleBaseHue(3*MINUTES);
  }
  
}