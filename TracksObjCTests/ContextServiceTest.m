//
//  ContextServiceTest.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "ContextServiceTest.h"
#import "PWSTracksBaseFactory.h"
#import "PWSTracksContextServiceFactory.h"
#import "PWSTracksContext.h"


@implementation ContextServiceTest

@synthesize testCaseLock, response, contextCount, testCase, testCaseTime, doneWithErrors,
done, receivedError;

-(void)initTestCase:(NSString *)name {
	
	[PWSTracksBaseFactory setServerAddress:[NSString stringWithFormat:@"file://%@/TestData", SRCROOT]];
	
	self.testCase = name;
	self.testCaseLock = YES;
	self.testCaseTime = 0;
	self.contextCount = 0;
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

- (void)testGetContexts {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksContextServiceFactory getContexts:self] retain];
	
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
	STAssertTrue(self.contextCount == 8, @"Didn't receive 8 contexts");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testGetContextsAndCancel {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksContextServiceFactory getContexts:self] retain];
	
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
	STAssertTrue(self.contextCount == 1, @"Didn't receive 1 contexts");
	STAssertFalse(self.done, @"Done sent");
    
}

- (void)testGetContextById {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksContextServiceFactory getContextById:[NSNumber numberWithInt:9361] delegate:self] retain];
	
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
	STAssertTrue(self.contextCount == 1, @"Didn't receive 1 contexts");
	STAssertTrue(self.done, @"Done not sent");
    
}

- (void)testTryGetContextByNonExistentId {
    
    [self initTestCase:NSStringFromSelector(_cmd)];
    
	[[PWSTracksContextServiceFactory getContextById:[NSNumber numberWithInt:666] delegate:self] retain];
	
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
	STAssertTrue(self.contextCount == 0, @"Didn't receive 0 contexts");
	STAssertFalse(self.done, @"Done sent");
    
}

-(void)contextService:(id<PWSTracksService>)contextService gotContext:(id<PWSTracksContext>)context {
    
    if ([self.testCase isEqualToString:@"testGetContexts"]) {
		
		switch (self.contextCount) {
			case 0:
				// name
				STAssertEqualObjects(context.name, @"At home",
									 @"Name doesn't match", nil);
                
                // ID
                STAssertEqualObjects(context.ID, [NSNumber numberWithInt:9358],
									 @"ID doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(context.createdAt, [NSDate dateWithString:@"2010-02-27 09:45:17 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(context.updatedAt, [NSDate dateWithString:@"2010-02-27 09:58:55 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // hide
                STAssertFalse(context.hide, @"Hide doesn't match");
                
                // position
                STAssertEqualObjects(context.position, [NSNumber numberWithInt:1],
									 @"Position doesn't match", nil);
                
                break;
				
			case 1:
                // name
				STAssertEqualObjects(context.name, @"At work",
									 @"Name doesn't match", nil);
                
                // ID
                STAssertEqualObjects(context.ID, [NSNumber numberWithInt:9359],
									 @"ID doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(context.createdAt, [NSDate dateWithString:@"2010-02-27 09:45:19 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(context.updatedAt, [NSDate dateWithString:@"2010-02-27 09:58:57 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // hide
                STAssertTrue(context.hide, @"Hide doesn't match");
                
                // position
                STAssertEqualObjects(context.position, [NSNumber numberWithInt:2],
									 @"Position doesn't match", nil);
				
				break;
                
			case 7:
				// name
				STAssertEqualObjects(context.name, @"View",
									 @"Name doesn't match", nil);
                
                // ID
                STAssertEqualObjects(context.ID, [NSNumber numberWithInt:10341],
									 @"ID doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(context.createdAt, [NSDate dateWithString:@"2010-03-07 22:23:09 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(context.updatedAt, [NSDate dateWithString:@"2010-03-07 22:23:09 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // hide
                STAssertFalse(context.hide, @"Hide doesn't match");
                
                // position
                STAssertEqualObjects(context.position, [NSNumber numberWithInt:8],
									 @"Position doesn't match", nil);                

				
				break;
                
			default:
                
				break;
		}
		
	} else if ([self.testCase isEqualToString:@"testGetContextById"]) {
        switch (self.contextCount) {
			case 0:
				// name
				STAssertEqualObjects(context.name, @"Errands",
									 @"Name doesn't match", nil);
                
                // ID
                STAssertEqualObjects(context.ID, [NSNumber numberWithInt:9361],
									 @"ID doesn't match", nil);
                
                // createdAt
                STAssertEqualObjects(context.createdAt, [NSDate dateWithString:@"2010-02-27 09:45:23 +00:00"],
									 @"Created at doesn't match", nil);
                
                // updatedAt
                STAssertEqualObjects(context.updatedAt, [NSDate dateWithString:@"2010-02-27 09:59:00 +00:00"],
									 @"Updated at doesn't match", nil);
                
                // hide
                STAssertFalse(context.hide, @"Hide doesn't match");
                
                // position
                STAssertEqualObjects(context.position, [NSNumber numberWithInt:4],
									 @"Position doesn't match", nil);  
                
				break;
                
			default:
                
				break;
		}
    } else if ([self.testCase isEqualToString:@"testGetContextsAndCancel"]) {
        switch (self.contextCount) {
			case 0:
                [contextService cancelRequest];
                break;
                
			default:
                
				break;
        }
    }
    
    self.contextCount++;
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
