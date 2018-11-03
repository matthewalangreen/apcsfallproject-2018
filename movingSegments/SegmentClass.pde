class Segment
{
  // private data
  // *************************************************************************************************
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
  float newLength;  
  
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
  }
  
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
  
  // Deprecated
  //int getStartAngleBool() {
  //  if ( ((PI/2)-error) < this.startAngle && this.startAngle < ((PI/2)+error) ) {
  //    return 1; // learning right
  //  } else {
  //    return 0; // not leaning right
  //  }
  //}
  
  //int getEndAngleBool() {
  //   if ( ((PI/2)-error) < this.endAngle && this.endAngle < ((PI/2)+error) ) {
  //  // if (this.endAngle > (PI/3)) {
  //    return 1; // learning right
  //  } else {
  //    return 0; // not leaning right
  //  }
  //}
  
  float getLength(float angle) {
    //https://www.desmos.com/calculator/mu1snong2u
    return 0.6714*angle*angle-1.0548*angle+sqrt(2);
  }
  
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
}
