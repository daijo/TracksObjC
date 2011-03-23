//
//  PWSTracksContextServiceDelegate.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksContext;
@protocol PWSTracksService;
@protocol PWSTracksServiceDelegate;

@protocol PWSTracksContextServiceDelegate <PWSTracksServiceDelegate>

-(void)contextService:(id<PWSTracksService>)contextService gotContext:(id<PWSTracksContext>)context;

@end
