int n_pelos = 15; // Numero de pelos
final int n_springs = 10;  // Numero de muelles
int l_pelo = 75;  // Tamaño de los pelos
float l_spring = l_pelo/n_springs; 

float [] vE = new float [700];
int t = 0;

Hair hair;
Hair[] hairs = new Hair[n_pelos];

void setup()
{
  size (500, 600);
  
  for (int np = 0; np < n_pelos; np++)
  {
    PVector ini = new PVector (width/2 + random(85), height/2 + random(85));
    hair = new Hair (l_pelo, n_springs, ini);
    hairs[np] = hair;
  }
}

void draw()
{
  background(255);
  fill(255,0,0);
  
  fill (0);
  textSize(25);
  
  text("Ejercicio Tema 3: Pelo", 15, 50, 0);
  
  for (int np =0; np < n_pelos; np++)
    hairs[np].update();
}

void mousePressed()
{
  for (int np = 0; np < n_pelos; np++)
    hairs[np].on_click();
}

void mouseReleased()
{
  for(int np = 0;np<n_pelos;np++)
    hairs[np].release();
}

void plot_func(int time, int x1, int y1, int x2, int y2)
{
  stroke(200, 10, 0);
  strokeWeight(3);
  fill(153);
  
  rect(x1, y1, x2, y2);
  stroke(200, 210, 0);
  
  strokeWeight(1);
  stroke(255);
  
  for (int i = 0; i<time; i++)
    point(i, 600*0.5 - (vE[i] /6.5e5)*600);
}
