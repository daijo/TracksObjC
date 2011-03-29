//
//  ProjectServiceTest.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "ProjectServiceTest.h"
#import "PWSTracksBaseFactory.h"
#import "PWSTracksProjectServiceFactory.h"
#import "PWSTracksProject.h"


@implementation ProjectServiceTest

@synthesize testCaseLock, response, projectCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSTracksBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.projectCount = 0;
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

- (void)testGetProjects {
 
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksProjectServiceFactory getProjects:self] retain];

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
	STAssertTrue(self.projectCount == 12, @"Didn't receive 11 projects");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testGetProjectsAndCancel {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksProjectServiceFactory getProjects:self] retain];
	
	while (self.testCaseLock) {
		
		[[NSRunLoop currentRunLoop]
         runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        
		if(self.testCaseTime == 2) {
			self.testCaseLock = NO;
		}
		self.testCaseTime++;
	}
	STAssertFalse(self.doneWithErrors, @"Fail with errors sent");
	if(self.receivedError != nil) {
		STFail([self.receivedError description]);
	}
	STAssertTrue(self.projectCount == 1, @"Didn't receive 1 projects");
	STAssertFalse(self.done, @"Done sent");
    
}

- (void)testGetProjectById {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksProjectServiceFactory getProjectById:[NSNumber numberWithInt:9999] delegate:self] retain];
	
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
	STAssertTrue(self.projectCount == 1, @"Didn't receive 1 project");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testTryGetProjectByNonExistentId {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksProjectServiceFactory getProjectById:[NSNumber numberWithInt:666] delegate:self] retain];
	
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
	STAssertTrue(self.projectCount == 0, @"Didn't receive 0 projects");
	STAssertFalse(self.done, @"Done sent");
    
}

-(void)projectService:(id<PWSTracksService>)projectService gotProject:(id<PWSTracksProject>)project {
    
    if ([self.testCase isEqualToString:@"testGetProjects"]) {
        switch (self.projectCount) {
			case 0:
				// name
				STAssertEqualObjects(project.name, @"Going mobile",
									 @"Name doesn't match", nil);
                
                // desc
                STAssertEqualObjects(project.desc, @"Bla bla bla.",
									 @"Description doesn't match", nil);
                
                // state
                STAssertEqualObjects(project.state, @"hidden",
									 @"State doesn't match", nil);
                
                // ID
                STAssertEqualObjects(project.ID, [NSNumber numberWithInt:9722],
									 @"ID doesn't match", nil);
                
                // defaultContextId
                STAssertEqualObjects(project.defaultContextID, [NSNumber numberWithInt:9999],
									 @"Default Context ID doesn't match", nil);
                
                // defaultTags
                STAssertEqualObjects(project.defaultTags, @"hej, hopp",
									 @"Default Tags doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(project.createdAt, [NSDate dateWithString:@"2010-02-27 09:45:29 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(project.updatedAt, [NSDate dateWithString:@"2010-08-31 12:48:20 +01:00"],
									 @"Updated at doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(project.completedAt, [NSDate dateWithString:@"2010-08-31 12:48:20 +01:00"],
									 @"Completed at doesn't match", nil);
                
                // position
                STAssertEqualObjects(project.position, [NSNumber numberWithInt:1],
									 @"Position doesn't match", nil);
                
                break;
                
            case 1:
				// name
				STAssertEqualObjects(project.name, @"Personal Development",
									 @"Name doesn't match", nil);
                
                // desc
                STAssertEqualObjects(project.desc, nil,
									 @"Description doesn't match", nil);
                
                // state
                STAssertEqualObjects(project.state, @"active",
									 @"State doesn't match", nil);
                
                // ID
                STAssertEqualObjects(project.ID, [NSNumber numberWithInt:9723],
									 @"ID doesn't match", nil);
                
                // defaultContextId
                STAssertEqualObjects(project.defaultContextID, nil,
									 @"Default Context ID doesn't match", nil);
                
                // defaultTags
                STAssertEqualObjects(project.defaultTags, nil,
									 @"Default Tags doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(project.createdAt, [NSDate dateWithString:@"2010-02-27 09:45:30 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(project.updatedAt, [NSDate dateWithString:@"2011-01-16 02:43:46 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(project.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // position
                STAssertEqualObjects(project.position, [NSNumber numberWithInt:2],
									 @"Position doesn't match", nil);
                
                break;
                
            case 11:
				// name
				STAssertEqualObjects(project.name, @"Home",
									 @"Name doesn't match", nil);
                
                // desc
                STAssertEqualObjects(project.desc, nil,
									 @"Description doesn't match", nil);
                
                // state
                STAssertEqualObjects(project.state, @"active",
									 @"State doesn't match", nil);
                
                // ID
                STAssertEqualObjects(project.ID, [NSNumber numberWithInt:38697],
									 @"ID doesn't match", nil);
                
                // defaultContextId
                STAssertEqualObjects(project.defaultContextID, nil,
									 @"Default Context ID doesn't match", nil);
                
                // defaultTags
                STAssertEqualObjects(project.defaultTags, nil,
									 @"Default Tags doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(project.createdAt, [NSDate dateWithString:@"2010-12-21 02:36:39 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(project.updatedAt, [NSDate dateWithString:@"2010-12-22 02:52:00 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(project.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // position
                STAssertEqualObjects(project.position, [NSNumber numberWithInt:11],
									 @"Position doesn't match", nil);
                
                break;
                
			default:
                
				break;
        }
    } else if ([self.testCase isEqualToString:@"testGetProjectById"]) {
        switch (self.projectCount) {
			case 0:
				// name
				STAssertEqualObjects(project.name, @"Photography",
									 @"Name doesn't match", nil);
                
                // desc
                STAssertEqualObjects(project.desc, nil,
									 @"Description doesn't match", nil);
                
                // state
                STAssertEqualObjects(project.state, @"active",
									 @"State doesn't match", nil);
                
                // ID
                STAssertEqualObjects(project.ID, [NSNumber numberWithInt:9999],
									 @"ID doesn't match", nil);
                
                // defaultContextId
                STAssertEqualObjects(project.defaultContextID, nil,
									 @"Default Context ID doesn't match", nil);
                
                // defaultTags
                STAssertEqualObjects(project.defaultTags, nil,
									 @"Default Tags doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(project.createdAt, [NSDate dateWithString:@"2010-03-02 08:59:18 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(project.updatedAt, [NSDate dateWithString:@"2010-09-03 06:07:39 +01:00"],
									 @"Updated at doesn't match", nil);
                
                // completedAt
                STAssertEqualObjects(project.completedAt, nil,
									 @"Completed at doesn't match", nil);
                
                // position
                STAssertEqualObjects(project.position, [NSNumber numberWithInt:6],
									 @"Position doesn't match", nil);
                
                break;
                
			default:
                
				break;
        }
    } else if ([self.testCase isEqualToString:@"testGetProjectsAndCancel"]) {
        switch (self.projectCount) {
			case 0:
                [projectService cancelRequest];
                break;
                
			default:
                
				break;
        }
    }
    
    self.projectCount++;
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
