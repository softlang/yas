// BEGIN ...
package org.softlang.fsml;
// END ...
public class FsmlToObjects extends FsmlBaseListener {
	private Fsm fsm;
	private State current;
	public Fsm getFsm() { return fsm; }
	@Override public void enterFsm(FsmlParser.FsmContext ctx) {
		fsm = new Fsm();
	}
	@Override public void enterState(FsmlParser.StateContext ctx) { 
		current = new State();
		current.setStateid(ctx.stateid().getText());
		fsm.getStates().add(current);		
	}
	@Override public void enterTransition(FsmlParser.TransitionContext ctx) { 
		Transition t = new Transition();
		fsm.getTransitions().add(t);
		t.setSource(current.getStateid());
		t.setEvent(ctx.event().getText());
		if (ctx.action() != null) t.setAction(ctx.action().getText());
		t.setTarget(ctx.target != null ? ctx.target.getText() : current.getStateid());
	}
}
