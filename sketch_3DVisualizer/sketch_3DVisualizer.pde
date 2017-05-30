//+-----------------------------------------------
// Visualizar for Processing 
// Author  : @Asteriskx  2017-05-30
// Twitter : @Astrisk_
//+------------------------------------------------

//-------------------------------------------------
// Import
//-------------------------------------------------
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//-------------------------------------------------
// Class
//-------------------------------------------------
Minim       minim;  // Using Minim Library.
FFT         fft;    // Using FFT Library.
AudioPlayer player; // Using Minim Library in AudioPlayer.
Visualizar  visual; // Visualizar Class Instance.

//-------------------------------------------------
// Const Variable
//-------------------------------------------------
public static final int SHOW_VISUAL = 25;  // Show Visualizar bar Values.  
public static final int WID         = 700; // Width
public static final int HEI         = 700; // Height

//-------------------------------------------------
// Settings
//-------------------------------------------------
void settings(){
    size(WID, HEI, P3D);
}

//-------------------------------------------------
// Setup
//-------------------------------------------------
void setup() {
    strokeWeight( 5 );
    frameRate( 60 );
  
    hint( DISABLE_DEPTH_TEST ); // Disabled Z axis.
    blendMode( ADD );           // Add-Mix.
  
    visual = new Visualizar( 360, 100, 80, 100);
    minim  = new Minim( this );
    player = minim.loadFile( "コネクト.mp3", 512 );
    fft    = new FFT( player.bufferSize(), player.sampleRate() );
    
    player.play();// Playing music Files.
    smooth();     // Noise Clear.
}

//-------------------------------------------------
// Draw
//-------------------------------------------------
void draw() {
    background( 10, 20, 60 );
    translate( width / 2, height / 2 );
  
    fft.forward( player.mix );// Running Fast fourier transform.
  
    for( int i = 0; i < SHOW_VISUAL; i++ ) {
        visual.VisualHeight[i] = visual.getHeight( i );  // Take over Height.
        visual.VisualShow[i]   = visual.getColor( i );   // Take over Color.
        visual.paintVisual( i );                         // Drawing Visualizar.
    }
}

//-------------------------------------------------
// Stop
//-------------------------------------------------
void stop() {
    player.close();
    minim.stop();
    super.stop();
}

//-------------------------------------------------
// MousePressed
//-------------------------------------------------
void mousePressed(){
    switch( mouseButton ) {
        case LEFT:   player.pause();  break;
        case RIGHT:  player.play();   break;
        case CENTER: player.rewind(); break;
        default: break;
    }
}