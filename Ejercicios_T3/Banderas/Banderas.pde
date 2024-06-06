// Camera 3D peasy
import peasy.*;
PeasyCam cam;

Malla m1, m2, m3;

// Structure Types
final int STRUCTURED = 1;
final int BEND = 2;
final int SHEAR = 3;

// Malla size
int pointsX;
int pointsY;

// Simulation values
float SIM_STEP = 0.1;

// Problem parameters
PVector g = new PVector (0,0,0); //gravedad
PVector viento = new PVector (0,0,0); //viento

// Boolean variables
boolean activar_viento = false;
boolean activar_gr = false;

void setup()
{
  System.setProperty("jogl.disable.openglcore", "true");
  size (1200, 900, P3D);
  smooth();
  
  // Camera
  cam = new PeasyCam(this, 500, 0, 0, 650);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(1000);
  
  // Rectangular Mallaes
  pointsX = 70;
  pointsY = 40;
  
  // Creation of the 3 flags
  m1 = new Malla (STRUCTURED, pointsX, pointsY);
  m2 = new Malla (BEND, pointsX, pointsY);
  m3 = new Malla (SHEAR, pointsX, pointsY);
}

void draw()
{
  background(200);
  translate(100, 0, 0);
  
  // viento
  if (activar_viento)
  {
    viento.x = 0.5 - random(10, 40) * 0.1;
    viento.y = 0.1 - random(0, 0.2);
    viento.z = 0.5 + random(10, 60) * 0.1;

  }
  else
  {
    viento.set(0, 0, 0);
  }
  
  // Gravity
  if (activar_gr)
    g.y = 4.9;
  else
    g.y = 0;
  
  // Bandera 1
  line(0, 0, 0, 255);
  color c = color(0, 200, 255);
  m1.update();
  m1.display(c);
  
  // Bandera 2
  color c2 = color(255, 255, 0);
  m2.update();
  pushMatrix();
  translate(300, 0, 0);
  line(0, 0, 0, 255);
  m2.display(c2);
  popMatrix();
  
  // Bandera 3
  color c3 = color(255, 255, 255);
  m3.update();
  pushMatrix();
  translate(600, 0, 0);
  line(0, 0, 0, 255);
  m3.display(c3);
  popMatrix();
  
  drawStaticEnvironment();
}

void drawStaticEnvironment()
{
  //Draw data
  fill (0);
  textSize(22);
  
  text("Ejercicio Tema 3: banderas", -15, -335, 0);
  
  textSize(19);
  text("Pulsa la 'V' para activar o desactivar el viento", -15, -300, 0);
  text("Pulsa la 'G' para activar o desactivar la gravedad",-15, -275, 0);
  
  text("viento: " + activar_viento, 665, -300, 0);
  text("gravedad: " + activar_gr, 650, -275, 0);
    
  text("STRUCTURED", 50, -200, 0);
  text("Constante de elasticidad: " + m1.k, -15, -150, 0);
  text("Constante de amortiguación:" + m1.m_Damping, -15, -130, 0);
  
  text("BEND", 385, -200, 0);
  text("Constante de elasticidad: " + m2.k, 300, -150, 0);
  text("Constante de amortiguación: " + + m2.m_Damping, 300, -130, 0);
  
  text("SHEAR", 680, -200, 0);
  text("Constante de elasticidad: " + m3.k, 600, -150, 0);
  text ("Constante de amortiguación:" + m3.m_Damping, 600, -130, 0);

}

void keyPressed()
{
  if (key == 'v' || key == 'V')
  {
    activar_viento = !activar_viento;
  }
  
  if (key == 'g' || key == 'G')
  {
    activar_gr = !activar_gr;
  }
}
