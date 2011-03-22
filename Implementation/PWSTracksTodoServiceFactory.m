//
//  PWSTracksTodoServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoServiceFactory.h"
#import "PWSTracksTodoFactory.h"
#import "PWSTracksService.h"


@implementation PWSTracksTodoServiceFactory

+(id<PWSTracksService>)getTodos:(id<PWSTracksTodoServiceDelegate>)delegate {
    PWSTracksTodoFactory *service = [PWSTracksTodoFactory
                                  todoFactoryWithDelegate:delegate];
    
	[service getTodos];
	return service;
}

+(id<PWSTracksService>)getTodoById:(NSNumber *)todoId
                      delegate:(id<PWSTracksTodoServiceDelegate>)delegate {
    return nil;
}

+(id<PWSTracksService>)getTodosByContextId:(NSNumber *)contextId
                              delegate:(id<PWSTracksTodoServiceDelegate>)delegate {
    return nil;
}

+(id<PWSTracksService>)getTodosByProjectId:(NSNumber *)projectId
                              delegate:(id<PWSTracksTodoServiceDelegate>)delegate {
    return nil;
}

@end
