// Copyright 2013 The Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class Agent {
 
 private Ground ground;
 private PVector position;
 private PVector velocity;
 
 Agent(Ground ground, int x) {
  this.ground = ground;
  this.position = new PVector(x, ground.Y(x));
  this.velocity = new PVector(0, 0);
 }
 
 public void Draw() {
  fill(255);
  noStroke();
  smooth();
  ellipse(position.x, position.y + 10, 10, 10); 
 }
 
 public void Move(int key) {
   velocity.set(0, 0, 0);
   if (key != NONE) {
     if (key == LEFT) {
       if (position.x > 5) {
          // Don't assign directly so as not to overwrite constant
          velocity.set(unit_left.x, unit_left.y, 0);
       } else {
         println("Hit lefthand wall."); 
       }
     } else if (key == RIGHT) {
       if (width - position.x > 5) {
         // Don't assign directly so as not to overwrite constant
         velocity.set(unit_right.x, unit_right.y, 0);         
       } else {
         println("Hit righthand wall."); 
       }
     } else {
       println("Error: impossible key value: " + key); 
     }
     velocity.y = velocity.x * ground.Slope(int(position.x));
     
     // Make velocity tend slightly towards the ground so that
     // it corrects for accumulated error
     float diff = position.y - ground.Y(int(position.x));
     velocity.y -= (diff / 10);
     
     velocity.normalize();
     position.add(velocity);
   }
 }
}
