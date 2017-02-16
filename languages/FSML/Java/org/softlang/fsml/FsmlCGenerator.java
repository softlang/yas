package org.softlang.fsml;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;
import org.stringtemplate.v4.STGroupFile;
import org.stringtemplate.v4.StringRenderer;
import java.io.File;
import java.util.*;

public class FsmlCGenerator {
	private static class TGroup {
		public String stateid;
		public List<Transition> ts;
	}
	public static String generateC(Fsm fsm) {
		// Build list of states with extra "UNDEFINED"
		List<String> states = new LinkedList<>();
		for (State s : fsm.getStates()) states.add(s.getStateid());
		states.add("UNDEFINED");
		// Build set of events
		Set<String> events = new HashSet<>();
		for (Transition t : fsm.getTransitions()) events.add(t.getEvent());
		// Build set of actions
		Set<String> actions = new HashSet<>();
		for (Transition t : fsm.getTransitions())
			if (t.getAction()!=null) actions.add(t.getAction());
		// Group transitions by state
		List<TGroup> tgroups = new LinkedList<>();
		for (State s : fsm.getStates()) {
			TGroup tg = new TGroup();
			tg.stateid = s.getStateid();
			tg.ts = new LinkedList<>();
			for (Transition t : fsm.getTransitions())
				if (tg.stateid==t.getSource()) tg.ts.add(t);
			tgroups.add(tg);
		}
		// Load template group and retrieve top-level template
        STGroup group = new STGroupFile("templates" + File.separatorChar + "Fsm.stg");
        group.registerRenderer(String.class, new StringRenderer());
        ST main = group.getInstanceOf("main"); 
        // Set template parameters and render
        main.add("states", states);
        main.add("initial", fsm.getInitial());
        main.add("events", events);
        main.add("actions", actions);
        main.add("tgroups", tgroups);
        return main.render();
	}
}
