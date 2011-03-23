//
//  PWSTracksServiceDelegate.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksService;

@protocol PWSTracksServiceDelegate <NSObject>

-(void)tracksService:(id<PWSTracksService>)tracksService
    didFailWithError:(NSError *)error;
-(void)tracksServiceDone:(id<PWSTracksService>)tracksService;

@end
