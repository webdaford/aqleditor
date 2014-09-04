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

	val VALID_CREATE_DATASET_FORMATTED0 = '''create dataset Customers ( CustomerType )
 primary key cid on group1;'''

	@Test
	def void givenUnformattedLoadDataset0_thenCorrectFormatting() {
		VALID_CREATE_DATASET_UNFORMATTED0.assertFormattedAs(
			VALID_CREATE_DATASET_FORMATTED0
		)
	}
} // CreateDatasetFormattingTest
