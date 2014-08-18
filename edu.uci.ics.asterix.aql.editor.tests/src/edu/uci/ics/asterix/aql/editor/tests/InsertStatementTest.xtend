// InsertStatementTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.InsertStatement
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
class InsertStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_INSERT_STATEMENT = '''
        insert into dataset «DATASET_NAME» 2;
    '''

    @Test
    def void givenValidInsertStatement_thenNoErrors() {
        VALID_INSERT_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidInsertStatement_withQualifiedName_thenParsedNameIsCorrect() {
        val stmts = VALID_INSERT_STATEMENT.parse

        val is = stmts.decls.get(0) as InsertStatement
        Assert::assertEquals(DATASET_NAME, is.name.first.name);
    }
} // InsertStatementTest
