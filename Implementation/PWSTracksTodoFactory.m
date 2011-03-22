//
//  PWSTracksTodoFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoFactory.h"


@implementation PWSTracksTodoFactory

@synthesize todo;



#pragma mark -
#pragma mark Interface implementation
#pragma mark - Class

+(PWSTracksTodoFactory *)todoFactoryWithDelegate:
(id<PWSTracksTodoServiceDelegate>)delegate {
    return [[[PWSTracksTodoFactory alloc] initWithDelegate:delegate] autorelease]; 
}

#pragma mark - Instance

-(void)getTodos {
    NSLog(@"getTodos");
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/todos.xml",
					   [PWSTracksBaseFactory serverAddress]]];
}

-(void)getTodoById:(NSNumber *)todoId {
    
}

-(void)getTodosByContextId:(NSNumber *)contextId {
    
}

-(void)getTodosByProjectId:(NSNumber *)projectId {
    
}

@end
