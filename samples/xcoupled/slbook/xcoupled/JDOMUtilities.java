package slbook.xcoupled;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.jdom.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;

/**
 * Utilities methods for using the JDOM API
 */
public class JDOMUtilities {
	public static Document load(String ifile) throws JDOMException, IOException {
		return new SAXBuilder().build(new File(ifile));
	}
	
	public static void saveAs(Document doc, String ofile) throws IOException {
		FileWriter writer = new FileWriter(ofile);
        new XMLOutputter().output(doc, writer);
        writer.flush();
        writer.close();		
	}			
}
