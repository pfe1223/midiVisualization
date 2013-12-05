import rwmidi.*;
Cell[][] grid;

MidiInput input;
MidiOutput output;

void setup() {
  input = RWMidi.getInputDevices()[0].createInput(this);
  output = RWMidi.getOutputDevices()[0].createOutput();
  size(830,830);
  background(0);
  grid = new Cell[15][15];
  for (int i=0; i< 15; i++){
    for (int j=0; j<15; j++){
      grid[i][j] = new Cell(5+55*i,5+55*j,50,50);
    }
  }
}

void noteOnReceived(Note note) {
  int x = int(random(0,15));
  int y = int(random(0,15));
  println(note.getVelocity() + " " + x + " " + y);
  grid[x][y].midiFill(note.getVelocity());
}

void noteOffReceived(Note note) {
  int x = int(random(0,15));
  int y = int(random(0,15));
  grid[x][y].midiFill(note.getVelocity());
}

void sysexReceived(rwmidi.SysexMessage msg) {
  println("sysex " + msg);
}

void draw() {
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 
  
  void midiFill(int tempColor){
    int realColor = tempColor;
    float r = random(0,2);
    float g = random(0,2);
    float b = random(0,2);
    fill(realColor*r,realColor*g,realColor*b);
    noStroke();
    rect(x,y,w,h);
  }
}


