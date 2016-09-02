package org.softlang;

public class FsmlToObjects extends FsmlBaseListener {
	private Fsm fsm;
	private State state;
	public Fsm getFsm() { return fsm; }
	@Override public void enterFsm(FsmlParser.FsmContext ctx) {
		fsm = new Fsm();
	}
	@Override public void enterState(FsmlParser.StateContext ctx) { 
		state = new State();
		state.setStateid(ctx.stateid().getText());
		fsm.getStates().add(state);		
	}
	@Override public void enterTransition(FsmlParser.TransitionContext ctx) { 
		Transition t = new Transition();
		fsm.getTransitions().add(t);
		t.setSource(state.getStateid());
		t.setEvent(ctx.event().getText());
		if (ctx.action() != null) t.setAction(ctx.action().getText());
		t.setTarget(ctx.target != null ? ctx.target.getText() : state.getStateid());
	}
}
