void keyPressed() {
  // toggle $animating 
  if(key == 'a') {
    $animating = !$animating;
    println("$activeMode: "+$animating);
  }
  
  if(key == '1') {  // set grid size 10
    prepareAndCreateDirector(0);
    director.showNext();
  }
  
  if(key == '2') {  // set grid size 20
    prepareAndCreateDirector(1);
    director.showNext();
  }
  
  if(key == '3') {  // set grid size to 50
    prepareAndCreateDirector(2);
    director.showNext();
  }
  
  if(key == '4') {  // set grid size to 100
    prepareAndCreateDirector(3);
    director.showNext();
  }
 
 if(key == 'g') {
  $grid = !$grid; 
  if($grid) {
    printD("grid",true);
  } else {
    printD("grid",false); 
  }
 }
 
 // toggle between "start" and "end" patterns
 // you'll want to $animating to be false for these to really work.
     if(key == 'n') {
       background(255);
       if ($grid) { drawGrid($gridWidth); };
       director.showNext();
     }
 

 // turn on some console print statements and visual elements
 if(key == 'd') {
  $debug = !$debug;
  if($debug) {
    printD("debug",true);
  } else {
    printD("debug",false); 
  }
 }
 
}

// Helper method for string formatting
void printD(String m, boolean t) {
  if (t) {
    println(m + ": on");
  } else {
    println(m + ": off");
  }
}
