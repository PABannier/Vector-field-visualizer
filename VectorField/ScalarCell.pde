float MAX_CIRCLE;

class ScalarCell {
  
  PVector location;
  float div, curl;
  float div_color, curl_color;
  float circle_size;
  
  ScalarCell(float _i, float _j) {
    
    float x = (_i + 0.5) * ARROW_LENGTH;
    float y = (_j + 0.5) * ARROW_LENGTH;
    
    location = new PVector(x, y);
    div = compute_div(location);
    curl = compute_curl(location);
        
  }
  
  void display_div() {
    div_color = map(div, 0, MAX_DIV, 0, 180);
    circle_size = map(div, 0, MAX_DIV, 0, 20);
    noStroke();
    fill(div_color, 255, 255, 80);
    ellipse(location.x, location.y, circle_size, circle_size);
    
  }
  
  void display_curl() {
    curl_color = map(curl, 0, MAX_CURL, 0, 180);    
    circle_size = map(curl, 0, MAX_CURL, 0, 20);
    noStroke();
    fill(curl_color, 255,  255, 80);
    ellipse(location.x, location.y, circle_size, circle_size);
  }
  
}
