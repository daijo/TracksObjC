//
//  PWSTracksTodoServiceDelegate.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksTodo.h"
#import "PWSTracksTodoService.h"


@protocol PWSTracksTodoServiceDelegate <NSObject>

-(void)todoService:(id<PWSTracksTodoService>)todoService gotTodo:(id<PWSTracksTodo>)todo;
-(void)todoServiceFinished:(id<PWSTracksTodoService>)todoService;
-(void)todoService:(id<PWSTracksTodoService>)todoService didFailWithError:(NSError *)error;

@end
