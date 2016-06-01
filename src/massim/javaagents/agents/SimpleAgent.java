package massim.javaagents.agents;

import eis.iilang.Action;
import eis.iilang.Percept;
import massim.javaagents.Agent;

import java.io.*;
import java.util.Collection;

/*
 * Classe para implementa��o simples de um agente. Todos os agentes instanciados 
 * s�o baseados nessa classe.
 */
public class SimpleAgent extends Agent {

	private FileWriter out;
	private BufferedReader in;

	private int lastStep = -1;
	private Action lastAction;
	private int simCounter = 1;

	private String name = "";

	private File logpath;
	private File logfile;
	private File actionconf;

	/**
	 * Inicializa o agente com um dado nome. Garante que esse nome seja �nico.
	 * 
	 * @param name nome do agente
	 * @param team time do agente
	 */
	public SimpleAgent(String name, String team) {

		super(name, team);

		this.name = name;

		println("Agente inicializado com o nome: " + name);
		println("Agente inicializado com o time: " + team);
		
		// Cria��o dos logs.
		this.createIO();
	}

	/*
	 * M�todo para cria��o de logs.
	 */
	private void createIO() {
		logpath = new File("log/" + System.currentTimeMillis() / (1000));
		logfile = new File(logpath + "/" + name + "-" + simCounter);
		actionconf = new File("conf/team-g1/actionconf/" + name + "-" + simCounter);

		logpath.mkdirs();

		if (!actionconf.exists())
			try {
				actionconf.createNewFile();
			}
			catch (IOException e) {
				e.printStackTrace();
			}

		if (!logfile.exists())
			try {
				logfile.createNewFile();
			}
			catch (IOException e) {
				e.printStackTrace();
			}

		try {

			out = new FileWriter(logfile);
			out.write(name + " starting log at " + System.currentTimeMillis() + "\n");

			in = new BufferedReader(new FileReader(actionconf));

		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Action step() {

		boolean newStep = true;

		// Realiza o log das percep��es do ambiente.
		if (out != null) {

			try {
				out.write("Log: ");
			}
			catch (IOException e) {
				e.printStackTrace();
			}

			Collection<Percept> percepts = getAllPercepts();

			// Come�a a pegar as percep��es.
			for (Percept p : percepts) {
				try {
					out.write(p.toProlog());
				}
				catch (IOException e) {
					e.printStackTrace();
				}

				// Detecta da posi��o que o agente est� e realiza um print.
				if (p.getName().equals("position")) {
					println("Estou na posi��o: " + p.getParameters().get(0).toString());
				}

				// Detecta qual passo a simula��o est�.
				if (p.getName().equals("step")) {
					int step = new Integer(p.getParameters().get(0).toProlog()).intValue();

					if (step < lastStep) {
						simCounter++;
						createIO();
					}
					else if (step == lastStep) {
						newStep = false;
					}
					lastStep = step;
				}

			}
			try {
				out.write("\n \n");
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}

		// Recebe a a��o e a executa.
		if (in != null && newStep) {
			String action, name = "", param = "";
			try {

				if ((action = in.readLine()) == null) {
					in.close();
					in = null;
					return lastAction = CityUtil.action("skip");
				}
				else {
					int idx = action.indexOf(" ");
					if (idx != -1) {
						name = action.substring(0, idx);
						param = action.substring(idx + 1);
						println(getName() + ": Executing: " + name + " " + param);
						return lastAction = CityUtil.action(name, param);
					}
					else {
						name = action;
						println(getName() + ": Executing: " + name);
						return lastAction = CityUtil.action(name);
					}
				}
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		// Se n�o recebeu outro passo, ou as entradas est�o fechadas, tenta reexecutar a �ltima a��o recebida.
		else { 
			if (lastAction != null) {
				println("retry last action");
				return lastAction;
			}
		}

		return lastAction = CityUtil.action("skip");
	}

	@Override
	public void handlePercept(Percept p) {
	}
}
