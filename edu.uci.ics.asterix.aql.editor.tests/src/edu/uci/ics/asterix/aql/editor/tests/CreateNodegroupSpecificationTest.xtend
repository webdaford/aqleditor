// CreateNodegroupSpecificationTest.java
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
class CreateNodegroupSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_NODEGROUP_SPECIFICATION = '''
        create nodegroup «NODEGROUP_NAME» on «NC_NAME0»;
    '''

    val VALID_VALID_CREATE_NODEGROUP_SPECIFICATION_IF_NOTEXISTS = '''
        create nodegroup «NODEGROUP_NAME» if not exists on «NC_NAME0»;
    '''

    @Test
    def void givenValidCreateNodegroupSpecification_thenNoErrors() {
        VALID_CREATE_NODEGROUP_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateNodegroupSpecificationIfNotExists_thenNoErrors() {
        VALID_VALID_CREATE_NODEGROUP_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // CreateNodegroupSpecificationTest
