package slbook.xcoupled.xsd;

import slbook.xcoupled.RenameElementName;
import java.util.Iterator;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Attribute;
import org.jdom.Namespace;
import org.jdom.filter.ElementFilter;

/**
 * The rename-element operator at the level of XSD schemas
 */
public class RenameElementNameXSD implements RenameElementName<Document> {

	public void transform(Namespace ns, String oldName, String newName, Document schema) {

		// Interact with the XML Schema namespace
		Namespace xs = Namespace.getNamespace("http://www.w3.org/2001/XMLSchema");

		// Iterate over all xs:element elements
		Iterator<?> elems = 
				schema.getDescendants(new ElementFilter("element", xs));

		while (elems.hasNext()) {
			
			Element elem = (Element)(elems.next());
			
			// Handle global element declarations
			Attribute name = elem.getAttribute("name");
			Element parent = (Element)elem.getParent();
			if (parent.getName().equals("schema")
			&& parent.getNamespaceURI().equals(xs.getURI())
			&& name != null 
			&& name.getValue().equals(oldName)) {
				elem.setAttribute("name", newName);
				continue;
			}
			
			// Handle element references			
			Attribute ref = elem.getAttribute("ref");
			if (ref != null 
			&& ref.getValue().equals(oldName)) {
				elem.setAttribute("ref", newName);
				continue;
			}
		}
	}

}
