package org.softlang;

public class Transition {
	private String source;
	private String event;
	private String action;
	private String target;
	public String getSource() { return source; }
	public void setSource(String source) { this.source = source; }
	public String getEvent() { return event; }
	public void setEvent(String event) { this.event = event; }
	public String getAction() { return action; }
	public void setAction(String action) { this.action = action; }
	public String getTarget() { return target; }
	public void setTarget(String target) { this.target = target; }
	public Transition() { }
	public Transition(String source, String event, String action, String target) {
		this.source = source;
		this.event = event;
		this.action = action;
		this.target = target;
	}
}
