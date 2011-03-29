//
//  ProjectServiceTest.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "PWSTracksProjectServiceDelegate.h"
#import "PWSTracksServiceDelegate.h"


@interface ProjectServiceTest : SenTestCase <PWSTracksProjectServiceDelegate, PWSTracksServiceDelegate> {
    BOOL testCaseLock;
	BOOL response;
	NSInteger projectCount;
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
@property (assign) NSInteger projectCount;
@property (assign) NSInteger testCaseTime;
@property (copy) NSString *testCase;
@property (copy) NSError *receivedError;

- (void)testGetProjects;
- (void)testGetProjectsAndCancel;
- (void)testGetProjectById;
- (void)testTryGetProjectByNonExistentId;

@end
