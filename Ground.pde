// Copyright 2013 The Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class Ground {
  
 private float[] heights;
 private float[] slopes; 
  
 Ground() {
   heights = new float[width];
   slopes = new float[width];
   
   /*
     Randomize ground by starting at a fixed
     position and then randomizing the second
     derivative once per pixel along the x axis
   */
   float start = 250;
   float dy = 0;
   float ddy = random(-1, 1);
   heights[0] = start;
   slopes[0] = dy;
   dy += ddy;
   float diff;
   
   for (int i = 1; i < width; i++) {
     heights[i] = heights[i - 1] + dy;
     slopes[i] = dy;
     
     // The randomization is weighted towards
     // the starting point so that ground
     // is reasonable (without this, wild
     // spikes and troughs are frequent)
     diff = heights[i] - heights[0];
     ddy = random(-diff/100, diff/100);
     
     dy += ddy;
   }
 }
  
 public float Slope(int x) {
   return slopes[x];
 }
 
 public float Y(int x) {
   return heights[x]; 
 }
 
 public void Draw() {
   fill(255);
   stroke(255);
   line(0,250,500,250);
   for (int i = 0; i+1 < heights.length; i++) {
       noStroke();
       fill(255);  
       ellipse(i, heights[i], 2, 2);
//       fill(255, 0, 0);
       stroke(255, 0, 0);
       line(i, 250 - (slopes[i] * 10), i, 250 - (slopes[i + 1] * 10));
//       ellipse(i, 250 - (slopes[i] * 10), 2, 2);
//     line(i, 0, i, heights[i]);
   }
 }
 
}
