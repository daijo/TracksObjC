//
//  PWSTracksTodoServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoServiceFactory.h"
#import "PWSTracksTodoFactory.h"


@implementation PWSTracksTodoServiceFactory

+(id<PWSTracksService>)getTodos:(id<PWSTracksTodoServiceDelegate>)delegate {
    
    PWSTracksTodoFactory *service = [PWSTracksTodoFactory
                                  todoFactoryWithDelegate:delegate];
    
	[service getTodos];
	return service;
}

+(id<PWSTracksService>)getTodoById:(NSNumber *)todoId
                      delegate:(id<PWSTracksTodoServiceDelegate>)delegate {
    
    PWSTracksTodoFactory *service = [PWSTracksTodoFactory
                                     todoFactoryWithDelegate:delegate];
    
	[service getTodoById:todoId];
	return service;
}

+(id<PWSTracksService>)getTodosByContextId:(NSNumber *)contextId
                              delegate:(id<PWSTracksTodoServiceDelegate>)delegate {
    
    PWSTracksTodoFactory *service = [PWSTracksTodoFactory
                                     todoFactoryWithDelegate:delegate];
    
	[service getTodosByContextId:contextId];
	return service;
}

+(id<PWSTracksService>)getTodosByProjectId:(NSNumber *)projectId
                              delegate:(id<PWSTracksTodoServiceDelegate>)delegate {

    PWSTracksTodoFactory *service = [PWSTracksTodoFactory
                                     todoFactoryWithDelegate:delegate];

	[service getTodosByProjectId:projectId];
	return service;
}

@end
