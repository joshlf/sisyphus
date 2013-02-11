// Copyright 2013 The Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/*
  TODO: 
    - Fix ground generation so it's more reasonable
    - Fix agent going into ground (perhaps expand on the following idea:
        draw the height of the ground for x at (x, heights[x] - abs(slope[x])))
*/

Agent agent;
Ground ground;

void setup() {
  size(500, 500);
  ground = new Ground();
  agent = new Agent(ground, 250);
}

void draw() {
  translate(0, height);
  scale(1, -1);
  background(0);
  
  int k = NONE;
  if (keyPressed) {
    if (key == 'a')
      k = LEFT;
    else if (key == 'd')
      k = RIGHT;    
  }
  agent.Move(k);
  
  ground.Draw();
  agent.Draw();
}
