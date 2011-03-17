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
#import "PWSTracksTodoService.h"
#import "PWSTracksBaseFactory.h"
#import "PWSTracksServiceFactory.h"


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

/*- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}*/

- (void)testGetTodos {
    
    
	[self initTestCase:NSStringFromSelector(_cmd)];
    
	[[[PWSTracksServiceFactory todoServiceWithDelegate:self] retain] getTodos];
	
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

-(void)todoService:(id<PWSTracksTodoService>)todoService gotTodo:(id<PWSTracksTodo>)todo {
    
    self.todoCount++;
    
    [todo release];
}
-(void)todoServiceFinished:(id<PWSTracksTodoService>)todoService {
    
    self.testCaseLock = NO;
	self.done = YES;
	
	[todoService release];
}
-(void)todoService:(id<PWSTracksTodoService>)todoService didFailWithError:(NSError *)error{
    
    self.testCaseLock = NO;
	self.doneWithErrors = YES;
	self.receivedError = error;
	
	[todoService release];
}

@end
