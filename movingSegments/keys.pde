void keyPressed() {
  // toggle $activeMode 
  if(key == 'a') {
    $activeMode = !$activeMode;
    println("$activeMode: "+$activeMode);
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
 // only works in "active" mode
     if(key == 't') {
       if(director.getShowing() == "start") {
         director.setShowing("end");
       } else {
         director.setShowing("start");
       }
     }
     
     if(key == 's') {
       director.shiftPatterns();
     }
     
     if(key == 'n') {
       background(255);
       if ($grid) { drawGrid($gridWidth); };
       director.showNext();
     }
 

 if(key == 'd') {
  $debug = !$debug;
  if($debug) {
    printD("debug",true);
  } else {
    printD("debug",false); 
  }
 }
 
}

// Helper functions
void printD(String m, boolean t) {
  if (t) {
    println(m + ": on");
  } else {
    println(m + ": off");
  }
}
