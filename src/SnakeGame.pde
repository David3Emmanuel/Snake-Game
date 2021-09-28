int rows = 10;
int cols = 10;
int delay = 30;
float scale;

Snake snake;
Cell food;

void setup() {
  size(700, 700);
  float scaleX = width/rows;
  float scaleY = height/cols;
  scale = min(scaleX, scaleY);

  //  int startX = floor(cols/2);
  //  int startY = floor(rows/2);
  snake = new Snake(0, 0);
  food = new Cell(cols/2, rows/2);
  food.c = color(0, 255, 0);
}

void draw() {
  if (frameCount % delay == 0) {
    background(0);
    snake.update();
    if (food.intersects(snake.head())) {
      snake.grow = true;
      food.randomize();
    }
//    drawGrid();
    snake.show();
    food.show();
  }
}

void drawGrid() {
  strokeWeight(1);
  stroke(255);
  noFill();
  for (int i=0; i<cols; i++) {
    for (int j=0; j<rows; j++) {
      rect(i*scale, j*scale, scale, scale);
    }
  }
}

PVector pmouse;

void touchStarted() {
  pmouse = new PVector(mouseX, mouseY);
}

void touchEnded() {
  PVector mouse = new PVector(mouseX, mouseY);
  mouse.sub(pmouse);
  int angle = round(mouse.heading()/HALF_PI);
  switch (angle) {
  case -1:
    snake.xdir = 0;
    snake.ydir = -1;
    break;
  case 0:
    snake.xdir = 1;
    snake.ydir = 0;
    break;
  case 1:
    snake.xdir = 0;
    snake.ydir = 1;
    break;
  case -2:
    snake.xdir = -1;
    snake.ydir = 0;
    break;
  }
}
