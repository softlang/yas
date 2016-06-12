// BEGIN ...
package slbook.xcoupled;

// END ...
import org.jdom.Namespace;

public interface RenameElementName<T> extends Operator<T> {

	/**
	 * @param ns The namespace of the element name to be renamed
	 * @param oldName The old element name
	 * @param newName The new element name
	 * @param object The object to transform
	 */
	public void transform(Namespace ns, String oldName, String newName, T object);
	
}
