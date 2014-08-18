// CreateTypeSpecificationTest.java
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
class CreateTypeSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_TYPE_SPECIFICATION = '''
        create type «TYPE_NAME» as {};
    '''

    val VALID_CREATE_TYPE_SPECIFICATION_IF_NOTEXISTS = '''
        create type «TYPE_NAME» if not exists as {};
    '''

    @Test
    def void givenValidCreateTypeSpecification_thenNoErrors() {
        VALID_CREATE_TYPE_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateTypeSpecificationIfNotExists_thenNoErrors() {
        VALID_CREATE_TYPE_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // CreateTypeSpecificationTest
