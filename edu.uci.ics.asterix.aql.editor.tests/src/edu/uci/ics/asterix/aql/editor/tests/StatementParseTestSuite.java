// StatementParseTestSuite.java
package edu.uci.ics.asterix.aql.editor.tests;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
    DataverseDeclarationTest.class,
    FunctionDeclarationTest.class,
    CreateTypeSpecificationTest.class,
    CreateNodegroupSpecificationTest.class,
    CreateDatasetSpecificationTest.class,
    CreateIndexSpecificationTest.class,
    CreateDataverseSpecificationTest.class,
    CreateFunctionSpecificationTest.class,
    CreateFeedSpecificationTest.class,
    LoadStatementTest.class,
    DropStatementTest.class,
    WriteStatementTest.class,
    SetStatementTest.class,
    InsertStatementTest.class,
    DeleteStatementTest.class,
    UpdateStatementTest.class,
    FeedStatementTest.class,
    CompactStatementTest.class,
    QueryTest.class,
    RefreshExternalDatasetStatementTest.class,
    PrimerAQLParserTest.class
})

class StatementParseTestSuite {
   
} // StatementParseTestSuite