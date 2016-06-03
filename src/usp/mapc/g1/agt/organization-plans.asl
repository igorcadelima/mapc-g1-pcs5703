/* Plans */


/* 
 * runCar Plan is: 
 *    - goes to some shop to buy tool2
 *    - goes to workshop1
 *    - wait others
 *    - assemble material3
 *    - delivery
 */
 
+!runCar
<-  
    !buy_item(tool2,1);
    !goto(workshop1,0);
    !all_at([vehicle2,vehicle3,vehicle4],workshop2);
    
    // set the step for assemble
    ?step(S); AS = S+3;
    .broadcast(tell,assemble_step(AS));
    !wait_skip( step(AS) );
    !assemble(material3);
    ?pricedJob(JobId,Storage,Begin,End,Reward,Items);
    !goto(Storage,0);
    !deliver_job(JobId);
    ?step(NS);
    .print("Job delivered!!!!! at step ", NS);
      
	!skip_forever;    
	.	


	
/*
 * runDrone Plan is:
 *    - buys too1
 *    - buys base1
 *    - assemble material1
 *    - buys base1
 *    - assemble another material1
 *    - goes to workshop1
 *    - helps vehicle 1 to assemble material 3 
 */
 
+!runDrone
<-  !buy_item(tool1,1);
    !buy_item(base1,5);
    !goto(workshop1,0);
    !assemble(material1);
    
    !buy_item(base1,5);
    !goto(workshop1,0);
    !assemble(material1);
    
    .print("ok, I have material 1");
    
    .print("at workshop waiting to assemble...");    
    !wait_skip( assemble_step(AS) );
    !wait_skip( step(AS) );
	!assist_assemble(a1);
	
	!skip_forever;    
	.

/* 
 * runMotorcycle Plan is:
 *    - buys too3
 *    - buys base2
 *    - goes to workshop1
 *    - helps vehicle 1 to assemble material 3
 *  
 */

+!runMotorcycle
<-  !buy_item(tool3,1);
	!buy_item(base2,2);

    !goto(workshop1,0);

    .print("at workshop waiting to assemble...");    
    !wait_skip( assemble_step(AS) );
    !wait_skip( step(AS) );
	!assist_assemble(a1);    

	!skip_forever;    
	.


/*
 * runTruck Plan is:
 *    - buys base3
 *    - goes to workshop1
 *    - helps vehicle 1 to assemble material 3
 * 
 */
 
+!runTruck
<-  !buy_item(base3,1);
    !goto(workshop1,0);

    .print("at workshop waiting to assemble...");    
    !wait_skip( assemble_step(AS) );
    !wait_skip( step(AS) );
	!assist_assemble(a1);    

	!skip_forever;  
	.


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }

// uncomment the include below to have a agent that always complies with its organization  
{ include("$jacamoJar/templates/org-obedient.asl") }
