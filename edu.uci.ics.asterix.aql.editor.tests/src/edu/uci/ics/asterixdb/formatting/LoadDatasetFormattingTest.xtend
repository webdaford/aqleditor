package edu.uci.ics.asterixdb.formatting

import edu.uci.ics.asterixdb.formatting.AbstractAQLEditorFormattingTest

import edu.uci.ics.asterixdb.AQLInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class LoadDatasetFormattingTest extends AbstractAQLEditorFormattingTest {
		val VALID_LOAD_DATASET_UNFORMATTED0 = '''
		load dataset Customers 
using "edu.uci.ics.asterix.external.dataset.adapter.NCFileSystemAdapter"
(("path"="nc1://data/custord-tiny/customer-tiny.adm"),("format"="adm")) pre-sorted;

	'''

	val VALID_LOAD_DATASET_FORMATTED0 = '''

load dataset Customers using "edu.uci.ics.asterix.external.dataset.adapter.NCFileSystemAdapter" (("path" =
"nc1://data/custord-tiny/customer-tiny.adm"), ("format" = "adm")) pre-sorted;'''

	@Test
	def void givenUnformattedLoadDataset0_thenCorrectFormatting() {
		VALID_LOAD_DATASET_UNFORMATTED0.assertFormattedAs(
			VALID_LOAD_DATASET_FORMATTED0
		)
	}
} // LoadDatasetFormattingTest