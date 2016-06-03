// specific beliefs for trucks

+charge(C) : C < 100 & not .desire(charge) <- 	.print("Sou um caminhão e estou iniciando processo de carga da bateria...");
												!charge.