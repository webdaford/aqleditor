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
import org.junit.Test
import org.junit.runner.RunWith

/**
 * This is a test of the parser parsing the example AQL from
 * @see http://asterixdb.ics.uci.edu/documentation/aql/primer.html
 */
@RunWith(typeof(XtextRunner))
@InjectWith(typeof(AQLInjectorProvider))
class PrimerAQLParserTest {

	@Inject extension ParseHelper<Statements>;
	@Inject extension ValidationTestHelper

	// This is the primer AQL with ";"'s added
	val PRIMER_AQL = '''
		//drop dataverse TinySocial if exists;
		create dataverse TinySocial;
		//use dataverse TinySocial;
		
		create type TwitterUserType as open {
		    screen-name: string,
		    lang: string,
		    friends_count: int32,
		    statuses_count: int32,
		    name: string,
		    followers_count: int32
		};
		
		create type TweetMessageType as closed {
		    tweetid: string,
		    user: TwitterUserType,
		    sender-location: point?,
		    send-time: datetime,
		    referred-topics: {{ string }},
		    message-text: string
		};
		
		create type EmploymentType as open {
		    organization-name: string,
		    start-date: date,
		    end-date: date?
		};
		
		create type FacebookUserType as closed {
		    id: int32,
		    alias: string,
		    name: string,
		    user-since: datetime,
		    friend-ids: {{ int32 }},
		    employment: [EmploymentType]
		};
		
		create type FacebookMessageType as closed {
		    message-id: int32,
		    author-id: int32,
		    in-response-to: int32?,
		    sender-location: point?,
		    message: string
		};
		
	'''

	/*
    // Lack of ";"'s
    val PRIMER_AQL_ORIGINAL = '''
        drop dataverse TinySocial if exists;
        create dataverse TinySocial;
        use dataverse TinySocial;
        
        create type TwitterUserType as open {
            screen-name: string,
            lang: string,
            friends_count: int32,
            statuses_count: int32,
            name: string,
            followers_count: int32
        }
        
        create type TweetMessageType as closed {
            tweetid: string,
            user: TwitterUserType,
            sender-location: point?,
            send-time: datetime,
            referred-topics: {{ string }},
            message-text: string
        }
        
        create type EmploymentType as open {
            organization-name: string,
            start-date: date,
            end-date: date?
        }
        
        create type FacebookUserType as closed {
            id: int32,
            alias: string,
            name: string,
            user-since: datetime,
            friend-ids: {{ int32 }},
            employment: [EmploymentType]
        }
        
        create type FacebookMessageType as closed {
            message-id: int32,
            author-id: int32,
            in-response-to: int32?,
            sender-location: point?,
            message: string
        }
        
    '''
*/
	@Test
	def void givenAQLFromPrimer_thenNoErrors() {
		PRIMER_AQL.parse.assertNoErrors
	}
} // PrimerAQLParserTest
