package org.softlang.fsml.tests;

import org.junit.Test;
import org.softlang.fsml.*;
import static org.softlang.fsml.FsmlCGenerator.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import static org.junit.Assert.assertEquals;

public class CGeneratorTest {

	@Test
	public void generateCodeForSample() throws IOException {
		Fsm f = FunctionalSample.turnstile;
		Path p = Paths.get("org", "softlang", "fsml", "tests", "Turnstile.c");
		String actual = generateC(f);
		String expected = new String(Files.readAllBytes(p));
		System.out.println(actual);
		System.out.println(expected);
		assertEquals(expected, actual);
	}
}
