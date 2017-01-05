import de.voidplus.leapmotion.*;

import java.util.*;
import shiffman.box2d.*;

import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;
ArrayList<Particle> particles;
Box box;

float r, g, b;

void setup()
{
  size(720, 720);
  background(0);
  frameRate(30);
  colorMode(HSB);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  
  particles = new ArrayList<Particle>();
  box = new Box();
}

void draw()
{
  background(0);
  box2d.step();
  
  if(frameCount % 10 == 0)
  {
    float cc = frameCount % 255;
    for(int i = 0; i < 360; i += 1)
    {
      float x = 30 * cos(radians(i + 0.5));
      float y = 30 * sin(radians(i + 0.5));
      color c = color(cc, 255, 255);
      cc = (cc + 3.5) % 255;
      
      Particle p = new Particle(width / 2 + x, height / 2 - y, 5, c);
      p.body.setLinearVelocity(new Vec2(x, y));
      particles.add(p);
    }
    
    
  }
  
  Iterator<Particle> it = particles.iterator();
  while(it.hasNext())
  {
    Particle p = it.next();
    p.display();
    
    if(p.isDead())
    {
      it.remove();
    }
  }
  
  println(frameCount);
  /*
  saveFrame("screen-#####.png");
  if(frameCount > 700)
  {
     exit();
  }
  */
}