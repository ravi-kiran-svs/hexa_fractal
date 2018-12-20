int n=10,t=0,i,d;
int[] x,y;

void setup()
{
  size(800,600);
  background(0);
  frameRate(1);
  stroke(255);
  x= new int[int(pow(3,n))+1];
  y= new int[int(pow(3,n))+1];
  x[0]=100;  y[0]=50;
  x[1]=700;  y[1]=50;
  d = int(dist(x[0],y[0],x[1],y[1]));
}

void draw()
{
  background(0);
  for(i=0;i<pow(3,t);i++)
  {
    line(x[i],y[i],x[i+1],y[i+1]);
  }
  
  noLoop();
  t++; //<>//
  
  for(i=int(pow(3,t));i!=0;i-=3)
  {
    x[i]=x[i/3];
    y[i]=y[i/3];
    
    if(y[i]<  y[i/3-1]+3 && y[i]>  y[i/3-1]-3 && x[i]>x[i/3-1])  {
      x[i-1]=  x[i/3-1]  +  3*d/4;
      y[i-1]=  y[i/3-1]  +  int(sqrt(3)*d/4);
      x[i-2]=  x[i/3-1]  +  d/4;
      y[i-2]=  y[i/3-1]  +  int(sqrt(3)*d/4);
    }
    
    else if(y[i]<  y[i/3-1]+3 && y[i]>  y[i/3-1]-3 && x[i]<x[i/3-1])  {
      x[i-1]=  x[i/3-1]  -  3*d/4;
      y[i-1]=  y[i/3-1]  +  int(sqrt(3)*d/4);
      x[i-2]=  x[i/3-1]  -  d/4;
      y[i-2]=  y[i/3-1]  +  int(sqrt(3)*d/4);
    }
    
    else if(x[i]>x[i/3-1] && y[i]>y[i/3-1])  {
      x[i-1]=  x[i/3-1]  +  3*d/4;
      y[i-1]=  (y[i/3-1]  +  y[i])/2;
      x[i-2]=  x[i/3-1]  +  d/2;
      y[i-2]=  y[i/3-1];
    }
    
    else if(x[i]<x[i/3-1] && y[i]<y[i/3-1])  {
      x[i-1]=  x[i/3-1];
      y[i-1]=  y[i];
      x[i-2]=  x[i/3-1]  +  d/4;
      y[i-2]=  (y[i/3-1]  +  y[i])/2;
    }
    
    else if(x[i]>x[i/3-1] && y[i]<y[i/3-1])  {
      x[i-1]=  x[i/3-1];
      y[i-1]=  y[i];
      x[i-2]=  x[i/3-1]  -  d/4;
      y[i-2]=  (y[i/3-1]  +  y[i])/2;
    }
    
    else if(x[i]<x[i/3-1] && y[i]>y[i/3-1])  {
      x[i-1]=  x[i/3-1]  -  3*d/4;
      y[i-1]=  (y[i/3-1]  +  y[i])/2;
      x[i-2]=  x[i/3-1]  -  d/2;
      y[i-2]=  y[i/3-1];
    }
  }
  
  d = d/2;
}

void mousePressed()
{
  if(t!=n)  loop();
}