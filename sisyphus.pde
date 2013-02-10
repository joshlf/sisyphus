// Copyright 2013 The Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

//Agent agent;
Ground ground;

void setup() {
  size(500, 500);
  ground = new Ground();
//  agent = new Agent(ground);
}

void draw() {
  background(0);
  
  int key = NONE;
  if (keyPressed) {
    if (key == 'a')
      key = LEFT;
    else if (key == 'd')
      key = RIGHT;    
  }
//  agent.Move(key);
  
  ground.Draw();
//  agent.Draw();
}
