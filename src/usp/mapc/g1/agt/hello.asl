// Agent hello in project hello world

/* Initial beliefs and rules */

/* Initial goals  */

//!start.

/* Plans */

+!print_h    <- .print("h").
+!print_e    <- .print("e").
+!print_l1   <- .print("l").
+!print_l2   <- .print("l").
+!print_l3   <- .print("l"). 
+!print_spc  <- .print(" ").
+!print_w    <- .print("w"). 
+!print_o1   <- .print("o"). 
+!print_o2   <- .print("o"). 
+!print_r    <- .print("r"). 
+!print_d    <- .print("d"). 
+!print_excl <- .print("!"). 

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
