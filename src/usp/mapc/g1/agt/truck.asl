// specific beliefs for trucks

+charge(C) : C < 100 & not .desire(charge) <- 	.print("Sou um caminh�o e estou iniciando processo de carga da bateria...");
												!charge.