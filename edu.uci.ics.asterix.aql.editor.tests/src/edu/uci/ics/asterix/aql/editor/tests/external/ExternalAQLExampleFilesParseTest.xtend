/*
 * Copyright 2014 by Dell Inc. and others.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * you may obtain a copy of the License from
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.uci.ics.asterix.aql.editor.tests.external

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.Statements
import java.io.File
import java.nio.charset.Charset
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.util.Arrays
import java.util.HashSet
import java.util.Set
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class ExternalAQLExampleFilesParseTest {
	@Inject extension ParseHelper<Statements>;
	@Inject extension ValidationTestHelper

	val PROJECT = "edu.uci.ics.asterix.aql.editor.aqlexamples"
	val PROJECT_ROOT = ".."
	val FILE_ROOT = "src/test/resources"

	val FOLDERS_TO_SKIP = new HashSet<String>(Arrays.asList("runtimets", "metadata"))
	val SUFFIXES_TO_SKIP = new HashSet<String>(Arrays.asList("xml", "properties", "ps", "txt", "plan"))

	var Set<String> successFullyParsedFiles = new HashSet<String>();

	var fileCount = 0
	var errorCount = 0

	@Test
	def void givenExistingAQLExamples_whenParsed_thenNoParseErrors() {
		parseFilesInFolder(
			Paths.get(
				PROJECT_ROOT + File.separator + PROJECT + File.separator + FILE_ROOT
			))

		System.out.println("Files parsed:\t" + fileCount)
		System.out.println("Errors:\t\t" + errorCount)
		System.out.println("Success:\t" + (fileCount - errorCount))
		System.out.println
		System.out.println("Successfully parsed files are:")
		successFullyParsedFiles.forEach[println(it)]
	}

	def void parseFilesInFolder(Path path) {

		// Is this a file?
		if (Files.isRegularFile(path) && !SUFFIXES_TO_SKIP.contains(getExtension(path.fileName))) {

			// Yes
			fileCount++
			try {
				parseFile(path)
				successFullyParsedFiles.add(removePrefix(path.toString, FILE_ROOT))
			} catch (AssertionError ae) {

				// Parse error
				errorCount++
			}
		} 
		// Is it a folder?
		else if (Files.isDirectory(path) && !FOLDERS_TO_SKIP.contains(path.fileName.toString)) {

			// Yes
			Files.newDirectoryStream(path).iterator.forEach[parseFilesInFolder]
		}

	}

	def removePrefix(String string, String prefix) {
		val i = string.lastIndexOf(prefix) + prefix.length
		return string.substring(i)
	}

	// parseFilesInFolder
	def getExtension(Path path) {
		val fileName = path.fileName.toString
		val i = fileName.lastIndexOf(".")
		return fileName.substring(i + 1)
	}

	// parseFilesInFolder
	def void parseFile(Path path) {
		try {
			readFileAsString(path, StandardCharsets.UTF_8).parse.assertNoErrors
		} // try
		catch (AssertionError ae) {
			throw new AssertionError("File \"" + path + "\" " + ae.message, ae)
		} catch (NullPointerException npe) {
			System.out.println("NPE for " + path)
		}
	} // parseFile

	def String readFileAsString(Path path, Charset encoding) {
		val retValue = new String(Files.readAllBytes(path), encoding);
		return retValue
	}

} // ExternalAQLExampleFilesParseTest
