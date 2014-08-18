// CreateDataverseSpecificationTest.java
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
class CreateDataverseSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_DATAVERSE_SPECIFICATION = '''
        create dataverse «DATAVERSE_NAME» 
        with format "foo";
    '''

    val VALID_CREATE_DATAVERSE_SPECIFICATION_IF_NOTEXISTS = '''
        create dataverse «DATAVERSE_NAME» 
        if not exists
        with format "foo";
    '''

    @Test
    def void givenValidCreateDataverseSpecification_thenNoErrors() {
        VALID_CREATE_DATAVERSE_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateDataverseSpecificationIfNotExists_thenNoErrors() {
        VALID_CREATE_DATAVERSE_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // CreateDataverseSpecificationTest
