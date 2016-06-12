// BEGIN ...
package slbook.xcoupled.xml;

import slbook.xcoupled.RenameElementName;
// END ...
import java.util.Iterator;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.filter.ElementFilter;

/**
 * The rename-element operator at the level of XML documents
 */
public class RenameElementNameXML
			implements RenameElementName<Document> {

	public void transform(
					Namespace ns, String oldName, String newName, Document doc) {

		// Iterate over all elements with the old name
		Iterator<?> elems = 
				doc.getDescendants(new ElementFilter(oldName, ns));

		while (elems.hasNext()) {
			Element elem = (Element)(elems.next());
			
			// Rename to new name
			elem.setName(newName);
		}
	}

}
