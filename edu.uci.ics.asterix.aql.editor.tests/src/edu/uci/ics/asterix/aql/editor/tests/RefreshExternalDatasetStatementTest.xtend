// RefreshExternalDatasetStatementTest.java
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
class RefreshExternalDatasetStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_REFRESH_DATASET_STATEMENT = '''
        refresh external dataset «DATASET_NAME» ;
    '''

    @Test
    def void givenValidRefreshDatasetStatementNoErrors() {
        VALID_REFRESH_DATASET_STATEMENT.parse.assertNoErrors
    }
} // RefreshExternalDatasetStatementTest
