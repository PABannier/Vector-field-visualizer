float EPS = 0.0001;

PVector compute_gradient(PVector vec) {
  
  PVector v = vec.copy();
  v.x += EPS;
  v.y += EPS;
  
  PVector grad = (vector_field(v).sub(vector_field(vec))).div(EPS);
  return grad;
}

float compute_div(PVector x) {
  PVector grad = compute_gradient(x);
  return grad.dot(x);
}

float compute_curl(PVector x) {
  PVector grad = compute_gradient(x);
  PVector curl = grad.cross(x);
  return curl.z;
}
