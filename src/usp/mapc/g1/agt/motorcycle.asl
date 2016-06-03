// specific beliefs for motorcycles

+charge(C) : C < 100 & not .desire(charge) <- 	.print("Sou uma moto e estou iniciando processo de carga da bateria...");
												!charge.