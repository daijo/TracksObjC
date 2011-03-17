//
//  PWSTracksServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksServiceFactory.h"
#import "PWSTracksTodoServiceImp.h"

@implementation PWSTracksServiceFactory

+(id<PWSTracksTodoService>) todoServiceWithDelegate:(id<PWSTracksTodoServiceDelegate>) delegate {
    return [PWSTracksTodoServiceImp todoServiceWithDelegate:delegate];
}

@end
