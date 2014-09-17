package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.DataverseDeclaration
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*
import org.eclipse.xtext.junit4.validation.ValidationTestHelper

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class DataverseDeclarationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_DATAVERSE_DECLARATION_IDENTIFIER = '''
        use dataverse «DATAVERSE_NAME»;
    '''

    val VALID_DATAVERSE_DECLARATION_STRING_LITERAL = '''
        use dataverse «DATAVERSE_NAME_AS_STRING_LITERAL»;
    '''

    @Test
    def void givenValidDataverseDeclaration_withIdentifierLiteralName_thenNoErrors() {
        VALID_DATAVERSE_DECLARATION_IDENTIFIER.parse.assertNoErrors
    }

    @Test
    def void givenValidDataverseDeclaration_withIdentifierLiteralName_thenParsedNameIsCorrect() {
        val stmts = VALID_DATAVERSE_DECLARATION_IDENTIFIER.parse

        val dvd = stmts.decls.get(0) as DataverseDeclaration
        Assert::assertEquals(DATAVERSE_NAME, dvd.dataverse.identifierName);
    }

    @Test
    def void givenValidDataverseDeclaration_withStringLiteralName_thenNoErrors() {
        VALID_DATAVERSE_DECLARATION_STRING_LITERAL.parse.assertNoErrors
    }

    @Test
    def void givenValidDataverseDeclaration_withStringLiteralName_thenParsedNameIsCorrect() {
        val stmts = VALID_DATAVERSE_DECLARATION_STRING_LITERAL.parse

        val dvd = stmts.decls.get(0) as DataverseDeclaration
        Assert::assertEquals(DATAVERSE_NAME_AS_STRING_LITERAL, dvd.dataverse.identifierName);
    }

} // DataverseDeclarationTest
