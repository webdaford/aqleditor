package edu.uci.ics.asterixdb.formatting

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.formatting.INodeModelFormatter
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.resource.XtextResource
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*

import static extension org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class FunctionDefinitionFormattingTest {

	@Inject extension ParseHelper<Statements>;
	@Inject extension INodeModelFormatter;

	def void assertFormattedAs(CharSequence input, CharSequence expected) {
		expected.toString.assertEquals(
			(input.parse.eResource as XtextResource).parseResult.rootNode.format(0, input.length).formattedText)
	}

	val VALID_FUNCTION_DECLARATION_UNFORMATTED0 = '''
		declare    function «FUNCTION_NAME»(){
			2   
			+2
		};
	'''

	// This doesn't seem right.  Shouldn't it be formatted across multiple lines?
	val VALID_FUNCTION_DECLARATION_FORMATTED0 = '''declare function «FUNCTION_NAME» ( ) { 2 + 2 };'''

	@Test
	def void givenUnformattedFunctionDefinition_thenCorrectFormatting() {
		VALID_FUNCTION_DECLARATION_UNFORMATTED0.assertFormattedAs(
			VALID_FUNCTION_DECLARATION_FORMATTED0
		)
	}
} // FunctionDefinitionFormattingTest
