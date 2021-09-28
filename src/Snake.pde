class Snake {
  ArrayList<Cell> body;
  int xdir, ydir;
  float speed;

  Snake(int i, int j) {
    body = new ArrayList<Cell>();
    body.add(new Cell(i, j));
    xdir = 1;
    ydir = 0;
    speed = 0.05;
    body.add(new Cell(i-xdir, j-ydir));
  }

  void update() {
    //    float r = random(1);
    //    xdir = r<0.5?0:1;
    //    ydir = r<0.5?1:0;
    Cell head = body.get(0);
    boolean gameOver = (
      (head.i <= 0 && xdir == -1) ||
      (head.i >= cols-1 && xdir == 1) ||
      (head.j <= 0 && ydir == -1) ||
      (head.j >= rows-1 && ydir == 1)
      );
    println(head.i,xdir);
    if (!gameOver) {
      body.remove(body.size()-1);
      float i = head.i + xdir*speed;
      float j = head.j + ydir*speed;
      body.add(0, new Cell(i, j));
    }
  }

  void show() {
    for (Cell c : body) {
      c.show();
    }
  }
}
