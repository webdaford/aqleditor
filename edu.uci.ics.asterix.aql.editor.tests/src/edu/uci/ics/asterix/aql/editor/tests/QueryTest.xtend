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
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith

import static edu.uci.ics.asterix.aql.editor.tests.TestConstants.*

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class QueryTest {
	@Inject extension ParseHelper<Statements>;
	@Inject extension ValidationTestHelper

	@Test
	def void givenValidOperatorExpressions_thenNoErrors() {
		'''true or false;'''.parse.assertNoErrors
		'''1>2 or 3=4;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidAndExpressions_thenNoErrors() {
		'''true and false;'''.parse.assertNoErrors
		'''1>2 and 3=4;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidRelationalExpressions_thenNoErrors() {
		'''1<1;'''.parse.assertNoErrors
		'''1>1;'''.parse.assertNoErrors
		'''1<=1;'''.parse.assertNoErrors
		'''1>=1;'''.parse.assertNoErrors
		'''1=1;'''.parse.assertNoErrors
		'''1!=1;'''.parse.assertNoErrors
		'''1~=1;'''.parse.assertNoErrors

//		'''1=+1;'''.parse.assertNoErrors
//		'''-1=-1;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidAddExpressions_thenNoErrors() {
		'''1+1;'''.parse.assertNoErrors
		'''1-1;'''.parse.assertNoErrors
		'''1+2;'''.parse.assertNoErrors
//		'''+1+2;'''.parse.assertNoErrors
//		'''-1+2;'''.parse.assertNoErrors
//		'''1+-2;'''.parse.assertNoErrors
//		'''+1-+2;'''.parse.assertNoErrors

		'''1*1;'''.parse.assertNoErrors
//		'''1*+1;'''.parse.assertNoErrors
//		'''1*+-1;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidMultExpressions_thenNoErrors() {
		'''1*1;'''.parse.assertNoErrors
		'''1/1;'''.parse.assertNoErrors
		'''1%1;'''.parse.assertNoErrors
		'''1^1;'''.parse.assertNoErrors
		'''1 idiv 1;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidUnionExpressions_thenNoErrors() {
		'''1 union 1;'''.parse.assertNoErrors
//		'''1 union -1;'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidUnaryExpressions_thenNoErrors() {
		'''1;'''.parse.assertNoErrors
		'''+1;'''.parse.assertNoErrors
		'''-1;'''.parse.assertNoErrors
		'''++1;'''.parse.assertNoErrors
		'''--1;'''.parse.assertNoErrors
		'''-+1;'''.parse.assertNoErrors
		'''+-1;'''.parse.assertNoErrors

		'''+1;'''.parse.assertNoErrors
		'''-1;'''.parse.assertNoErrors
		'''++1;'''.parse.assertNoErrors
		'''--1;'''.parse.assertNoErrors
		'''-+1;'''.parse.assertNoErrors
		'''+-1;'''.parse.assertNoErrors
		'''+++1;'''.parse.assertNoErrors
		'''---1;'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidValueExpressions_thenNoErrors() {
		'''foo.bar;'''.parse.assertNoErrors

	//        '''foo.bar[2];'''.parse.assertNoErrors
	}

	@Test
	def void givenValidFunctionCallExpressions_thenNoErrors() {
		'''foo();'''.parse.assertNoErrors
		'''foo(2);'''.parse.assertNoErrors
		'''foo(2,1+3);'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidStringLiteralExpressions_thenNoErrors() {
		'''"string literal";'''.parse.assertNoErrors
		'''"string-literal";'''.parse.assertNoErrors
		'''"string1234literal";'''.parse.assertNoErrors

		'''"\" foo \" ";'''.parse.assertNoErrors
	}

	@Test
	def void givenValidIntegerLiteralExpressions_thenNoErrors() {
		'''1;'''.parse.assertNoErrors
		'''10;'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidFloatLiteralExpressions_thenNoErrors() {
		'''1.f;'''.parse.assertNoErrors
		'''10.0F;'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidDoubleLiteralExpressions_thenNoErrors() {
		'''1.;'''.parse.assertNoErrors
		'''10.0;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidNullLiteralExpressions_thenNoErrors() {
		'''null;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidBooleanLiteralExpressions_thenNoErrors() {
		'''true;'''.parse.assertNoErrors
		'''false;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidDatasetAccessExpressions_thenNoErrors() {
		'''dataset «DATASET_NAME»;'''.parse.assertNoErrors
		'''dataset «QUALIFIED_DATASET_NAME»;'''.parse.assertNoErrors

		'''dataset (2);'''.parse.assertNoErrors
		'''dataset (2);'''.parse.assertNoErrors
	}

	@Test
	def void givenValidVariableReferenceExpressions_thenNoErrors() {
		'''«VARIABLE0»;'''.parse.assertNoErrors
	}

	@Test
	def void givenValidListConstructorExpressions_thenNoErrors() {

		// Ordered
		'''[];'''.parse.assertNoErrors
		'''[2];'''.parse.assertNoErrors
		'''[2,1];'''.parse.assertNoErrors

		// Unordered
		'''{{}};'''.parse.assertNoErrors
		'''{{2}};'''.parse.assertNoErrors
		'''{{2,1}};'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void givenValidRecordConstructorExpressions_thenNoErrors() {
		'''{};'''.parse.assertNoErrors
		'''{foo: 2};'''.parse.assertNoErrors
	}

	@Test
	def void givenValidParenthesizedExpressions_thenNoErrors() {
		'''(1);'''.parse.assertNoErrors
		'''((1));'''.parse.assertNoErrors
	}

	@Test
	def void givenIfThenElseExpressions_thenNoErrors() {
		'''if ( 2 > 3) then 4 else 5;'''.parse.assertNoErrors
	}

	// Needs much more coverage DAF
	@Test
	def void givenFLWOGRExpressions_thenNoErrors() {

		// For
		'''for «VARIABLE0» in 2 return 4;'''.parse.assertNoErrors
		'''for «VARIABLE0» in 2 for «VARIABLE1» in 3 return 4;'''.parse.assertNoErrors
		'''for «VARIABLE0» in 2 let «VARIABLE1» := 3 return 4;'''.parse.assertNoErrors

		'''for «VARIABLE0» at «VARIABLE1» in 2 return 4;'''.parse.assertNoErrors

		// Let
		'''let «VARIABLE0» := 2 return 4;'''.parse.assertNoErrors
	}

	@Ignore
	@Test
	def void giveValidQuantifiedExpressions_thenNoErrors() {

		// Some
		'''some «VARIABLE0» in 2 satisfies 4;'''.parse.assertNoErrors
		'''some «VARIABLE0» in 2, «VARIABLE1» in 6 satisfies 4;'''.parse.assertNoErrors

		// Every
		'''every «VARIABLE0» in 2 satisfies 4;'''.parse.assertNoErrors
		'''every «VARIABLE0» in 2, «VARIABLE1» in 6 satisfies 4;'''.parse.assertNoErrors
	}
} // QueryTest
