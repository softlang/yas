package slbook.xcoupled.xslt;

import slbook.xcoupled.RenameElementName;
import java.util.Iterator;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Attribute;
import org.jdom.Namespace;
import org.jdom.filter.ElementFilter;

/**
 * The rename-element operator at the level of XSLT programs
 */
public class RenameElementNameXSLT implements RenameElementName<Document> {

	public void transform(Namespace ns, String oldName, String newName, Document program) {
		
		// Lookup prefix for instance namespace
		for (Object o : program.getRootElement().getAdditionalNamespaces()) {
			Namespace nsx = (Namespace)o;
			if (nsx.getURI().equals(ns.getURI())) {
				ns = nsx;
				break;
			}
		}
				
		// Interact with the XSL(T) namespace
		Namespace xsl = Namespace.getNamespace("http://www.w3.org/1999/XSL/Transform");
				
		// Iterate over all XSL(T) elements		
		Iterator<?> elems = 
				program.getDescendants(new ElementFilter(xsl));
		
		while (elems.hasNext()) {
			
			Element elem = (Element)(elems.next());
			
			// Handle matches for the old element
			Attribute match = elem.getAttribute("match");
			if (match != null
			&& match.getValue().equals(ns.getPrefix() + ":" + oldName)) {
				elem.setAttribute("match", ns.getPrefix() + ":"+ newName);
				continue;
			}

			// Handle selections that refers to the old element
			Attribute select = elem.getAttribute("select");
			if (select != null) {
				String pattern = ns.getPrefix() + ":" + oldName;
				String oldValue = select.getValue();
				String newValue = oldValue.replaceAll(pattern, ns.getPrefix() + ":"+ newName);
				if (!newValue.equals(oldValue))
					elem.setAttribute("select", newValue);					
				continue;				
			}
		}
	}
}
