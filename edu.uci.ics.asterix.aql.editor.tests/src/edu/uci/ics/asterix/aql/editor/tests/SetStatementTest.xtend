// SetStatementTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.SetStatement
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
class SetStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val KEY = "key2"
    val VALUE = "\"value\""

    val VALID_SET_STATEMENT1 = '''set «KEY» «VALUE»;'''

    @Test
    def void givenValidSetStatement_thenNoErrors() {
        VALID_SET_STATEMENT1.parse.assertNoErrors
    }

    @Test
    def void givenValidSetStatement_withIdentifierLiteralName_thenParsedNameIsCorrect() {
        val stmts = VALID_SET_STATEMENT1.parse
        val ss = stmts.decls.get(0) as SetStatement
        Assert::assertEquals(KEY, ss.name.name);
    }

    @Test
    def void givenValidSetStatement_withStringLiteralValue_thenParsedValueIsCorrect() {
        val stmts = VALID_SET_STATEMENT1.parse
        val ss = stmts.decls.get(0) as SetStatement
        Assert::assertEquals(VALUE, ss.pv);
    }
} // SetStatementTest
