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
package edu.uci.ics.asterixdb.formatting
import edu.uci.ics.asterixdb.formatting.AbstractAQLEditorFormattingTest
import edu.uci.ics.asterixdb.AQLInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class CreateDatasetFormattingTest extends AbstractAQLEditorFormattingTest {
	val VALID_CREATE_DATASET_UNFORMATTED0 = '''
		create dataset 
		   Customers(CustomerType) 
		primary key 
		cid on group1;
	'''

	val VALID_CREATE_DATASET_FORMATTED0 = '''

create dataset Customers (CustomerType)
 primary key cid on group1;'''

	@Test
	def void givenUnformattedLoadDataset0_thenCorrectFormatting() {
		VALID_CREATE_DATASET_UNFORMATTED0.assertFormattedAs(
			VALID_CREATE_DATASET_FORMATTED0
		)
	}
} // CreateDatasetFormattingTest
