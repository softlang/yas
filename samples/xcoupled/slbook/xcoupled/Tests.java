package slbook.xcoupled;

import java.io.File;
import java.io.IOException;

import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.Namespace;
import org.junit.Before;
import org.junit.Test;

import slbook.xcoupled.RenameElementName;
import slbook.xcoupled.xml.RenameElementNameXML;
import slbook.xcoupled.xsd.RenameElementNameXSD;
import slbook.xcoupled.xslt.RenameElementNameXSLT;
import static slbook.xcoupled.JDOMUtilities.*;

public class Tests {
	
	RenameElementName<Document> xmlLevel;
	RenameElementName<Document> xsdLevel;
	RenameElementName<Document> xsltLevel;
	
	@Before
	public void createTransformations() {
		xmlLevel = new RenameElementNameXML();
		xsdLevel = new RenameElementNameXSD();
		xsltLevel = new RenameElementNameXSLT();		
	}
	
	// The namespace of the example used in the tests
	private static final Namespace ns = 
			Namespace.getNamespace("http://www.softlang.org/company.xsd");
	
	@Test
	public void testXML() throws JDOMException, IOException {
		Document doc = load("input" + File.separator + "sampleCompany.xml");
		xmlLevel.transform(ns, "salary", "income", doc);
		saveAs(doc, "output" + File.separator + "sampleCompany.xml");
	}

	@Test
	public void testXSD() throws JDOMException, IOException {
		Document schema = load("input" + File.separator + "Company.xsd");
		xmlLevel.transform(ns, "salary", "income", schema);
		saveAs(schema, "output" + File.separator + "Company.xsd");
	}

	@Test
	public void testXSLT1() throws JDOMException, IOException {
		Document program = load("input" + File.separator + "cut.xslt");
		xsltLevel.transform(ns, "salary", "income", program);
		saveAs(program, "output" + File.separator + "cut.xslt");
	}

	@Test
	public void testProgramLevel2() throws JDOMException, IOException {
		Document program = load("input" + File.separator + "total.xslt");
		xsltLevel.transform(ns, "salary", "income", program);
		saveAs(program, "output" + File.separator + "total.xslt");
	}

	@Test
	public void testProgramLevel3() throws JDOMException, IOException {
		Document program = load("input" + File.separator + "depth.xslt");
		xsltLevel.transform(ns, "salary", "income", program);
		saveAs(program, "output" + File.separator + "depth.xslt");
	}	
}
