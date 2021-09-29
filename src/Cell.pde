class Cell {
  float i,j;
  color c;
  boolean isSnakeBody;
  
  Cell(float i,float j) {
    this.i = i;
    this.j = j;
    c = color(255,0,0);
    isSnakeBody = true;
  }
  
  void show() {
    fill(c);
//    noStroke();
    if (isSnakeBody) {
      rect(i*scale,j*scale,scale,scale);
    } else {
      ellipse(i*scale+scale/2,j*scale+scale/2,scale,scale);
    }
  }
  
  void randomize() {
    i = round(random(cols-1));
    j = round(random(rows-1));
  }
  
  boolean intersects(Cell other) {
    return round(i)==round(other.i)
        && round(j)==round(other.j);
  }
  
  int boundary(Cell other) {
    if (round(other.j) - round(j) == -1) {
      return 0;
    } else
    if (round(other.i) - round(i) == 1) {
      return 1;
    } else
    if (round(other.j) - round(j) == 1) {
      return 2;
    } else
    if (round(other.i) - round(i) == -1) {
      return 3;
    }
    return -1;
  }
}