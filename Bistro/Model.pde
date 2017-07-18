//Defines the model
 
 
static class Model extends LXModel {
  
  public Model() {
    super(new Fixture());
  }
  
  private static class Fixture extends LXAbstractFixture {
    
    private static final int MATRIX_SIZE_X = 2;
    private static final int MATRIX_SIZE_Y = 5;
    private static final int MATRIX_SIZE_Z = 10;
    private static final float X_SPACING = 25*FEET;
    private static final float Y_SPACING = 2.5*INCHES;
    private static final float Z_SPACING = 8*FEET;
    
    
    private Fixture() {
      for (int x = 0; x < MATRIX_SIZE_X; ++x) {
        for (int y = 0; y < MATRIX_SIZE_Y; ++y) {
          for (int z = 0; z < MATRIX_SIZE_Z;++z){
            addPoint(new LXPoint(x*X_SPACING, y*Y_SPACING, z*Z_SPACING));
          }
        }
      }
    }
  }
}