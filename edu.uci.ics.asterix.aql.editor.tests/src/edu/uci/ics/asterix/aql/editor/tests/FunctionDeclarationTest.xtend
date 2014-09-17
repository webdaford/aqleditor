// FunctionDeclarationTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.FunctionDeclaration
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class FunctionDeclarationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper
    val FUNCTION_NAME = "foo"

    val VALID_FUNCTION_DECLARATION = '''
        declare function «FUNCTION_NAME»(){2+2};
    '''

    @Test
    def void givenValidFunctionDeclaration_thenNoErrors() {
        VALID_FUNCTION_DECLARATION.parse.assertNoErrors
    }

    @Test
    def void givenValidFunctionDeclaration_withEmptyParametersAndBody_thenParsedNameIsCorrect() {
        val stmts = VALID_FUNCTION_DECLARATION.parse

        val fd = stmts.decls.get(0) as FunctionDeclaration
        Assert::assertEquals(FUNCTION_NAME, fd.name.identifierName);
    }

} // FunctionDeclarationTest
