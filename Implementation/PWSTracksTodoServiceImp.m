//
//  PWSTracksTodoServiceImp.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoServiceImp.h"


@implementation PWSTracksTodoServiceImp

@synthesize delegate;

-(id) initWithServiceDelegate:(id<PWSTracksTodoServiceDelegate>) newDelegate {
	if ((self = [super init])){
		self.delegate = newDelegate;
		running = NO;
	}
	return self;
}

+(id) todoServiceWithDelegate:(id<PWSTracksTodoServiceDelegate>) delegate {
    return [[[PWSTracksTodoServiceImp alloc] initWithServiceDelegate:delegate] autorelease];
}

-(void)getTodos {
    
}

-(void)getTodoById:(NSNumber *)todoId {
    
}

-(void)getTodosByContextId:(NSNumber *)contextId {
    
}

-(void)getTodosByProjectId:(NSNumber *)projectId {
    
}

@end
