// LoadStatementTest.java
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
import org.junit.Ignore

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class LoadStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_LOAD_STATEMENT = '''
     load dataset «DATASET_NAME» using «ADAPTER_NAME» «CONFIGURATION»;
    '''
    @Ignore
    @Test
    def void givenValidLoadStatement_thenNoErrors() {
        VALID_LOAD_STATEMENT.parse.assertNoErrors
    }
} // LoadStatementTest
