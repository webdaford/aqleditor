// FeedStatementTest.java
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
class FeedStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CONNECT_FEED_STATEMENT = '''
        connect feed «FEED_NAME» to dataset «DATASET_NAME»;
    '''

    val VALID_DISCONNECT_FEED_STATEMENT = '''
        disconnect feed «FEED_NAME» from dataset «DATASET_NAME»;
    '''

    @Test
    def void givenValidConnectFeedStatement_thenNoErrors() {
        VALID_CONNECT_FEED_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDisconnectFeedStatement_thenNoErrors() {
        VALID_DISCONNECT_FEED_STATEMENT.parse.assertNoErrors
    }
} // FeedStatementTest
