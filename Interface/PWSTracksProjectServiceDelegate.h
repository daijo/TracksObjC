//
//  PWSTracksProjectServiceDelegate.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksProject;
@protocol PWSTracksService;
@protocol PWSTracksServiceDelegate;

@protocol PWSTracksProjectServiceDelegate <NSObject>

-(void)projectService:(id<PWSTracksService>)projectService gotProject:(id<PWSTracksProject>)project;

@end
