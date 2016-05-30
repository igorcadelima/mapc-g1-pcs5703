package util;

import massim.server.Server;
import massim.test.InvalidConfigurationException;

/*
 * 
 */
public class StartServerG1 {

	public static void main(String[] args) throws InvalidConfigurationException {
		Server.main(new String[] { "--conf", "conf/team-g1-completescenario/2016-complete-3sims.xml" });	
	}
}
