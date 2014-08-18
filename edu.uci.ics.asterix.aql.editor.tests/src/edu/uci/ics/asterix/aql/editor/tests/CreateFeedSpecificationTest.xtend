// CreateFeedSpecificationTest.java
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
class CreateFeedSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_FEED_SPECIFICATION = '''
        create feed «FEED_NAME» using
        «ADAPTER_NAME» «CONFIGURATION»;
    '''
    val VALID_CREATE_FEED_SPECIFICATION_IF_NOTEXISTS = '''
        create feed «FEED_NAME» if not exists using
        «ADAPTER_NAME» «CONFIGURATION»;
    '''

//    val VALID_CREATE_FEED_SPECIFICATION_IF_NOTEXISTS = '''
//        create feed «FEED_NAME»  using
//        «ADAPTER_NAME» «CONFIGURATION»;
//    '''


    @Test
    def void givenValidCreateFeedSpecification_thenNoErrors() {
        VALID_CREATE_FEED_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateFeedSpecificationIfNotExists_thenNoErrors() {
        VALID_CREATE_FEED_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // CreateFeedSpecificationTest
