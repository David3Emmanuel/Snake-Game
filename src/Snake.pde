class Snake {
  ArrayList<Cell> body;
  int xdir, ydir;
  float speed;
  boolean grow;

  Snake(float i, float j, int size) {
    body = new ArrayList<Cell>();
    body.add(new Cell(i, j));
    xdir = 1;
    ydir = 0;
    grow = true;
    for (int s=0;s<size;s++) {
      update();
      grow = true;
    }
    grow = false;
  }

  void update() {
//    println(body.size());
    //    float r = random(1);
    //    xdir = r<0.5?0:1;
    //    ydir = r<0.5?1:0;
    Cell head = head();
    Cell newHead = new Cell(head.i+xdir,head.j+ydir);
    
    boolean gameOver = (newHead.i < 0 ||
                        newHead.i > cols-1 ||
                        newHead.j < 0 ||
                        newHead.j > rows-1);
    if (!gameOver) {
      for (int index=1;index<body.size();index++) {
        if (body.get(index).intersects(newHead)) {
          gameOver = true;
          break;
        }
      }
    }
    
    if (!gameOver) {
      if (grow) {
//        println("Grow");
        grow = false;
      } else {
        body.remove(body.size()-1);
      }
      
      body.add(0, newHead);
//      for (Cell c : body) {
//        c.c =color(255,0,0);
//      }
//      head().c = color(255,255,0);
      show();
    }
  }
  
  void changeDir(int newXdir, int newYdir) {
    if (newXdir != -xdir &&
        newYdir != -ydir) {
      xdir = newXdir;
      ydir = newYdir;
    }
  }

  void show() {
    fill(255,0,0);
    
    for (int index=0;index<body.size();index++) {
      Cell current = body.get(index);
      noStroke();
//      ;
      current.show();
      
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
//      println("\n");
//      println(walls);
      stroke(255);
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
    fill(255,255,0);
    rect(head().i*scale+scale/3,head().j*scale+scale/3,scale/3,scale/3);
  }
  
  Cell head() {
    return body.get(0);
  }
  
  Cell tail() {
    return body.get(body.size()-1);
  }
}
