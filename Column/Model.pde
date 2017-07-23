//Defines the model

//simple model assuming no gaps between lanterns (beam height is 8 feet 6 inches)
static class Model extends LXModel {
  
  public Model() {
    super(new Fixture());
  }
  
  private static class Fixture extends LXAbstractFixture {
    
    private static final int MATRIX_SIZE_X = 2;
    private static final int MATRIX_SIZE_Y = 50;
    
    private static final float X_SPACING = 15*FEET;
    private static final float Y_SPACING = 2.5*INCHES;
    
    
    private Fixture() {
      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
        for (int y = 0; y < MATRIX_SIZE_Y; ++y) {
            addPoint(new LXPoint(x*X_SPACING, y*Y_SPACING));
        }
      }
    }
  }
}



//complex model to account for gaps in between paper lanterns 
 
//static class Model extends LXModel {
 
//  public final first   p01;
//  public final second  p02;
//  public final third   p03;
//  public final fourth  p04;
//  public final fifth   p05;
//  public final sixth   p06;
//  public final seventh p07;
//  public final eighth  p08;
//  public final ninth   p09;
//  public final tenth   p10;

//  public static final int MATRIX_SIZE_X = 2;
//  public static final int MATRIX_SIZE_Y = 5;
  
//  public static final float X_SPACING = 15*FEET;
//  public static final float Y_SPACING = 2.5*INCHES;
//  public static final float LANTERN_GAP = 0*INCHES;
  
//  public static final float LANTERN_SPACING = (Y_SPACING*(MATRIX_SIZE_Y-1)) + LANTERN_GAP;
  
//    Model() {
//    super(new Fixture());
//    Fixture f = (Fixture) this.fixtures.get(0);
//    this.p01 = f.p01;
//    this.p02 = f.p02;
//    this.p03 = f.p03;
//    this.p04 = f.p04;
//    this.p05 = f.p05;
//    this.p06 = f.p06;
//    this.p07 = f.p07;
//    this.p08 = f.p08;
//    this.p09 = f.p09;
//    this.p10 = f.p10;
    
  
//  }
  
// private static class Fixture extends LXAbstractFixture {
        
//  private final first   p01;
//  private final second  p02;
//  private final third   p03;
//  private final fourth  p04;
//  private final fifth   p05;
//  private final sixth   p06;
//  private final seventh p07;
//  private final eighth  p08;
//  private final ninth   p09;
//  private final tenth   p10;
    
//    Fixture(){
//      addPoints(this.p01 = new first());
//      addPoints(this.p02 = new second());
//      addPoints(this.p03 = new third());
//      addPoints(this.p04 = new fourth());
//      addPoints(this.p05 = new fifth());
//      addPoints(this.p06 = new sixth());
//      addPoints(this.p07 = new seventh());
//      addPoints(this.p08 = new eighth());
//      addPoints(this.p09 = new ninth());
//      addPoints(this.p10 = new tenth());
      
//    }
    
//  }
  
//  static class first extends LXModel {
    
//    first(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING, y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
  
//    static class second extends LXModel {
    
//    second(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*1) + y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
//    static class third extends LXModel {
    
//    third(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*2)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
//   static class fourth extends LXModel {
    
//    fourth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*3)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
//   static class fifth extends LXModel {
    
//    fifth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*4)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
//    static class sixth extends LXModel {
    
//    sixth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*5)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
//  static class seventh extends LXModel {
    
//    seventh(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*6)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
//  static class eighth extends LXModel {
    
//    eighth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*7)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
//    static class ninth extends LXModel {
    
//    ninth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*8)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//  }
  
  
//  static class tenth extends LXModel {
    
//    tenth(){
//     super(new Fixture()); 
//    }
    
//     private static class Fixture extends LXAbstractFixture {
//      Fixture(){
//      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
//        for (int y = 0; y < MATRIX_SIZE_Y; ++y) { 
//          addPoint(new LXPoint(x*X_SPACING,  (LANTERN_SPACING*9)+ y*Y_SPACING));
//              }
//            }
//         }  
//    } 
//   }
    
// }


 