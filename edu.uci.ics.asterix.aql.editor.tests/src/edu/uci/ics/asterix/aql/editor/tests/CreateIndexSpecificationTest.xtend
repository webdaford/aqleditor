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
class CreateIndexSpecificationTest {
    @Inject extension ParseHelper<Statements>;
    @Inject extension ValidationTestHelper

    val VALID_CREATE_INDEX_SPECIFICATION = '''
        create index «INDEX_NAME» 
          on «NC_NAME0» 
          (foo);
    '''
    val VALID_CREATE_INDEX_SPECIFICATION_IF_NOTEXISTS = '''
        create index «INDEX_NAME» 
          if not exists
          on «NC_NAME0» 
          (foo);
    '''

    @Test
    def void givenValidCreateIndexSpecification_thenNoErrors() {
        VALID_CREATE_INDEX_SPECIFICATION.parse.assertNoErrors
    }

    @Test
    def void givenValidCreateIndexSpecificationIfNotExists_thenNoErrors() {
        VALID_CREATE_INDEX_SPECIFICATION_IF_NOTEXISTS.parse.assertNoErrors
    }
} // CreateIndexSpecificationTest
