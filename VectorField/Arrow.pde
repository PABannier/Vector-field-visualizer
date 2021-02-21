class Arrow {
  
  PVector location, vec;
  float magnitude, theta;
  color arrow_color;
  
  Particle particle;
  
  Arrow(int _i, int _j) {
    float x = (_i + 0.5) * ARROW_LENGTH;
    float y = (_j + 0.5) * ARROW_LENGTH;
    
    location = new PVector(x, y);
    vec = vector_field(location);
    
    magnitude = vec.mag();
    theta = vec.heading();
    
    float hue = map(magnitude, 0, MAX_MAGNITUDE, 0, 180);
    arrow_color = color(hue, 255, 255);
    
    particle = new Particle(location.x, location.y);
  }
  
  void display() {
    
    if(magnitude != 0) {
    
      float r = 8;
      
      float a = radians(150);
      float x1 = r * cos(a);
      float y1 = r * sin(a);
      float buffer = 3;
      
      
      push();
      translate(location.x, location.y);
      rotate(theta);
      
      stroke(arrow_color);
      strokeWeight(2);
      line(-ARROW_LENGTH/2+buffer, 0, ARROW_LENGTH/2-buffer, 0);
      
      translate(ARROW_LENGTH/2-buffer, 0);
      
      fill(arrow_color);
      beginShape();
      vertex(x1, y1);
      vertex(x1, -y1);
      vertex(0, 0);
      endShape();
      
      pop();
    }
    
  }
  
  void show_particle() {
    particle.update();
    particle.display();
  }
  
}
