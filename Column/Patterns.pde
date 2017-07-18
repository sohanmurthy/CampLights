class Runway extends LXPattern {
  
//private final float tight = 5;
//private final float speed = 4800;

private final SinLFO tight = new SinLFO(4,8, 13000);
private final SinLFO speed = new SinLFO(4800, 7800, 10000);
private final SawLFO move = new SawLFO(TWO_PI, 0, speed);

 
  Runway(LX lx) {
    super(lx);
    addModulator(tight).start();
    addModulator(speed).start();
    addModulator(move).start();

  }
  
  public void run(double deltaMs) {
    for (LXPoint p : model.points) {
   
      //bars
      float dz = (abs(p.z - model.zMin)) / model.zRange;
      
      
      //float dx = (dist(p.x, p.z, model.cx, model.cz)) / model.zRange;
     
      //"+" or "-" before move function changes direction
      float b = 50 + 50 * sin(dz * tight.getValuef() + move.getValuef());
      
      
      colors[p.index] = LXColor.hsb(
      (lx.getBaseHuef() + (p.z / model.zRange) * 90) % 360,      
      100,
      b);

    }
    lx.cycleBaseHue(3*MINUTES);
  }
}


class BistroLights extends LXPattern {
  class BistroLight extends LXLayer {
    
    
    //wave vertical o
    final private SinLFO rate1 = new SinLFO(210000*2, 330000*2, 17000);
    final private SinLFO off1 = new SinLFO(-4*TWO_PI, 4*TWO_PI, rate1);
    final private SinLFO wth1 = new SinLFO(7*2, 12*2, 17000);

    final private SinLFO rate2 = new SinLFO(180000*2, 360000*2, 17000);
    final private SinLFO off2 = new SinLFO(-4*TWO_PI, 4*TWO_PI, rate2);
    final private SinLFO wth2 = new SinLFO(8*2, 25*2, 21000);

    final private SinLFO rate3 = new SinLFO(160000, 300000, 15000);
    final private SinLFO off3 = new SinLFO(-4*TWO_PI, 4*TWO_PI, rate3);
    final private SinLFO wth3 = new SinLFO(70*2, 140*2, 24000);

    final private float hOffset;

    BistroLight(LX lx, int i) {
      super(lx);
      hOffset = i*120;
      addModulator(rate1.randomBasis()).start();
      addModulator(rate2.randomBasis()).start();
      addModulator(rate3.randomBasis()).start();
      addModulator(off1.randomBasis()).start();
      addModulator(off2.randomBasis()).start();
      addModulator(off3.randomBasis()).start();
      addModulator(wth1.randomBasis()).start();
      addModulator(wth2.randomBasis()).start();
      addModulator(wth3.randomBasis()).start();
    }

    public void run(double deltaMs) {
      for (LXPoint p : model.points) {
        
        float vy1 = model.yRange/3 * sin(off1.getValuef() + (p.x - model.cx) / wth1.getValuef());
        float vy2 = model.yRange/3 * sin(off2.getValuef() + (p.x - model.cx) / wth2.getValuef());
        float vy = model.ay + vy1 + vy2;
        
        float thickness = 5 + ( 3 * sin(off3.getValuef() + (p.z - model.cz) / wth3.getValuef()));
        
        addColor(p.index, LXColor.hsb(
        
          (lx.getBaseHuef() + hOffset + dist(p.x, p.z, model.ax, model.az) /model.zRange * 360) % 360, 
          100, 
          max(0, 100 - (100/thickness)*abs(p.y - vy))
          ));
      }
    }
  }

  BistroLights(LX lx) {
    super(lx);
    for (int i = 0; i < 2; ++i) {
      addLayer(new BistroLight(lx, i));
    }
  }

  public void run(double deltaMs) {
    setColors(#000000);
  }
}