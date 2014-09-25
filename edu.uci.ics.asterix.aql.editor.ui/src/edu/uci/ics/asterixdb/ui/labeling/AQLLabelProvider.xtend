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
package edu.uci.ics.asterixdb.ui.labeling

import com.google.inject.Inject
import edu.uci.ics.asterixdb.aqlmodel.AddExpr
import edu.uci.ics.asterixdb.aqlmodel.AndExpr
import edu.uci.ics.asterixdb.aqlmodel.CompactStatement
import edu.uci.ics.asterixdb.aqlmodel.CompactionPolicy
import edu.uci.ics.asterixdb.aqlmodel.ConnectFeedStatement
import edu.uci.ics.asterixdb.aqlmodel.CreateDataverseSpecification
import edu.uci.ics.asterixdb.aqlmodel.CreateFeedSpecification
import edu.uci.ics.asterixdb.aqlmodel.CreateFunctionSpecification
import edu.uci.ics.asterixdb.aqlmodel.CreateTypeSpecification
import edu.uci.ics.asterixdb.aqlmodel.DataverseDeclaration
import edu.uci.ics.asterixdb.aqlmodel.DeleteStatement
import edu.uci.ics.asterixdb.aqlmodel.DisconnectFeedStatement
import edu.uci.ics.asterixdb.aqlmodel.DistinctClause
import edu.uci.ics.asterixdb.aqlmodel.DoubleQualifiedName
import edu.uci.ics.asterixdb.aqlmodel.DropDatasetStatement
import edu.uci.ics.asterixdb.aqlmodel.DropDataverseStatement
import edu.uci.ics.asterixdb.aqlmodel.DropFeedStatement
import edu.uci.ics.asterixdb.aqlmodel.DropFunctionStatement
import edu.uci.ics.asterixdb.aqlmodel.DropIndexStatement
import edu.uci.ics.asterixdb.aqlmodel.DropNodegroupStatement
import edu.uci.ics.asterixdb.aqlmodel.DropTypeStatement
import edu.uci.ics.asterixdb.aqlmodel.ExternalDatasetSpecification
import edu.uci.ics.asterixdb.aqlmodel.Field
import edu.uci.ics.asterixdb.aqlmodel.FilterField
import edu.uci.ics.asterixdb.aqlmodel.ForClause
import edu.uci.ics.asterixdb.aqlmodel.FunctionDeclaration
import edu.uci.ics.asterixdb.aqlmodel.FunctionName
import edu.uci.ics.asterixdb.aqlmodel.GroupClause
import edu.uci.ics.asterixdb.aqlmodel.Identifier
import edu.uci.ics.asterixdb.aqlmodel.Index
import edu.uci.ics.asterixdb.aqlmodel.IndexSpecification
import edu.uci.ics.asterixdb.aqlmodel.IndexType
import edu.uci.ics.asterixdb.aqlmodel.InsertStatement
import edu.uci.ics.asterixdb.aqlmodel.InternalDatasetSpecification
import edu.uci.ics.asterixdb.aqlmodel.KeyValuePair
import edu.uci.ics.asterixdb.aqlmodel.LetClause
import edu.uci.ics.asterixdb.aqlmodel.LimitClause
import edu.uci.ics.asterixdb.aqlmodel.LoadStatement
import edu.uci.ics.asterixdb.aqlmodel.MultExpr
import edu.uci.ics.asterixdb.aqlmodel.OperatorExpr
import edu.uci.ics.asterixdb.aqlmodel.OrderbyClause
import edu.uci.ics.asterixdb.aqlmodel.QualifiedName
import edu.uci.ics.asterixdb.aqlmodel.Query
import edu.uci.ics.asterixdb.aqlmodel.RecordField
import edu.uci.ics.asterixdb.aqlmodel.RefreshExternalDatasetStatement
import edu.uci.ics.asterixdb.aqlmodel.RelExpr
import edu.uci.ics.asterixdb.aqlmodel.SetStatement
import edu.uci.ics.asterixdb.aqlmodel.TypeName
import edu.uci.ics.asterixdb.aqlmodel.TypeReference
import edu.uci.ics.asterixdb.aqlmodel.UnaryExpr
import edu.uci.ics.asterixdb.aqlmodel.UnionExpr
import edu.uci.ics.asterixdb.aqlmodel.UpdateStatement
import edu.uci.ics.asterixdb.aqlmodel.ValueExpr
import edu.uci.ics.asterixdb.aqlmodel.Variable
import edu.uci.ics.asterixdb.aqlmodel.VariableRefExpression
import edu.uci.ics.asterixdb.aqlmodel.WhereClause
import edu.uci.ics.asterixdb.aqlmodel.WriteStatement
import org.eclipse.emf.edit.ui.provider.AdapterFactoryLabelProvider
import org.eclipse.xtext.ui.label.DefaultEObjectLabelProvider

/**
 * Provides labels for a EObjects.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#labelProvider
 */
class AQLLabelProvider extends DefaultEObjectLabelProvider {

	@Inject
	new(AdapterFactoryLabelProvider delegate) {
		super(delegate);
	}

	//---------------------------------------------------
	// Statement
	def text(DataverseDeclaration dd) {
		'use dataverse ' + getText(dd.dataverse)
	}

	def text(FunctionDeclaration fd) {
		'declare function ' + getText(fd.name)
	}

	//---------------------------------------------------
	// CreateStatement
	def text(CreateTypeSpecification cts) {
		'create type ' + getText(cts.name) + " as " + getText(cts.typeExpr)
	}

	def text(ExternalDatasetSpecification cdvs) {
		'create external dataset ' + getText(cdvs.name)
	}

	def text(InternalDatasetSpecification cdvs) {
		'create external dataset ' + getText(cdvs.name)
	}

	def text(IndexSpecification is) {
		'create index ' + getText(is.name) + ' on ' + getText(is.nameComponents)
	}

	def text(CreateDataverseSpecification cdvs) {
		'create dataverse ' + getText(cdvs.name)
	}

	def text(CreateFunctionSpecification cfs) {
		'create function ' + getText(cfs.name)
	}

	def text(CreateFeedSpecification cfs) {
		'create feed ' + getText(cfs.name)
	}

	//---------------------------------------------------
	// LoadStatement
	def text(LoadStatement ls) {
		'load dataset  ' + getText(ls.inputName);
	}

	//---------------------------------------------------
	// DropStatement
	def text(DropDatasetStatement dvs) {
		'drop dataset ' + getText(dvs.pairId)
	}

	def text(DropIndexStatement dvs) {
		'drop index ' + getText(dvs.tripleId)
	}

	def text(DropNodegroupStatement dvs) {
		'drop nodegroup ' + getText(dvs.id)
	}

	def text(DropTypeStatement dvs) {
		'drop type ' + getText(dvs.pairId)
	}

	def text(DropDataverseStatement dvs) {
		'drop dataverse ' + getText(dvs.id)
	}

	def text(DropFunctionStatement dvs) {
		'drop function ' + getText(dvs.funcSig)
	}

	def text(DropFeedStatement dvs) {
		'drop feed ' + getText(dvs.pairId)
	}

	//---------------------------------------------------
	// WriteStatement
	def text(WriteStatement ws) {
		'write ' + getText(ws.outputName)
	}

	//---------------------------------------------------
	// SetStatement
	def text(SetStatement ss) {
		'set ' + getText(ss.variableName) + ' ' + ss.pv;
	}

	//---------------------------------------------------
	// InsertStatement
	def text(InsertStatement is) {
		'insert into dataset ' + getText(is.datasetName);
	}

	//---------------------------------------------------
	// DeleteStatement
	// Incomplete	
	def text(DeleteStatement ds) {
		'delete ' + getText(ds.variableName) + ' from dataset ' + getText(ds.nameComponents)
	}

	//---------------------------------------------------
	// UpdateStatement
	def text(UpdateStatement us) {
		'update ' + getText(us.variableName)
	}

	//---------------------------------------------------
	// FeedStatement
	def text(ConnectFeedStatement cfs) {
		'connect feed ' + getText(cfs.feedNameComponents)
	}

	def text(DisconnectFeedStatement dcfs) {
		'disconnect feed ' + getText(dcfs.feedNameComponents)
	}

	//---------------------------------------------------
	// CompactStatement
	def text(CompactStatement cs) {
		'compact ' + getText(cs.nameComponents)
	}

	//---------------------------------------------------
	// Query
	// Incomplete	
	def text(Query q) {
		'query ' + getText(q.expr)
	}

	//---------------------------------------------------
	// RefreshExternalDatasetStatement
	def text(RefreshExternalDatasetStatement reds) {
		'refresh external dataset ' + getText(reds.datasetName)
	}

	//---------------------------------------------------
	// CompactionPolicy
	def text(CompactionPolicy cp) {
		getText(cp.policy)
	}

	//---------------------------------------------------
	// FilterField
	def text(FilterField ff) {
		getText(ff.field)
	}

	//---------------------------------------------------
	// IndexType
	def text(IndexType indexType) {
		if (indexType == "ngram") {
			return indexType.type + '(' + indexType.arity + ')'
		} else
			return getText(indexType.type)
	}

	//---------------------------------------------------
	// KeyValuePair
	def text(KeyValuePair kvp) {
		'(' + getText(kvp.key) + ' = ' + getText(kvp.value) + ')'
	}

	//---------------------------------------------------
	// Property
	// Not sure why there's a problem getting the name and value DAF
	//	def text(Property p) {
	//		getText(p.name) + ' = ' + getText(p.value)
	//	}
	//---------------------------------------------------
	// RecordTypeDef
	//	def text(RecordTypeDef rtd) {
	//		getText(rtd.name)
	//	}
	//---------------------------------------------------
	// RecordField
	def text(RecordField rf) {
		var retValue = getText(rf.name)
		if (rf.type instanceof TypeReference) {
			retValue = retValue + ' : ' + getText(rf.type)
		}
		return retValue
	}

	//---------------------------------------------------
	// TypeReference
	def text(TypeReference t) {
		getText(t.type)
	}

	//---------------------------------------------------
	// FunctionName
	// Incomplete DAF
	def text(FunctionName fn) {
		getText(fn.first)
	}

	//---------------------------------------------------
	// TypeName
	def text(TypeName tn) {
		getText(tn.typeName)
	}

	//---------------------------------------------------
	// Identifier
	def text(Identifier id) {
		id.identifierName
	}

	//---------------------------------------------------
	// QualifiedName
	def text(QualifiedName qn) {
		getText(qn.first) + (qn.second ?: '')
	}

	//---------------------------------------------------
	// DoubleQualifiedName
	def text(DoubleQualifiedName dqn) {
		getText(dqn.first) + '.'
		dqn.second //+ (dqn.third ?: '')
	}

	//---------------------------------------------------
	// Expressions
	def text(OperatorExpr expr) {
		getText(expr.left) + " or " + getText(expr.right)
	}

	def text(AndExpr expr) {
		getText(expr.left) + " and " + getText(expr.right)
	}

	def text(RelExpr expr) {
		getText(expr.left) + " " + expr.op + " " + getText(expr.right)
	}

	def text(AddExpr expr) {
		getText(expr.left) + " " + expr.op + " " + getText(expr.right)
	}

	def text(MultExpr expr) {
		getText(expr.left) + " " + expr.op + " " + getText(expr.right)
	}

	def text(UnionExpr expr) {
		getText(expr.left) + " union " + getText(expr.right)
	}

	def text(UnaryExpr expr) {
		expr.op + getText(expr.expr)
	}

	def text(ValueExpr expr) {
		expr.expr + getText(expr.fa)
	}

	def text(Field f) {
		"." + getText(f.ident)
	}

	def text(Index i) {
		"[" + getText(i.expr) + "]"
	}

	def text(VariableRefExpression i) {
		val foo = getText(i.variable)
		return getText(i.variable)
	}

	def text(Variable v) {
		return getText(v.lit)
	}

	//---------------------------------------------------
	// ForClause
	// Incomplete DAF
	def text(ForClause fc) {
		'for ' + getText(fc.varExp)
	}

	// LetClause
	def text(LetClause lc) {
		'let ' + getText(lc.varExp)
	}

	// WhereClause
	def text(WhereClause lc) {
		'where '
	}

	// OrderbyClause
	def text(OrderbyClause obc) {
		'order by '
	}

	// GroupClause
	def text(GroupClause gbc) {
		'group by '
	}

	// LimitClause
	def text(LimitClause lc) {
		'limit '
	}

	// DistinctClause
	def text(DistinctClause dc) {
		'distinct by '
	}

//---------------------------------------------------
// QuantifiedExpression
// Incomplete DAF
//	def text(QuantifiedExpression qe) {
//		'some/every '
//	}
} // AQLLabelProvider
