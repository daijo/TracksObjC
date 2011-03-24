//
//  ContextServiceTest.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PWSTracksContextServiceDelegate.h"
#import "PWSTracksServiceDelegate.h"


@interface ContextServiceTest : SenTestCase <PWSTracksContextServiceDelegate, PWSTracksServiceDelegate> {
    BOOL testCaseLock;
	BOOL response;
	NSInteger contextCount;
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
@property (assign) NSInteger contextCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

- (void)testGetContexts;
- (void)testGetContextById;
- (void)testTryGetContextByNonExistentId;

@end