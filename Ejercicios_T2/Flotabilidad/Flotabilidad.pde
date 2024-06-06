final boolean FULL_SCREEN = false;
final int DRAW_FREQ = 50;    // Draw frequency (Hz or Frame-per-second)
int DISPLAY_SIZE_X = 1000;   // Display width (pixels)
int DISPLAY_SIZE_Y = 600;    // Display height (pixels)

final float SIM_STEP = 0.06;   // Simulation time-step (s)

final float Gc    = 9.801;  // Gravity constant (m/(s*s))
final PVector G   = new PVector(0.0, Gc);  // Acceleration due to gravity (m/(s*s))

PVector origin;  // Initial position

// Classes:
Ball ball;

void settings()
{
  size(DISPLAY_SIZE_X, DISPLAY_SIZE_Y);
}

void setup()
{
  initSimulation();
}

void initSimulation()
{
  
  origin = new PVector(width/2.0, height/4.0);
  ball = new Ball(origin);
}

void draw() {
  background(255);
  
  ball.run();
  drawStaticEnvironment();
}


void drawStaticEnvironment()
{
  // Agregar el título
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Ejercicio flotabilidad", 50, 25);
  
  fill(0);
  textSize(18);
  text("Pulse 'R' para reiniciar. ", 50, 50);
  
  noStroke();
  fill(0, 196, 255, 100);
  rect(0, height/2, width, height);
}


void keyPressed()
{
  switch(key)
  {  
    case 'r':
    case 'R':
      reset();
    break;
        }
}


void reset()
{
  ball = new Ball(origin);
}
