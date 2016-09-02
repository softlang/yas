package org.softlang;

import java.util.Stack;
import java.util.HashMap;

public class EiplEnv {
	public enum Type { NoType, IntType, BoolType }
	private abstract class Entry { String id; }
	private class VarEntry extends Entry { Type ty;	}
	private class ProcEntry extends Entry { }
	private Stack<HashMap<String, Entry>> stack = 
			new Stack<HashMap<String, Entry>>();
	public void enterScope() { stack.push(new HashMap<String, Entry>()); }
	public void exitScope() { stack.pop(); }
	public boolean noClash(String id) { return !stack.peek().containsKey(id.intern()); }
	public void addVar(String id, Type ty) {
		VarEntry entry = new VarEntry();
		entry.ty = ty;
		stack.peek().put(id.intern(), entry);
	}
	public void addProc(String id) { stack.peek().put(id.intern(), new ProcEntry()); }
	public boolean isVar(String id) { return chase(id.intern()) instanceof VarEntry; }
	public boolean isProc(String id) { return chase(id.intern()) instanceof ProcEntry; }
	public Type getType(String id) {
		Entry entry = (VarEntry) chase(id.intern());
		return entry instanceof VarEntry ? ((VarEntry) entry).ty : Type.NoType;
	}
	private Entry chase(String id) {
		Entry entry = null;
		for (HashMap<String, Entry> map : stack)
			if (map.containsKey(id)) {
				entry = map.get(id);
				break;
			}
		return entry;
	}
}
