class Hair
{
  float l;
  int n_muelles, n_pelos;
  float l_muelle;
  PVector origin;
  
  Extreme[] vExtr = new Extreme[n_springs+1];
  Spring[] vSprings = new Spring[n_springs];
  
  Hair (float _l, int muelles, PVector _origin)
  {
    l = _l;
    n_muelles = muelles;
    l_muelle = l/n_muelles;
    origin = _origin;
    
    for(int i = 0; i < vExtr.length; i++)
      vExtr[i] = new Extreme (origin.x + i *l_muelle, origin.y);
    
    for (int i = 0; i<vSprings.length; i++)
      vSprings[i] = new Spring(vExtr[i], vExtr[i+1], l_muelle);
  }
  
  void update()
  {
    for (Spring s: vSprings)
    {
      s.update();
      s.display();
    }
    
    for (int i = 1; i < vExtr.length; i++)
    {
      vExtr[i].update();
      vExtr[i].display();
      vExtr[i].drag(mouseX, mouseY); 
    }
  }
  
  void on_click()
  {
    for(Extreme b: vExtr)
      b.clicked(mouseX, mouseY);
  }
  
  void release()
  {
    for (Extreme b: vExtr)
      b.stoparrastre();
  }
  
}
