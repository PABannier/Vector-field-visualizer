import controlP5.*;

int MAX_X = 3;
int MIN_X = -MAX_X;

int MAX_Y = MAX_X;
int MIN_Y = MIN_X;

int ARROW_LENGTH = 25;
float MAX_MAGNITUDE = 1;

float MAX_DIV = 1;
float MAX_CURL = 1;

int ROWS, COLS;

boolean grid = false;
boolean particle = true;

ControlP5 cp5;

Arrow[][] arrows;
ScalarCell[][] scalar_cells;

void setup() {
  size(800, 800);
  colorMode(HSB);
  
  cp5 = new ControlP5(this);
  
  cp5.begin();
  
  cp5.addToggle("particle")
     .setPosition(10, 10)
     .setSize(80, 20)
     .setMode(Toggle.SWITCH)
     ;
     
  cp5.end();
  
  ROWS = floor(width / ARROW_LENGTH);
  COLS = floor(height / ARROW_LENGTH);
  
  arrows = new Arrow[ROWS][COLS];
  scalar_cells = new ScalarCell[ROWS][COLS];
  
  // Setup arrows
  for(int i = 0; i < ROWS; i++) {
    for(int j = 0; j < COLS; j++) {
      arrows[i][j] = new Arrow(i, j);
      scalar_cells[i][j] = new ScalarCell(i, j);
      
      if(MAX_MAGNITUDE < arrows[i][j].magnitude) {
        MAX_MAGNITUDE = arrows[i][j].magnitude;
      }
      
      if(MAX_CURL < scalar_cells[i][j].curl) {
        MAX_CURL = scalar_cells[i][j].curl;
      }
      
      if(MAX_DIV < scalar_cells[i][j].div) {
        MAX_DIV = scalar_cells[i][j].div;
      }
      
    }
  }
  
}

void draw() {
  background(0);
  translate(5, 5);
  
  // Display arrow and particle
  for(int i = 0; i < ROWS; i++) {
    for(int j = 0; j < COLS; j++) {
      arrows[i][j].display();
      
      if(particle == true) {
        arrows[i][j].show_particle();
      }
      
      //scalar_cells[i][j].display_div();
      //scalar_cells[i][j].display_curl();
    }
  }
  
  display_panel();
}

PVector vector_field(PVector vec)  {
  float x = map(vec.x, 0, width, MIN_X, MAX_X);
  float y = map(vec.y, 0, height, MIN_Y, MAX_Y);
  return new PVector(sin(y), cos(x));
}

void display_panel() {
  
  PVector location = new PVector(mouseX, mouseY);
  float div = compute_div(location);
  float curl = compute_curl(location);
  
  String div_text = "Div: " + div;
  String curl_text = "Curl: " + curl;
  
  push();
  stroke(0, 0, 100);
  strokeWeight(2);
  fill(0, 0, 0, 130);
  rect(mouseX-105, mouseY-62, 210, 35);
  fill(255);
  text(div_text, mouseX-100, mouseY-40);
  text(curl_text, mouseX, mouseY-40);
  pop();
}
