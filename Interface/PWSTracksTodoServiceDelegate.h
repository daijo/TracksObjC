//
//  PWSTracksTodoServiceDelegate.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksTodo;
@protocol PWSTracksService;
@protocol PWSTracksServiceDelegate;

@protocol PWSTracksTodoServiceDelegate <PWSTracksServiceDelegate>

-(void)todoService:(id<PWSTracksService>)todoService gotTodo:(id<PWSTracksTodo>)todo;

@end
