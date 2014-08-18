// CreateDatasetSpecificationTest.java
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class CreateDatasetSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_DATASET_SPECIFICATION = '''
        create dataset «DATASET_NAME» («TYPE_NAME»)
          primary key «PRIMARY_KEY» ;
    '''

    val VALID_CREATE_EXTERNAL_DATASET_SPECIFICATION = '''
        create external dataset «DATASET_NAME» («TYPE_NAME») using «ADAPTER_NAME» «CONFIGURATION»;
    '''

    @Test
    def void givenValidCreateDatasetSpecification_thenNoErrors() {
        VALID_CREATE_DATASET_SPECIFICATION.parse.assertNoErrors
    }

    @Ignore
    @Test
    def void givenValidCreateExternalDatasetSpecification_thenNoErrors() {
        VALID_CREATE_EXTERNAL_DATASET_SPECIFICATION.parse.assertNoErrors
    }
} // CreateDatasetSpecificationTest
