int PARTICLE_LIFETIME = 5;

class Particle {
  PVector location, velocity;
  float lifetime;
  
  Particle(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0, 0);
    lifetime = 1;
  }
  
  void update() {
    lifetime++;
    
    velocity = vector_field(location);
    location.add(velocity);
    velocity.mult(0);
    
  }
  
  void display() {
    
            
      float alpha = map(lifetime, 0, PARTICLE_LIFETIME, 255, 0);
      stroke(255, 255, 255, 255);
      strokeWeight(1);
      ellipse(location.x, location.y, 5, 5);
      
      
    
  }
  
}
