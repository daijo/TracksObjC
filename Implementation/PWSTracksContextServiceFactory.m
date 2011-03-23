//
//  PWSTracksContextServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksContextServiceFactory.h"


@implementation PWSTracksContextServiceFactory

+(id<PWSTracksService>)getContexts:(id<PWSTracksContextServiceDelegate>)delegate {
    return nil;
}

+(id<PWSTracksService>)getContextById:(NSNumber *)contextId
                             delegate:(id<PWSTracksContextServiceDelegate>)delegate {
    return nil;
}

@end
