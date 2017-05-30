//+-----------------------------------------------
// Class Neme : Visualizar
// Author  : @Asteriskx  2017-05-30
//+------------------------------------------------
public class Visualizar {
    public int[] VisualHeight = new int [SHOW_VISUAL]; // Show Visualizar Height
    public int[] VisualShow   = new int [SHOW_VISUAL]; // Show Visualizar Color
  
    private int Saturation;                            // Show Visualizar Saturation
    private int Brightness;                            // Show SomeGenerarions Visualizar Brightness
    private int Alpha;                                 // Show SomeGenerarions Visualizar Alpha
    private int VisualWidth          = 12;             // Show Visualizar Width
    private int VisualBegin          = 20;             // Show Visualizar Stating Point
    private int VisualMagnification  =  2;             // Magnification
    private int col                  =  7;             // Color
    
    //-------------------------------------------------
    // Constructor
    // < Argument >
    //     int saturation : Visualizar Saturation
    //     int brightness : Visualizar Brightness
    //     int alpha      : Visualizar Alpha
    //     int height     : Visualizar Height
    //-------------------------------------------------
    private Visualizar( int saturation, int brightness, int alpha, int height ) { 
        Saturation = saturation;                                
        Brightness = brightness;                                 
        Alpha      = alpha;                 
    
        for( int j = 0; j < SHOW_VISUAL; j++ ) {                   
            VisualHeight[j] = height;
        }
    }                                                      
  
    //-------------------------------------------------
    // getHeight
    // < Argument >
    //     int num : Some Generations Visualizar Value.
    //-------------------------------------------------
    public int getHeight( int num ) { 
        map ( num, 0, fft.specSize(), 0, SHOW_VISUAL );
        return ( int( 350 - fft.getBand( num ) * VisualMagnification ) ) ;
    }
  
    //-------------------------------------------------
    // getColor
    // < Argument >
    //     int num : Some Generations Visualizar Value.
    //-------------------------------------------------
    public int getColor( int num ) {
        return ( col * num );
    }
  
    //-------------------------------------------------
    // paintVisual
    // < Argument >
    //     int num : Some Generations Visualizar Value.
    //-------------------------------------------------
    public void paintVisual( int num ) {    
        // Paint
        fill( VisualShow[num], Saturation, Brightness, Alpha );
    
        // Random Line
        for(int i = 0; i < 360; i += 10 ) {
            float angle = radians( i );
            
            // Random Radius
            float radius = fft.getBand( num );
            float x      = radius * cos( angle );
            float y      = radius * sin( angle );
            
            // Center To (x, y) Point.
            stroke(0, 200, 200);
            line(0, 0, x, y);
        }
    
        // Rect（Top Left X Point、Tpo Left Y Point、Rectangle Width、Rectangle Height）；
        rect(  num * VisualBegin, VisualHeight[num], VisualWidth, 500 );
        rect( -num * VisualBegin, VisualHeight[num], VisualWidth, 500 );
    }
}