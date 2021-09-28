class Cell {
  float i,j;
  color c;
  
  Cell(float i,float j) {
    this.i = i;
    this.j = j;
    c = color(255,0,0);
  }
  
  void show() {
    fill(c);
    stroke(255);
//    noStroke();
    int i_ = round(i);
    int j_ = round(j);
    rect(i_*scale,j_*scale,scale,scale);
  }
  
  void randomize() {
    i = random(cols-1);
    j = random(rows-1);
  }
  
  boolean intersects(Cell other) {
    return round(i)==round(other.i)
        && round(j)==round(other.j);
  }
  
  int boundary(Cell other) {
    if (other.j - j == -1) {
      return 0;
    } else
    if (other.i - i == 1) {
      return 1;
    } else
    if (other.j - j == 1) {
      return 2;
    } else
    if (other.i - i == -1) {
      return 3;
    }
    return -1;
  }
}