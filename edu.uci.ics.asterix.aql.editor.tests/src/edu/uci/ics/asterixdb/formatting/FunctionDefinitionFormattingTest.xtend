package edu.uci.ics.asterixdb.formatting

import edu.uci.ics.asterixdb.AQLInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class FunctionDefinitionFormattingTest extends AbstractAQLEditorFormattingTest {

	val VALID_FUNCTION_DECLARATION_UNFORMATTED0 = '''
		declare    function «FUNCTION_NAME»(){
			2   
			+2
		};
	'''

	// This doesn't seem right.  Shouldn't it be formatted across multiple lines?
	val VALID_FUNCTION_DECLARATION_FORMATTED0 = '''
declare function «FUNCTION_NAME» () {
2 + 2
};'''

	@Test
	def void givenUnformattedFunctionDefinition_thenCorrectFormatting() {
		VALID_FUNCTION_DECLARATION_UNFORMATTED0.assertFormattedAs(
			VALID_FUNCTION_DECLARATION_FORMATTED0
		)
	}
} // FunctionDefinitionFormattingTest
