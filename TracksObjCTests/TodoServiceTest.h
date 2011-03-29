//
//  TodoServiceTest.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PWSTracksTodoServiceDelegate.h"
#import "PWSTracksServiceDelegate.h"


@interface TodoServiceTest : SenTestCase <PWSTracksTodoServiceDelegate, PWSTracksServiceDelegate> {
    BOOL testCaseLock;
	BOOL response;
	NSInteger todoCount;
	NSInteger testCaseTime;
	NSString *testCase;
	BOOL done;
	BOOL doneWithErrors;
	NSError *receivedError;
}

@property (assign) BOOL testCaseLock;
@property (assign) BOOL doneWithErrors;
@property (assign) BOOL done;
@property (assign) BOOL response;
@property (assign) NSInteger todoCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

- (void)testGetTodos;
- (void)testGetTodosAndCancel;
- (void)testGetTodoById;
- (void)testTryGetTodoByNonExistentId;
- (void)testGetTodosByContextId;
- (void)testGetTodosByProjectId;

@end