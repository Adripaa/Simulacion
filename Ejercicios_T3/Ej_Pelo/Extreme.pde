class Extreme
{
  PVector s;
  PVector v;
  PVector a;
  PVector g;
  
  float mass = 5;
  float dt = 0.1;
  
  float Ec, Ep;
  PVector weight;
  int mode;
  
  PVector dragOffset;
  boolean arrastre = false;
  
  Extreme(float x, float y)
  {
    s = new PVector(x,y);
    v = new PVector();
    a = new PVector();
    dragOffset = new PVector();
    g = new PVector(0, 9.8);
    weight = new PVector();
  }
  
  void update()
  {
    v.x += a.x * dt;
    v.y += a.y * dt;
    
    s.x += v.x * dt;
    s.y += v.y * dt;
    
    a.x = 0;
    a.y = 0;
    
    weight.y = g.y * mass;
    applyForce(weight);
  }
  
  void applyForce(PVector force)
  {
    PVector f = force;
    f.div(mass);
    a.add(f);
  }
  
  void display()
  {
    stroke(0);
    strokeWeight(2);
    fill(175, 120);
    
    if (arrastre)
      fill(50);
  }
  
  void clicked(int x, int y)
  {
    float d = dist(x,y,s.x, s.y);
    float threshold = 5;
    
    if(d < threshold)
    {
      arrastre =true;
      dragOffset.x = s.x - x;
      dragOffset.y = s.y - y;
    }
  }
  
  void stoparrastre()
  {
    arrastre = false;
  }
  
  void drag(int mx, int my)
  {
    if(arrastre)
    {
      s.x = mx + dragOffset.x;
      s.y = my + dragOffset.y;
    }
  }
}
