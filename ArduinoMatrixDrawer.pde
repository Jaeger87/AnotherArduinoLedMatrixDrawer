import java.util.Date;
import java.text.SimpleDateFormat;


ArrayList<Led> matrix;
int indexPressed = -1;
boolean pressed = false;  
void setup()
{
  size(1000, 1000);
  matrix = new ArrayList<Led>();
  for (int j = 0; j < 8; j++)
    for (int i = 0; i < 8; i++)
      matrix.add(new Led(i * 100 + 100, j*100 + 100));
}


void draw()
{
  background(255);
  fill(0,0,0);
  textSize(20);
  text("Press R to reset", 100, 40);
  text("Press C to get matrix code", 100, 60);
  
  
  if (mousePressed && !pressed)
  {
    indexPressed = findLed();
    pressed = true;
  }
  for (Led l : matrix)
    l.display();
}
void mouseReleased() {

  if(indexPressed > -1 &&findLed() == indexPressed)
     matrix.get(indexPressed).pressed();
  pressed = false;
  indexPressed = -1;
}

int findLed()
{
  if (mouseX < 100 || mouseX > 900)
    return -1;

  if (mouseY < 100 || mouseY > 900)
    return -1;
  int y = (mouseY - 100) / 100;
  int x = (mouseX - 100) / 100;
  return y * 8 + x;
}

void keyPressed() {
  if (key=='r'||key=='R')
    for(Led l : matrix)
      l.reset();
   if (key=='c'||key=='C')
       getAndSaveCode();
}

void getAndSaveCode()
{
  StringBuilder sb = new StringBuilder();
  sb.append("{\n");
  for(int i = 0; i < matrix.size(); i++)
  {
    if(i % 8 == 0)
      sb.append("B");
    if(matrix.get(i).active)
        sb.append(1);
    else
        sb.append(0);
    if(i % 8 == 7)
      sb.append(",\n");
  }
  sb.setLength(sb.length() - 2);
  sb.append("\n}");
  println(sb);
  saveCodeFile(sb.toString());
}

void saveCodeFile(String s)
{
  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
  println(sdf.format(new Date()));
  PrintWriter output = createWriter(sdf.format(new Date())+ ".txt");
  output.println(s);
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
}