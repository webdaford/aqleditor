// DropStatementTest.java
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
class DropStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_DROP_DATASET_STATEMENT = '''drop dataset «DATASET_NAME»;
        '''

    val VALID_DROP_DATASET_STATEMENT_IF_EXISTS = '''drop dataset «DATASET_NAME» if exists;
        '''

    val VALID_DROP_INDEX_STATEMENT = '''drop index «DOUBLE_INDEX_NAME»;
        '''

    val VALID_DROP_INDEX_STATEMENT_IF_EXISTS = '''drop index «DOUBLE_INDEX_NAME» if exists;
        '''

    val VALID_DROP_NODEGROUP_STATEMENT = '''drop nodegroup «NODEGROUP_NAME»;
        '''

    val VALID_DROP_NODEGROUP_STATEMENT_IF_EXISTS = '''drop nodegroup «NODEGROUP_NAME» if exists;
        '''

    val VALID_DROP_TYPE_STATEMENT = '''drop type «TYPE_NAME»;
        '''
    val VALID_DROP_TYPE_STATEMENT_IF_EXISTS = '''drop type «TYPE_NAME» if exists;
        '''

    val VALID_DROP_DATAVERSE_STATEMENT = '''drop dataverse «DATAVERSE_NAME»;
        '''
    val VALID_DROP_DATAVERSE_STATEMENT_IF_EXISTS = '''drop dataverse «DATAVERSE_NAME» if exists;
        '''

    val VALID_DROP_FUNCTION_STATEMENT = '''drop function «FUNCTION_NAME» @ 2;
        '''
    val VALID_DROP_FUNCTION_STATEMENT_IF_EXISTS = '''drop function «FUNCTION_NAME» @ 2 if exists;
        '''

    val VALID_DROP_FEED_STATEMENT = '''drop feed «DATASET_NAME»;
        '''

    val VALID_DROP_FEED_STATEMENT_IF_EXISTS = '''drop feed «DATASET_NAME» if exists;
        '''

    //-----------------------------------------------------------------
    
    @Test
    def void givenValidDropDatasetStatement_thenNoErrors() {
        VALID_DROP_DATASET_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropDatasetStatementIfExists_thenNoErrors() {
        VALID_DROP_DATASET_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropIndexStatement_thenNoErrors() {
        VALID_DROP_INDEX_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropIndexStatementIfExists_thenNoErrors() {
        VALID_DROP_INDEX_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropNodeGroupStatement_thenNoErrors() {
        VALID_DROP_NODEGROUP_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropNodegroupStatementIfExists_thenNoErrors() {
        VALID_DROP_NODEGROUP_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropTypeStatement_thenNoErrors() {
        VALID_DROP_TYPE_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropTypeStatementIfExists_thenNoErrors() {
        VALID_DROP_TYPE_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropDataverseStatement_thenNoErrors() {
        VALID_DROP_TYPE_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropDataverseStatementIfExists_thenNoErrors() {
        VALID_DROP_TYPE_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropFunctionStatement_thenNoErrors() {
        VALID_DROP_FUNCTION_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropFunctionStatementIfExists_thenNoErrors() {
        VALID_DROP_FUNCTION_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }

    @Test
    def void givenValidDropFeedStatement_thenNoErrors() {
        VALID_DROP_FEED_STATEMENT.parse.assertNoErrors
    }

    @Test
    def void givenValidDropFeedStatementIfExists_thenNoErrors() {
        VALID_DROP_FEED_STATEMENT_IF_EXISTS.parse.assertNoErrors
    }
} // DropStatementTest
