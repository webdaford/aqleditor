// UpdateStatementTest.java
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
class UpdateStatementTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_UPDATE_STATEMENT = '''
        update «VARIABLE0» in $b
        where $a (set «VARIABLE0» := "qqq"());
    '''
    @Test
    def void givenValidUpdateStatement_thenNoErrors() {
        VALID_UPDATE_STATEMENT.parse.assertNoErrors
    }
} // UpdateStatementTest
