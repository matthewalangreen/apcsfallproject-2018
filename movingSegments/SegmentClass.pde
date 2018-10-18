class Segment
{
  // private data
  // *************************************************************************************************
  static final int animationDuration = 1;
  static final boolean showBox = true;
  static final float easing = 0.1;
  static final float error = 0.005;
  
  // instance data  
  // *************************************************************************************************
  int segmentLength;
  PVector center;
  float startAngle;
  float currentAngle; 
  float endAngle; 
  float newLength;  // not sure I'm using this at all?
  
  // animation
  boolean animating;
  int frame;
  int totalFrames;
  float angleIncrement;

  
  // constructor 
  // *************************************************************************************************
  Segment(int x, int y) {
    segmentLength = $gridWidth;
    float p = segmentLength/2;
    center = new PVector(x+p,y+p);
    startAngle = 0; 
    currentAngle = startAngle;
    endAngle = startAngle;
    newLength = segmentLength; 
    
    // animation
    animating = false;
    frame = 0;
  }

  
  // helper methods
  // *************************************************************************************************
  
  
  // Getters
  // *************************************************************************************************
  float getStartAngle() {
    return this.startAngle;  
  }
  
   float getEndAngle() {
    return this.endAngle;  
  }
  
   float getCurrentAngle() {
    return this.currentAngle;  
  }
  
  int getStartAngleBool() {
    if ( ((PI/2)-error) < this.startAngle && this.startAngle < ((PI/2)+error) ) {
      return 1; // learning right
    } else {
      return 0; // not leaning right
    }
  }
  
  int getEndAngleBool() {
     if ( ((PI/2)-error) < this.endAngle && this.endAngle < ((PI/2)+error) ) {
    // if (this.endAngle > (PI/3)) {
      return 1; // learning right
    } else {
      return 0; // not leaning right
    }
  }
  
  float getLength(float angle) {
    //https://www.desmos.com/calculator/mu1snong2u
    return 0.6714*angle*angle-1.0548*angle+sqrt(2);
  }
  // *************************************************************************************************
  


  // animation
  // *************************************************************************************************
  //void startAnimation() {
  //  this.animating = true;
  //  this.frame = 0;
    
  //  // calculate animation stuff
  //  this.totalFrames = $fRate*Segment.animationDuration;
  //  float angle = this.getEndAngle() - this.getStartAngle();   // not sure if correct... might be flipped?
  //  this.angleIncrement = (angle/totalFrames);          // split the distance between start and end into equal parts
  //}
  
  //void stopAnimation() {
  //  this.animating = false;
  //  this.animationCompleted();
  //}
  
  //void animate() {
  //  // with easing
  //  //float d = abs(this.endAngle - this.currentAngle);
  //  //if(animating && d < Segment.error) {
  //  //  this.updateAnimation();
  //  //} else if (d > Segment.error && animating) {
  //  //  this.stopAnimation();
  //  //}
    
  //  // how to do this without easing
  //  if(this.frame <= this.totalFrames && this.animating) {
  //    this.updateAnimation();
  //  } else if(this.frame > this.totalFrames && this.animating) {
  //    this.stopAnimation();
  //  }
  //}
  
  //void updateAnimation() {
  //  // with easing
  //  float a = this.currentAngle;
  //  float targetAngle = this.endAngle;
  //  float da = targetAngle - a;
  //  a += da * Segment.easing;
  //  this.currentAngle = a;
    
  //  // without easing
  //  //this.currentAngle += this.angleIncrement;
  //  this.frame++;
  //}
  
  //void animationCompleted() {
  //  // swap the angles after you finish the animation
  //  float temp = this.endAngle;
  //  this.endAngle = this.startAngle;
  //  this.startAngle = temp;
  //  this.currentAngle = this.startAngle;
  //}
  

  // Setters
  // *************************************************************************************************
    void setCurrentAngle(float a) {
      currentAngle = a;
    }
      
    void setStartAngle(boolean t) {
     if (t) {
      startAngle = PI/2; // "leaning"
     } else {
      startAngle = 0;  // not "leaning"
     }
    }
    
     void setCurrentAngle(boolean t) {
     if (t) {
      currentAngle = PI/2; // "leaning"
     } else {
      currentAngle = 0;  // not "leaning"
     }
    }
    
    void setEndAngle(boolean t) {
     if (t) {
      endAngle = PI/2; // "leaning"
     } else {
      endAngle = 0;  // not "leaning"
     }
    }
    
    void setRandomStartAngle() {
      float p = random(0,1);
      if (p < 0.5) {
       startAngle = 0;  // left 
      } else {
       startAngle = PI/2; // right 
      }
    }
    // End Setters
    // *************************************************************************************************


    // Display methods
    // *************************************************************************************************
   
    void showStart() {
      float l = getLength(startAngle);
      float k = (segmentLength/sqrt(2));
      float p = round((l*k)/2);
      pushMatrix();
      translate(center.x,center.y); // move to center + 1/2 line length
      rotate(startAngle);
      line(-p,-p,p,p);
      popMatrix();
      if($debug) {
        fill(255,0,0);
        ellipse(center.x,center.y,5,5);
      }
    }
    
     void showCurrent() {
      float l = getLength(currentAngle);
      float k = (segmentLength/sqrt(2));
      float p = round((l*k)/2);
      pushMatrix();
      translate(center.x,center.y); // move to center + 1/2 line length
      rotate(currentAngle);
      line(-p,-p,p,p);
      popMatrix();
      if($debug) {
        fill(255,0,0);
        ellipse(center.x,center.y,5,5);
      }
      
    }
    
    void showEnd() {
      float l = getLength(endAngle);
      float k = (segmentLength/sqrt(2));
      float p = round((l*k)/2);
      pushMatrix();
      translate(center.x,center.y); // move to center + 1/2 line length
      rotate(endAngle);
      line(-p,-p,p,p);
      popMatrix();
      if($debug) {
        fill(255,0,0);
        ellipse(center.x,center.y,5,5);
      }
    }
    
    // End display methods
    // *************************************************************************************************
  
 
}
