class Led
{
  PVector location;
  boolean active = false;
  final static int size = 100;
  
  Led(float x, float y)
  {
   location = new PVector(x, y); 
  }
  
  void display() 
  {
    stroke(0);
    strokeWeight(2);
    fill(255);
    if(active)
        fill(255, 0, 0);
    rect(location.x, location.y,size, size);
  }
  
  void pressed()
  {
    active = !active;
  }
  
  void reset()
  {
    active = false;
  }
}