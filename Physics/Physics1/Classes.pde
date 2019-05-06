class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  void applyForce(PVector foaaaaaaaaaaAAas    
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
}