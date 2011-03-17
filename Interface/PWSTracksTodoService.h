//
//  PWSTracksTodoService.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksTodoService <NSObject>

-(void)getTodos;
-(void)getTodoById:(NSNumber *)todoId;
-(void)getTodosByContextId:(NSNumber *)contextId;
-(void)getTodosByProjectId:(NSNumber *)projectId;

@end
