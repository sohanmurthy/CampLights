//Defines the model
 
 
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