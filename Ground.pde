class Ground {
 
 private int h;
  
 Ground() {
   this.h = height/2;
 }
  
 public double Slope(int x) {
  return 0; 
 }
 
 public int Y(int x) {
  return height - this.h; 
 }
 
 public void Draw() {
   fill(255);
   rectMode(CORNER);
   rect(-1, height - this.h, width + 1, this.h);
 }
 
}
