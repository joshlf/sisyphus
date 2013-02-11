class Agent {
 
 private Ground ground;
 private PVector position;
 private PVector velocity;
 
 Agent(Ground ground, int x) {
  this.ground = ground;
  this.position = new PVector(x, height - ground.Y(x));
  this.velocity = new PVector(0, 0);
 }
 
 public void Draw() {
  fill(255);
  ellipse(position.x, position.y - 10, 10, 10); 
 }
 
 public void Move(int key) {
   velocity.set(0, 0, 0);
   if (key != NONE) {
     if (key == LEFT) {
       System.out.println("Moving left");
       // Don't assign directly so as not to overwrite constant
       velocity.set(unit_left.x, unit_left.y, 0);
     } else if (key == RIGHT) {
       System.out.println("Moving right");
       velocity.set(unit_right.x, unit_right.y, 0);
     } else {
       System.out.println("Error: impossible key value: " + key); 
     }
//     float slope = ground.Slope(int(position.x));
//     println(slope);
     velocity.y = velocity.x * -1 *  ground.Slope(int(position.x));
     velocity.normalize();
     position.add(velocity);
//     position.y = height - ground.Y(int(position.x));
//     println(position + ",  " + velocity);
   }
   
   //   position.y = height - ground.Y(int(position.x));
 }
}
