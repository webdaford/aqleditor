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

import com.google.inject.Inject
import edu.uci.ics.asterixdb.services.AQLGrammarAccess
import org.eclipse.xtext.Keyword
import org.eclipse.xtext.formatting.impl.AbstractDeclarativeFormatter
import org.eclipse.xtext.formatting.impl.FormattingConfig
import org.eclipse.xtext.util.Pair

/**
 * This class contains custom formatting description.
 * 
 * see : http://www.eclipse.org/Xtext/documentation.html#formatting
 * on how and when to use it 
 * 
 * Also see {@link org.eclipse.xtext.xtext.XtextFormattingTokenSerializer} as an example
 */
class AQLFormatter extends AbstractDeclarativeFormatter {

	@Inject extension AQLGrammarAccess g

	override protected void configureFormatting(FormattingConfig c) {

		c.setAutoLinewrap(120);

		// Preserve newlines around comments
		c.setLinewrap(0, 1, 2).before(SL_COMMENTRule)
		c.setLinewrap(0, 1, 2).before(ML_COMMENTRule)
		c.setLinewrap(0, 1, 1).after(ML_COMMENTRule)

		// No space before ";"
		// Min 1, Max: 2, newlines after ";"
		for (Keyword semicolon : g.findKeywords(";")) {
			c.setNoSpace().before(semicolon)
			c.setLinewrap(1, 2, 2).after(semicolon)
		}

		// No space before ","
		for (Keyword comma : g.findKeywords(",")) {
			c.setNoSpace().before(comma)
		}

		// No space before "?"
		for (Keyword questionMark : g.findKeywords("?")) {
			c.setNoSpace().before(questionMark)
		}

		// No space before "."
		// No space after "."
		for (Keyword period : g.findKeywords(".")) {
			c.setNoSpace().before(period)
			c.setNoSpace().after(period)
		}

		// No space before "#"
		// No space after "#"
		for (Keyword octothorpe : g.findKeywords("#")) {
			c.setNoSpace().before(octothorpe)
			c.setNoSpace().after(octothorpe)
		}

		// Paired "(" and ")"
		// No space after ( or before )
		for (Pair<Keyword,Keyword> pair : g.findKeywordPairs("(", ")")) {
			c.setNoSpace().after(pair.getFirst());
			c.setNoSpace().before(pair.getSecond());
		}

		// Paired "{" and "}"
		// Newline after { and before }
		for (Pair<Keyword,Keyword> pair : g.findKeywordPairs("{", "}")) {
			c.setLinewrap().after(pair.getFirst());
			c.setLinewrap().before(pair.getSecond());
		}

		// Paired "{{" and "}}"
		// Space after {{ and before }}
		for (Pair<Keyword,Keyword> pair : g.findKeywordPairs("{{", "}}")) {
			c.setSpace(" ").after(pair.getFirst());
			c.setSpace(" ").before(pair.getSecond());
		}

		// Paired "[" and "]"
		// Space after [ and before ]
		for (Pair<Keyword,Keyword> pair : g.findKeywordPairs("[", "]")) {
			c.setSpace(" ").after(pair.getFirst());
			c.setSpace(" ").before(pair.getSecond());
		}

		// Statements
		//----------------------------------------------------
		//		val ss = g.statementsAccess
		// DataverseDeclaration
		//----------------------------------------------------
		val dvd = g.dataverseDeclarationAccess

		// Min:1, Max:2 , Newline before use
		c.setLinewrap(1, 2, 2).before(dvd.useKeyword_0)

		// FunctionSpecification
		//----------------------------------------------------
		val fs = g.functionSpecificationAccess

		// Indent functionBodyExpr
		c.setIndentation(fs.leftCurlyBracketKeyword_5, fs.rightCurlyBracketKeyword_7)

		// Create Statement
		//----------------------------------------------------
		val cs = g.createStatementAccess

		// Min:1, Max:2 , Newline before create
		c.setLinewrap(1, 2, 2).before(cs.createKeyword_0)

		// Create Dataset
		//----------------------------------------------------
		val cd = g.datasetSpecificationAccess

		// Newline after ")"
		c.setLinewrap().after(cd.rightParenthesisKeyword_1_6)

		// Load Statement
		//----------------------------------------------------
		val ls = g.loadStatementAccess

		// Min:1, Max:2 , Newline before load
		c.setLinewrap(1, 2, 2).before(ls.loadKeyword_0)

		// Drop Statement
		//----------------------------------------------------
		val ds = g.dropStatementAccess

		// Min:1, Max:2 , Newline before drop
		c.setLinewrap(1, 2, 2).before(ds.dropKeyword_0)

		// Write Statement
		//----------------------------------------------------
		val ws = g.writeStatementAccess

		// Min:1, Max:2 , Newline before write
		c.setLinewrap(1, 2, 2).before(ws.writeKeyword_0)

		// Set Statement
		//----------------------------------------------------
		val sets = g.setStatementAccess

		// Min:1, Max:2 , Newline before set
		c.setLinewrap(1, 2, 2).before(sets.setKeyword_0)

		// Insert Statement
		//----------------------------------------------------
		val is = g.insertStatementAccess

		// Min:1, Max:2 , Newline before insert
		c.setLinewrap(1, 2, 2).before(is.insertKeyword_0)

		// Delete Statement
		//----------------------------------------------------
		val dels = g.deleteStatementAccess

		// Min:1, Max:2 , Newline before delete
		c.setLinewrap(1, 2, 2).before(dels.deleteKeyword_0)

		// Update Statement
		//----------------------------------------------------
		val us = g.updateStatementAccess

		// Min:1, Max:2 , Newline before update
		c.setLinewrap(1, 2, 2).before(us.updateKeyword_0)

		// Feed Statement
		//----------------------------------------------------
		val feeds = g.feedStatementAccess

		// Min:1, Max:2 , Newline before feed
		c.setLinewrap(1, 2, 2).before(feeds.feedKeyword_0_1)

		// Compact Statement
		//----------------------------------------------------
		val compacts = g.feedStatementAccess

		// Min:1, Max:2 , Newline before compact
		c.setLinewrap(1, 2, 2).before(compacts.connectKeyword_0_0)

		// Refresh Statement
		//----------------------------------------------------
		val rs = g.refreshExternalDatasetStatementAccess

		// Min:1, Max:2 , Newline before compact
		c.setLinewrap(1, 2, 2).before(rs.refreshKeyword_0)

		// RecordTypeDef
		//----------------------------------------------------
		val rtda = g.recordTypeDefAccess

		// Indent RecordTypes
		c.setIndentation(rtda.leftCurlyBracketKeyword_2, rtda.rightCurlyBracketKeyword_4)

		// Newline after ","
		c.setLinewrap().after(rtda.getCommaKeyword_3_1_0())

	} // configureFormatting
} // AQLFormatter
