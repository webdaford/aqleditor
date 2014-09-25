/*
 * Copyright 2014 by Dell Inc. and others.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * you may obtain a copy of the License from
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package edu.uci.ics.asterix.aql.editor.tests

import com.google.inject.Inject
import edu.uci.ics.asterixdb.AQLInjectorProvider
import edu.uci.ics.asterixdb.aqlmodel.DataverseDeclaration
import edu.uci.ics.asterixdb.aqlmodel.Statements
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*
import org.eclipse.xtext.junit4.validation.ValidationTestHelper

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class DataverseDeclarationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_DATAVERSE_DECLARATION_IDENTIFIER = '''
        use dataverse «DATAVERSE_NAME»;
    '''

    val VALID_DATAVERSE_DECLARATION_STRING_LITERAL = '''
        use dataverse «DATAVERSE_NAME_AS_STRING_LITERAL»;
    '''

    @Test
    def void givenValidDataverseDeclaration_withIdentifierLiteralName_thenNoErrors() {
        VALID_DATAVERSE_DECLARATION_IDENTIFIER.parse.assertNoErrors
    }

    @Test
    def void givenValidDataverseDeclaration_withIdentifierLiteralName_thenParsedNameIsCorrect() {
        val stmts = VALID_DATAVERSE_DECLARATION_IDENTIFIER.parse

        val dvd = stmts.decls.get(0) as DataverseDeclaration
        Assert::assertEquals(DATAVERSE_NAME, dvd.dataverse.identifierName);
    }

    @Test
    def void givenValidDataverseDeclaration_withStringLiteralName_thenNoErrors() {
        VALID_DATAVERSE_DECLARATION_STRING_LITERAL.parse.assertNoErrors
    }

    @Test
    def void givenValidDataverseDeclaration_withStringLiteralName_thenParsedNameIsCorrect() {
        val stmts = VALID_DATAVERSE_DECLARATION_STRING_LITERAL.parse

        val dvd = stmts.decls.get(0) as DataverseDeclaration
        Assert::assertEquals(DATAVERSE_NAME_AS_STRING_LITERAL, dvd.dataverse.identifierName);
    }

} // DataverseDeclarationTest
