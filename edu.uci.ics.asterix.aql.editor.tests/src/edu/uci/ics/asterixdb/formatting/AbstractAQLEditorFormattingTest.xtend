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
