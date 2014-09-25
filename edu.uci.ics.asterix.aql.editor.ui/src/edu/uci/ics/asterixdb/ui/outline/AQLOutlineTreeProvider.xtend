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
package edu.uci.ics.asterixdb.ui.outline

import edu.uci.ics.asterixdb.aqlmodel.CreateDataverseSpecification
import edu.uci.ics.asterixdb.aqlmodel.CreateFunctionSpecification
import edu.uci.ics.asterixdb.aqlmodel.CreateTypeSpecification
import edu.uci.ics.asterixdb.aqlmodel.DataverseDeclaration
import edu.uci.ics.asterixdb.aqlmodel.DeleteStatement
import edu.uci.ics.asterixdb.aqlmodel.DropDatasetStatement
import edu.uci.ics.asterixdb.aqlmodel.DropDataverseStatement
import edu.uci.ics.asterixdb.aqlmodel.QualifiedName
import edu.uci.ics.asterixdb.aqlmodel.RecordField
import edu.uci.ics.asterixdb.aqlmodel.RecordTypeDef
import edu.uci.ics.asterixdb.aqlmodel.Statement
import edu.uci.ics.asterixdb.aqlmodel.Statements
import edu.uci.ics.asterixdb.aqlmodel.TypeName
import edu.uci.ics.asterixdb.aqlmodel.TypeReference
import edu.uci.ics.asterixdb.aqlmodel.WriteStatement
import org.eclipse.xtext.ui.editor.outline.IOutlineNode
import org.eclipse.xtext.ui.editor.outline.impl.DefaultOutlineTreeProvider
import org.eclipse.xtext.ui.editor.outline.impl.DocumentRootNode

/**
 * Customization of the default outline structure.
 *
 * see http://www.eclipse.org/Xtext/documentation.html#outline
 * 
 * see http://www.drdobbs.com/architecture-and-design/customizing-xtext/231902091?pgno=1
 */
class AQLOutlineTreeProvider extends DefaultOutlineTreeProvider {

	def protected _createChildren(DocumentRootNode parentNode, Statements statements) {
		for (Statement stmt : statements.decls) {
			createNode(parentNode, stmt);
		}
	} // _createChildren

	def protected _createChildren(IOutlineNode parentNode, DataverseDeclaration dd) {
	}

	def protected _isLeaf(DataverseDeclaration dd) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, WriteStatement ws) {
	}

	def protected _isLeaf(WriteStatement ws) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, CreateTypeSpecification cts) {

		if (cts.typeExpr instanceof RecordTypeDef) {

			// If the child of the type is a RecordTypeDef, then skip the RecordTypeDef 
			// instance as a child, and just use the RecordFields directly.  This produces
			// a better Outline View
			val RecordTypeDef rtd = cts.typeExpr as RecordTypeDef
			for (RecordField recordField : rtd.rf)
				createNode(parentNode, recordField)
		} else {
			createNode(parentNode, cts.typeExpr)
		}
	}

	def protected _createChildren(IOutlineNode parentNode, CreateDataverseSpecification cdvs) {
	}

	def protected _isLeaf(CreateDataverseSpecification dcdvs) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, CreateFunctionSpecification cfs) {
		createNode(parentNode, cfs.functionBodyExpr)
	}

	def protected _createChildren(IOutlineNode parentNode, RecordTypeDef rtf) {
		for (RecordField rf : rtf.rf) {
			createNode(parentNode, rf);
		}
	}

	def protected _createChildren(IOutlineNode parentNode, RecordField rf) {

		if (rf.type instanceof RecordTypeDef) {

			// If the child of the type is a RecordTypeDef, then skip the RecordTypeDef 
			// instance as a child, and just use the RecordFields directly.  This produces
			// a better Outline View
			val RecordTypeDef rtd = rf.type as RecordTypeDef
			for (RecordField recordField : rtd.rf)
				createNode(parentNode, recordField)
		} else if (!(rf.type instanceof TypeReference)) {
			createNode(parentNode, rf.type)
		}
	}

	def protected _isLeaf(RecordField rf) {
		rf.type instanceof TypeReference
	}

	def protected _createChildren(IOutlineNode parentNode, DeleteStatement dds) {
		createNode(parentNode, dds.nameComponents);
		createNode(parentNode, dds.condition);
	}

	def protected _createChildren(IOutlineNode parentNode, DropDatasetStatement dds) {
	}

	def protected _isLeaf(DropDatasetStatement dds) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, DropDataverseStatement dvs) {
	}

	def protected _isLeaf(DropDataverseStatement dvs) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, QualifiedName qn) {
	}

	def protected _isLeaf(QualifiedName qn) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, TypeReference tr) {
	}

	def protected _isLeaf(TypeReference tr) {
		true
	}

	def protected _createChildren(IOutlineNode parentNode, TypeName tn) {
		createNode(parentNode, tn.typeName)
	}

	def protected _isLeaf(TypeName tn) {
		true
	}

//	def protected void _createNode(IOutlineNode parentNode, DataverseDeclaration dd) {
//		System.out.println("hey")
//	} // _createNode
} // AQLOutlineTreeProvider
