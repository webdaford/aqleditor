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
package edu.uci.ics.asterixdb.formatting 
import com.google.inject.Inject
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.formatting.INodeModelFormatter
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.resource.XtextResource
import static extension org.junit.Assert.*
class AbstractAQLEditorFormattingTest {
	@Inject extension ParseHelper<Statements>;
	@Inject extension INodeModelFormatter;

	def void assertFormattedAs(CharSequence input, CharSequence expected) {
		expected.toString.assertEquals(
			(input.parse.eResource as XtextResource).parseResult.rootNode.format(0, input.length).formattedText)
	}
} // AbstractAQLEditorFormattingTest
