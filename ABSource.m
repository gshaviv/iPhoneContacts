/*
 * ABSource.h
 * iPhoneContacts
 * 
 * Created by David Beck on 4/3/2011.
 * 
 * Copyright (c) 2009 Jim Dovey
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of the project's author nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */


#import "ABSource.h"

#import "ABAddressBook.h"
#import "ABGroup.h"
#import "ABPerson.h"


@implementation ABSource

- (NSArray *) groups
{
	NSArray * groups = (NSArray *) ABAddressBookCopyArrayOfAllGroupsInSource( [ABAddressBook sharedAddressBook].addressBookRef, _ref );
    if ( [groups count] == 0 )
    {
        [groups release];
        return ( nil );
    }
    
    NSArray * result = (NSArray *) WrappedArrayOfRecords( groups, [ABGroup class] );
    [groups release];
    
    return ( result );
}

- (NSArray *) allMembers
{
	NSArray * members = (NSArray *) ABAddressBookCopyArrayOfAllPeopleInSource( [ABAddressBook sharedAddressBook].addressBookRef, _ref );
    if ( [members count] == 0 )
    {
        [members release];
        return ( nil );
    }
    
    NSArray * result = (NSArray *) WrappedArrayOfRecords( members, [ABPerson class] );
    [members release];
    
    return ( result );
}

- (NSArray *) allMembersSortedInOrder: (ABPersonSortOrdering) order
{
    NSArray * members = (NSArray *) ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering( [ABAddressBook sharedAddressBook].addressBookRef, _ref, order );
    if ( [members count] == 0 )
    {
        [members release];
        return ( nil );
    }
    
    NSArray * result = (NSArray *) WrappedArrayOfRecords( members, [ABPerson class] );
    [members release];
    
    return ( result );
}

@end
