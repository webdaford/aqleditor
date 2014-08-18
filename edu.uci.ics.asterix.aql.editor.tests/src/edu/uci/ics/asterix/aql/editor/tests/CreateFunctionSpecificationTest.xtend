// FunctionSpecificationTest.java
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
class CreateFunctionSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_FUNCTION_SPECIFICATION = '''
        create function «FUNCTION_NAME» 
        (){2};
    '''

    val VALID_CREATE_FUNCTION_SPECIFICATION_IF_NOTEXISTS = '''
        create function «FUNCTION_NAME» 
        if not exists
        (){2};
    '''

    @Test
    def void givenValidCreateFunctionSpecification_thenNoErrors() {
        VALID_CREATE_FUNCTION_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateFunctionIfNotExistsSpecification_thenNoErrors() {
        VALID_CREATE_FUNCTION_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // FunctionSpecificationTest
