{ include("common-rules.asl") }
{ include("common-plans.asl") }
{ include("actions.asl") }
{ include("organization-plans.asl") }

// Registra o agente no servidor da completi��o utilizando o artefato de interface (EISArtifact.java) 
+!register_EIS(E)
<-  
	.my_name(Me);
	.concat("perso_art_",Me,AName);
	makeArtifact(AName,"usp.mapc.g1.env.EISArtifact",[],AId);
	focus(AId);
	registerEISEntity(E);
. 

// Necess�rio para registrar a comunica��o.
+!register_freeconn
<-	
  .print("Registering...");
	registerFreeconn;
.

// Plano para reagir ao dado do role/5 (do EISArtifact)
// Carrega o c�digo que foi 
// plan to react to the signal role/5 (from EISArtifact)
// it loads the source code for the agent's role in the simulation
+role(Role, Speed, LoadCap, BatteryCap, Tools)
<-
	.print("Got role: ", Role);
	!new_round;
	.lower_case(Role, File);
	.concat(File, ".asl", FileExt);
	.include(FileExt);
.
