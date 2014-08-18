// WriteStatementTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class WriteStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_WRITE_STATEMENT = '''
        write output to «DATASET_NAME» : «FILE_NAME_STRING_LITERAL»;
    '''

    @Test
    def void givenValidWriteStatement_thenNoErrors() {
        VALID_WRITE_STATEMENT.parse.assertNoErrors
    }
} // WriteStatementTest
