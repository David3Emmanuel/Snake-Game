class Snake {
  ArrayList<Cell> body;
  int xdir, ydir;
  boolean grow;

  Snake(int i, int j) {
    body = new ArrayList<Cell>();
    body.add(new Cell(i, j));
    xdir = 1;
    ydir = 0;
    grow = false;
  }

  void update() {
//    println(body.size());
    //    float r = random(1);
    //    xdir = r<0.5?0:1;
    //    ydir = r<0.5?1:0;
    Cell head = head();
    boolean gameOver = (
      (head.i <= 0 && xdir == -1) ||
      (head.i >= cols-1 && xdir == 1) ||
      (head.j <= 0 && ydir == -1) ||
      (head.j >= rows-1 && ydir == 1)
      );
    if (!gameOver) {
      if (grow) {
        grow = false;
        show();
      } else {
        body.remove(body.size()-1);
      }
      float i = head.i + xdir;
      float j = head.j + ydir;
      body.add(0, new Cell(i, j));
    }
  }

  void show() {
    fill(255,0,0);
    stroke(255);
//    noStroke();
    for (int index=0;index<body.size();index++) {
      Cell current = body.get(index);
      rect(current.i*scale+1,current.j*scale+1,scale-1,scale-1);
      
      boolean[] walls = {true,true,true,true};
      
      if (index > 0) {
        Cell prev = body.get(index-1);
        if (!current.intersects(prev)) {
        walls[current.boundary(prev)] = false;
        }
      }
      if (index < body.size()-1) {
        Cell next = body.get(index+1);
        if (!current.intersects(next)) {
        walls[current.boundary(next)] = false;
        }
      }
      
      float i = current.i;
      float j = current.j;
      println(walls);
      if (walls[0]) {
        line(i*scale,j*scale,(i+1)*scale,j*scale);
      }
      if (walls[1]) {
        line((i+1)*scale,j*scale,(i+1)*scale,(j+1)*scale);
      }
      if (walls[2]) {
        line((i+1)*scale,(j+1)*scale,i*scale,(j+1)*scale);
      }
      if (walls[3]) {
        line(i*scale,(j+1)*scale,i*scale,j*scale);
      }
    }
  }
  
  Cell head() {
    return body.get(0);
  }
  
  Cell tail() {
    return body.get(body.size()-1);
  }
}
