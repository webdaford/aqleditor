package edu.uci.ics.asterixdb.formatting

import edu.uci.ics.asterixdb.AQLInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class CreateTypeFormattingTest extends AbstractAQLEditorFormattingTest {

	val VALID_CREATE_TYPE_UNFORMATTED0 = '''
		create type AddressType as open {   number: int32, 
		 street: string,   city: string }
	'''

	val VALID_CREATE_TYPE_FORMATTED0 = '''
create type AddressType  as open {
	number : int32,
	street : string,
	city : string
}'''

	val VALID_CREATE_TYPE_UNFORMATTED1 = '''
		create type CustomerType as open {
		cid: int32,   name: string,
		age: int32?,   address: AddressType?,
		lastorder: {     oid: int32,
		  total: float   } }
	'''

	val VALID_CREATE_TYPE_FORMATTED1 = '''
create type CustomerType  as open {
	cid : int32,
	name : string,
	age : int32?,
	address : AddressType?,
	lastorder : {
		oid : int32,
		total : float
	}
}'''

	@Test
	def void givenUnformattedCreateType0_thenCorrectFormatting() {
		VALID_CREATE_TYPE_UNFORMATTED0.assertFormattedAs(
			VALID_CREATE_TYPE_FORMATTED0
		)
	}

	@Test
	def void givenUnformattedCreateType1_thenCorrectFormatting() {
		VALID_CREATE_TYPE_UNFORMATTED1.assertFormattedAs(
			VALID_CREATE_TYPE_FORMATTED1
		)
	}

} // CreateTypeFormattingTest
