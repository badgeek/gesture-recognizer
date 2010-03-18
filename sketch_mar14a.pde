
int value = 0;
int count = 0;
int length = 10;

PFont font;
mPointer[] mcol = new mPointer[length];

void setup()
{
  size(400,400);

  font = loadFont("Garamond-12.vlw"); 
  textFont(font);

  for (int i = 0; i< mcol.length ; i++)
  {
    mcol[i] = new mPointer();
  }

  println("begin");
}


void draw() {
  background(204);

  for (int i = 0; i < mcol.length-1 ; i++)
  {
    text(i, mcol[i].px,mcol[i].py);
    //text(dist(mcol[i].px, mcol[i].py, mcol[i+1].px, mcol[i+1].py), mcol[i].px,mcol[i].py);
    //line(mcol[i].px, mcol[i].py, mcol[i+1].px, mcol[i+1].py);
    mcol[i].update();
  }
}

void mouseDragged() 
{  
 
 mcol[length-1].put(mouseX, mouseY);
 
 for (int i = 0; i < length-1 ; i++)
 {
    mcol[i].put(mcol[i+1].px, mcol[i+1].py);  
 }
 
 if ( count < length)
 {
   count = count + 1;
 }
 
 //mcol[length-count].hide = false; 
 
}

void mouseReleased()
{
  
  float totalx = 0;
  float totaly = 0;
  float avgx = 0;
  float avgy = 0;

  for (int i = 0 ; i < count ; i++)
   {
      ellipse(mcol[(length-1)-i].px, mcol[(length-1)-i].py, 10,10);
      println("jm");
   }
   
   println(count);
   count = 0;

}

class mPointer {
  float px, py;
  boolean hide = false;

  void put(float x, float y)
  {
    px = x;
    py = y;
  }

  void update()
  {
    if (hide == false)
    {
      fill(0);
      ellipse(px, py, 3, 3);
    }
  }

}


PVector line_intersect (float x1, float y1, float x2, float y2, float x3, float y3, float r)
{

  float ix, iy;
  float a,b,c,d;
  float mu;

  a = sq(x2-x1) + sq(y2-y1);
  b = 2 * ( (x2-x1) * (x1 -x3) + (y2-y1) * (y1-y3) );
  c = (sq(x3) + sq(y3) + sq(x1) + sq(y1)) - 2 * ( (x3 * x1) + (y3 * y1) ) - sq(r);
  d = sq(b) - (4 * (a * c));

  if (d < 0)
  {
    //("no intersection");
  }
  else if (d == 0){
    //("one intersection");
    mu = -b/(2 * a);
    ix = x1 + mu * (x2-x1);
    iy = y1 + mu * (y2-y1);  
  }
  return new PVector(ix,iy);
}

