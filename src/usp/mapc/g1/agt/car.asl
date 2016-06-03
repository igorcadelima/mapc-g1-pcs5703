// specific beliefs for cars

+charge(C) : C < 100 & not .desire(charge) <- 	.print("Sou um carro e estou iniciando processo de carga da bateria...");
												!charge.