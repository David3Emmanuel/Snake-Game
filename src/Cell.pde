class Cell {
  float i,j;
  
  Cell(float i,float j) {
    this.i = i;
    this.j = j;
  }
  
  void show() {
    fill(255,0,0);
    stroke(255);
    int i_ = round(i);
    int j_ = round(j);
    rect(i_*scale,j_*scale,scale,scale);
  }
}