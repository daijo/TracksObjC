//
//  TodoServiceTest.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#ifndef SRCROOT // TODO: Remove this hack. Xcode 4 problem? Builds without this but you get an error when you view the file. Is defined for the test target but Xcode editor doesn't think so. Strangely a similar setup in another project made in Xcode 3 work in Xcode 4.
#define SRCROOT ""
#endif

#import "TodoServiceTest.h"
#import "PWSTracksTodo.h"
#import "PWSTracksBaseFactory.h"
#import "PWSTracksTodoServiceFactory.h"


@implementation TodoServiceTest

@synthesize testCaseLock, response, todoCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSTracksBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.todoCount = 0;
	self.done = NO;
	self.doneWithErrors = NO;
	self.receivedError = nil;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGetTodos {
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksTodoServiceFactory getTodos:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];

		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.todoCount == 3, @"Didn't receive 3 todos");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testGetTodoById {
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksTodoServiceFactory getTodoById:[NSNumber numberWithInt:229275] delegate:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.todoCount == 1, @"Didn't receive 1 todo");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testTryGetTodoByNonExistentId {
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksTodoServiceFactory getTodoById:[NSNumber numberWithInt:666] delegate:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertTrue(self.doneWithErrors, @"Fail with errors not sent");
	if(self.receivedError == nil) {
		STFail(@"No error received");
	}
	STAssertTrue(self.todoCount == 0, @"Did receive more then 0 todos");
	STAssertFalse(self.done, @"Done sent");
    
}

- (void)testGetTodosByContextId {
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksTodoServiceFactory getTodosByContextId:[NSNumber numberWithInt:9358] delegate:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.todoCount == 2, @"Didn't receive 2 todo");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testGetTodosByProjectId {
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksTodoServiceFactory getTodosByProjectId:[NSNumber numberWithInt:26042] delegate:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
		if(self.testCaseTime == 2) {
			STFail(@"Test time out");
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.todoCount == 1, @"Didn't receive 1 todo");
	STAssertTrue(self.done, @"Done not sent");
    
}

-(void)todoService:(id<PWSTracksService>)todoService gotTodo:(id<PWSTracksTodo>)todo {
    
    if ([self.testCase isEqualToString:@"testGetTodos"]) {
		
		switch (self.todoCount) {
			case 0:
				// title
				STAssertEqualObjects(todo.title, @"Session Tester Improved Blog Pt.2",
									 @"Title doesn't match", nil);
                // notes
                STAssertEqualObjects(todo.notes, @"Base on the mail", @"Notes doesn't match", nil);
                // state
				STAssertEqualObjects(todo.state, @"active", @"State doesn't match", nil);
				
                // IPAddress
                STAssertEqualObjects(todo.IPAddress, @"27.115.118.130", @"IP address doesn't match", nil);
                
				break;
				
			case 1:
                // ID
                STAssertEqualObjects(todo.ID, [NSNumber numberWithInt:239435],
									 @"ID doesn't match", nil);
                
                // contextID
                STAssertEqualObjects(todo.contextID, [NSNumber numberWithInt:9358],
									 @"Context ID doesn't match", nil);
                
                // projectID
                STAssertEqualObjects(todo.projectID, [NSNumber numberWithInt:26143],
									 @"Project ID doesn't match", nil);
                
                // recurringTodoID
                STAssertEqualObjects(todo.recurringTodoID, [NSNumber numberWithInt:12345],
									 @"Recurring Todo ID doesn't match", nil);
				
				break;
                
			case 2:
                // completedAt
                STAssertEqualObjects(todo.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(todo.createdAt, [NSDate dateWithString:@"2011-03-14 12:03:51 +0000"],
									 @"Created at doesn't match", nil);
                
                // dueAt
                STAssertEqualObjects(todo.dueAt, nil,
									 @"Due at doesn't match", nil);
                // showFrom
                STAssertEqualObjects(todo.showFrom, nil,
									 @"Show from doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(todo.updatedAt, [NSDate dateWithString:@"2011-03-14 12:03:51 +00:00"],
									 @"Updated at doesn't match", nil);
				
				break;
                
			default:
                
				break;
		}
		
	} else if ([self.testCase isEqualToString:@"testGetTodoById"]) {
        switch (self.todoCount) {
			case 0:
				// title
				STAssertEqualObjects(todo.title, @"Session Tester Improved Blog Pt.2",
									 @"Title doesn't match", nil);
                // notes
                STAssertEqualObjects(todo.notes, @"Base on the mail", @"Notes doesn't match", nil);
                // state
				STAssertEqualObjects(todo.state, @"active", @"State doesn't match", nil);
				
                // IPAddress
                STAssertEqualObjects(todo.IPAddress, @"27.115.118.130", @"IP address doesn't match", nil);
                
                // ID
                STAssertEqualObjects(todo.ID, [NSNumber numberWithInt:229275],
									 @"ID doesn't match", nil);
                
                // contextID
                STAssertEqualObjects(todo.contextID, [NSNumber numberWithInt:9358],
									 @"Context ID doesn't match", nil);
                
                // projectID
                STAssertEqualObjects(todo.projectID, [NSNumber numberWithInt:26042],
									 @"Project ID doesn't match", nil);
                
                // recurringTodoID
                STAssertEqualObjects(todo.recurringTodoID, nil,
									 @"Recurring Todo ID doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(todo.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(todo.createdAt, [NSDate dateWithString:@"2010-12-27 09:20:53 +00:00"],
									 @"Created at doesn't match", nil);
                
                // dueAt
                STAssertEqualObjects(todo.dueAt, nil,
									 @"Due at doesn't match", nil);
                // showFrom
                STAssertEqualObjects(todo.showFrom, nil,
									 @"Show from doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(todo.updatedAt, [NSDate dateWithString:@"2011-03-11 01:35:19 +00:00"],
									 @"Updated at doesn't match", nil);
                
				break;
                
			default:
                
				break;
		}
    } else if ([self.testCase isEqualToString:@"testGetTodosByContextId"]) {
        switch (self.todoCount) {
			case 0:
				// title
				STAssertEqualObjects(todo.title, @"Session Tester Improved Blog Pt.2",
									 @"Title doesn't match", nil);
                // notes
                STAssertEqualObjects(todo.notes, @"Base on the mail", @"Notes doesn't match", nil);
                // state
				STAssertEqualObjects(todo.state, @"active", @"State doesn't match", nil);
				
                // IPAddress
                STAssertEqualObjects(todo.IPAddress, @"27.115.118.130", @"IP address doesn't match", nil);
                
                // ID
                STAssertEqualObjects(todo.ID, [NSNumber numberWithInt:229275],
									 @"ID doesn't match", nil);
                
                // contextID
                STAssertEqualObjects(todo.contextID, [NSNumber numberWithInt:9358],
									 @"Context ID doesn't match", nil);
                
                // projectID
                STAssertEqualObjects(todo.projectID, [NSNumber numberWithInt:26042],
									 @"Project ID doesn't match", nil);
                
                // recurringTodoID
                STAssertEqualObjects(todo.recurringTodoID, nil,
									 @"Recurring Todo ID doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(todo.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(todo.createdAt, [NSDate dateWithString:@"2010-12-27 09:20:53 +00:00"],
									 @"Created at doesn't match", nil);
                
                // dueAt
                STAssertEqualObjects(todo.dueAt, nil,
									 @"Due at doesn't match", nil);
                // showFrom
                STAssertEqualObjects(todo.showFrom, nil,
									 @"Show from doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(todo.updatedAt, [NSDate dateWithString:@"2011-03-11 01:35:19 +00:00"],
									 @"Updated at doesn't match", nil);
                
				break;
                
            case 1:
				// title
				STAssertEqualObjects(todo.title, @"XGAWK Macport",
									 @"Title doesn't match", nil);
                // notes
                STAssertEqualObjects(todo.notes, nil, @"Notes doesn't match", nil);
                // state
				STAssertEqualObjects(todo.state, @"active", @"State doesn't match", nil);
				
                // IPAddress
                STAssertEqualObjects(todo.IPAddress, @"27.115.118.130", @"IP address doesn't match", nil);
                
                // ID
                STAssertEqualObjects(todo.ID, [NSNumber numberWithInt:239435],
									 @"ID doesn't match", nil);
                
                // contextID
                STAssertEqualObjects(todo.contextID, [NSNumber numberWithInt:9358],
									 @"Context ID doesn't match", nil);
                
                // projectID
                STAssertEqualObjects(todo.projectID, [NSNumber numberWithInt:26143],
									 @"Project ID doesn't match", nil);
                
                // recurringTodoID
                STAssertEqualObjects(todo.recurringTodoID, nil,
									 @"Recurring Todo ID doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(todo.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(todo.createdAt, [NSDate dateWithString:@"2011-01-14 02:07:54 +00:00"],
									 @"Created at doesn't match", nil);
                
                // dueAt
                STAssertEqualObjects(todo.dueAt, nil,
									 @"Due at doesn't match", nil);
                // showFrom
                STAssertEqualObjects(todo.showFrom, nil,
									 @"Show from doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(todo.updatedAt, [NSDate dateWithString:@"2011-03-05 00:03:46 +00:00"],
									 @"Updated at doesn't match", nil);
                
				break;
                
			default:
                
				break;
		} 
    } else if ([self.testCase isEqualToString:@"testGetTodosByProjectId"]) {
        switch (self.todoCount) {
			case 0:
				// title
				STAssertEqualObjects(todo.title, @"Session Tester Improved Blog Pt.2",
									 @"Title doesn't match", nil);
                // notes
                STAssertEqualObjects(todo.notes, @"Base on the mail", @"Notes doesn't match", nil);
                // state
				STAssertEqualObjects(todo.state, @"active", @"State doesn't match", nil);
				
                // IPAddress
                STAssertEqualObjects(todo.IPAddress, @"27.115.118.130", @"IP address doesn't match", nil);
                
                // ID
                STAssertEqualObjects(todo.ID, [NSNumber numberWithInt:229275],
									 @"ID doesn't match", nil);
                
                // contextID
                STAssertEqualObjects(todo.contextID, [NSNumber numberWithInt:9358],
									 @"Context ID doesn't match", nil);
                
                // projectID
                STAssertEqualObjects(todo.projectID, [NSNumber numberWithInt:26042],
									 @"Project ID doesn't match", nil);
                
                // recurringTodoID
                STAssertEqualObjects(todo.recurringTodoID, nil,
									 @"Recurring Todo ID doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(todo.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(todo.createdAt, [NSDate dateWithString:@"2010-12-27 09:20:53 +00:00"],
									 @"Created at doesn't match", nil);
                
                // dueAt
                STAssertEqualObjects(todo.dueAt, nil,
									 @"Due at doesn't match", nil);
                // showFrom
                STAssertEqualObjects(todo.showFrom, nil,
									 @"Show from doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(todo.updatedAt, [NSDate dateWithString:@"2011-03-11 01:35:19 +00:00"],
									 @"Updated at doesn't match", nil);
                
				break;
                
			default:
                
				break;
		}
    }

    self.todoCount++;
}

-(void)tracksService:(id<PWSTracksService>)tracksService
    didFailWithError:(NSError *)error {
    
    self.testCaseLock = NO;
	self.doneWithErrors = YES;
	self.receivedError = error;
	
	[tracksService release];
}

-(void)tracksServiceDone:(id<PWSTracksService>)tracksService {
    
    self.testCaseLock = NO;
	self.done = YES;
	
	[tracksService release];
}

@end
