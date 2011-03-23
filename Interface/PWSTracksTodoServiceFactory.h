//
//  PWSTracksTodoServiceFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksService.h"
#import "PWSTracksTodoServiceDelegate.h"

@interface PWSTracksTodoServiceFactory : NSObject {
}

+(id<PWSTracksService>)getTodos:(id<PWSTracksTodoServiceDelegate>)delegate;
+(id<PWSTracksService>)getTodoById:(NSNumber *)todoId
                          delegate:(id<PWSTracksTodoServiceDelegate>)delegate;
+(id<PWSTracksService>)getTodosByContextId:(NSNumber *)contextId
                                  delegate:(id<PWSTracksTodoServiceDelegate>)delegate;
+(id<PWSTracksService>)getTodosByProjectId:(NSNumber *)projectId
                                  delegate:(id<PWSTracksTodoServiceDelegate>)delegate;

@end
