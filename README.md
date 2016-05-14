# Group 1 for the MAPC in the PCS 5703 discipline (2016.1) offered at Poli-USP

### Members of the group
  - [Eduardo Bertassi]
  - [Igor C. A. de Lima]
  - [Rosalia Caya]

### Tech

This work uses a number of open source projects to work properly:

* [JaCaMo] - framework for Multi-Agent Programming 

And of course all the code produced by the team is open source with a [public repository]
 on GitHub.

### Importing project into Eclipse IDE

*File > Import > General > Existing project into workspace*.

### Running

Using Eclipse:  
1. open src/util/StartServer.java and execute it  
2. open src/util/StartTeams.java and execute it  
3. Select the StartServer console and press ENTER to start the simulation  
4. open and run src/util/StartMonitor.java **(optional)**.

Using Ant (each command should be executed in a different terminal):  
1. *ant server*  
2. *ant java-team*  
3. *ant jcm-team*  
4. *ant monitor* **(optional)**.

License
----

GPLv3



   [Eduardo Bertassi]: <mailto:&#098;&#101;&#114;&#116;&#097;&#115;&#115;&#105;&#064;&#121;&#097;&#104;&#111;&#111;&#046;&#099;&#111;&#109;>
   [Igor C. A. de Lima]: <mailto:&#105;&#103;&#111;&#114;&#099;&#097;&#100;&#101;&#108;&#105;&#109;&#097;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;>
   [Rosalia Caya]: <mailto:&#114;&#111;&#115;&#115;&#101;&#100;&#116;&#104;&#064;&#103;&#109;&#097;&#105;&#108;&#046;&#099;&#111;&#109;>
   [public repository]: <https://github.com/igorcadelima/mapc-g1-pcs5703>
   [jacamo]: <http://jacamo.sourceforge.net/>
