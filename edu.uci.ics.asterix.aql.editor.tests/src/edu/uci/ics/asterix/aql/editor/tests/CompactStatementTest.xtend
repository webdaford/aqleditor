// CompactStatementTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.CompactStatement
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
class CompactStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_COMPACT_STATEMENT = '''
        compact dataset «DATASET_NAME»;
    '''

    @Test
    def void givenValidCompactStatement_thenNoErrors() {
        VALID_COMPACT_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidCompactStatement_withQualifiedName_thenParsedQualifiedNameIsCorrect() {
        val stmts = VALID_COMPACT_STATEMENT.parse

        val cs = stmts.decls.get(0) as CompactStatement
        Assert::assertEquals(DATASET_NAME, cs.nameComponents.first.identifierName);
    }
} // CompactStatementTest
