package edu.uci.ics.asterixdb.formatting

import edu.uci.ics.asterixdb.AQLInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class CreateTypeFormattingTest extends AbstractAQLEditorFormattingTest {

	val VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED0 = '''
		create type AddressType as open {   number: int32, 
		 street: string,   city: string }
	'''

	val VALID_CREATE_TYPE_NO_SEMICOLON_FORMATTED0 = '''

create type AddressType  as open {
	number : int32,
	street : string,
	city : string
}'''

	val VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED1 = '''
		create type CustomerType as open {
		cid: int32,   name: string,
		age: int32?,   address: AddressType?,
		lastorder: {     oid: int32,
		  total: float   } }
	'''

	val VALID_CREATE_TYPE_NO_SEMICOLON_FORMATTED1 = '''

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

	val VALID_CREATE_TYPE_WITH_SEMICOLON_UNFORMATTED0 = '''«VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED0»;'''

	val VALID_CREATE_TYPE_WITH_SEMICOLON_FORMATTED0 = '''

create type AddressType  as open {
	number : int32,
	street : string,
	city : string
};'''

	val VALID_TWO_SUCCESSIVE_CREATE_TYPE_WITHOUT_SEMICOLONS_FORMATTED0 = '''

create type AddressType  as open {
	number : int32,
	street : string,
	city : string
}
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
	def void givenUnformattedCreateType0_withNoSemicolon_thenCorrectFormatting() {
		VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED0.assertFormattedAs(
			VALID_CREATE_TYPE_NO_SEMICOLON_FORMATTED0
		)
	}

	@Test
	def void givenUnformattedCreateType1_thenCorrectFormatting() {
		VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED1.assertFormattedAs(
			VALID_CREATE_TYPE_NO_SEMICOLON_FORMATTED1
		)
	}

	@Test
	def void givenUnformattedCreateType0_withASemicolon_thenCorrectFormatting() {
		VALID_CREATE_TYPE_WITH_SEMICOLON_UNFORMATTED0.assertFormattedAs(
			VALID_CREATE_TYPE_WITH_SEMICOLON_FORMATTED0
		)
	}

	@Test
	def void givenTwoSuccessiveUnformattedCreateType_withNoSemicolons_thenCorrectFormatting() {
		(VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED0 + VALID_CREATE_TYPE_NO_SEMICOLON_UNFORMATTED1 ).
			assertFormattedAs(VALID_TWO_SUCCESSIVE_CREATE_TYPE_WITHOUT_SEMICOLONS_FORMATTED0)
	}

} // CreateTypeFormattingTest
