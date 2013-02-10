class Agent {
 
 private Ground ground;
 private PVector position;
 private PVector velocity;
 
 Agent(Ground ground, PVector position) {
  this.ground = ground;
  this.position = position;
 }
 
 public void Draw() {
  fill(255);
  ellipse(position.x, position.y - 10, 10, 10); 
 }
 
 public void Move(int key) {
   if (key != NONE) {
     if (key == LEFT) {
       System.out.println("Moving left");
       position.add(unit_left);
     } else if (key == RIGHT) {
       System.out.println("Moving right");
       position.add(unit_right);
     } else {
       System.out.println("Error: impossible key value: " + key); 
     }
   }
   position.y = height - ground.Y(int(position.x));
 }
}
