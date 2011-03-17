//
//  PWSTracksServiceFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PWSTracksTodoService;
@protocol PWSTracksTodoServiceDelegate;

@interface PWSTracksServiceFactory : NSObject {
}

+(id<PWSTracksTodoService>) todoServiceWithDelegate:(id<PWSTracksTodoServiceDelegate>) delegate;

@end
