// FilterFieldTest.java
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

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class FilterFieldTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    @Ignore
    @Test
    def void givenValidCompactStatement_withQualifiedName_thenParsedQualifiedNameIsCorrect() {
        //        val ff = '''
        //            «DATAVERSE_NAME»;
        //        '''.parse
        //
        //        Assert::assertEquals(DATAVERSE_NAME, ff.name);
    }
} // FilterFieldTest
