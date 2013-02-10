class Ground {
 
// private int h;
 private float[] heights;
 private float[] slopes; 
  
 Ground() {
   heights = new float[width];
   slopes = new float[width];
   
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
   rectMode(CORNER);
   for (int i = 0; i < heights.length; i++) {  
     line(i, int(height - heights[i]), i, height);
   }
 }
 
}
