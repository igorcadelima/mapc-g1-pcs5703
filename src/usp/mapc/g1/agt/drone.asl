// specific beliefs for drones
   
+charge(C) : C < 100 & not .desire(charge) <- 	.print("Sou um drone e estou iniciando processo de carga da bateria...");
												!charge.
