int rows = 20;
int cols = 20;
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
  snake = new Snake(0, 0, 5);
  food = new Cell(cols/2, rows/2);
  food.c = color(0, 255, 0);
  food.isSnakeBody = false;
}

void draw() {
  if (frameCount % delay == 1) {
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
  float rad = atan2(pmouse.y-mouseY, mouseX-pmouse.x) + PI;
  float angle = (rad*180/PI + 180)%360;
  if (inRange(angle, 45, 135)) {
    snake.changeDir(0,-1);
  } else if (inRange(angle, 0, 45) || inRange(angle, 315, 360)) {
    snake.changeDir(1,0);
  } else if (inRange(angle, 225, 315)) {
    snake.changeDir(0,1);
  } else {
    snake.changeDir(-1,0);
  }
}

boolean inRange(float value, float min, float max) {
  return value>=min && value<=max;
}
