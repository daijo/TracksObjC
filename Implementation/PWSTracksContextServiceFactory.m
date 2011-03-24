//
//  PWSTracksContextServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksContextServiceFactory.h"
#import "PWSTracksContextFactory.h"


@implementation PWSTracksContextServiceFactory

+(id<PWSTracksService>)getContexts:(id<PWSTracksContextServiceDelegate>)delegate {

    PWSTracksContextFactory *service = [PWSTracksContextFactory
                                     contextFactoryWithDelegate:delegate];
    
	[service getContexts];
	return service;
}

+(id<PWSTracksService>)getContextById:(NSNumber *)contextId
                             delegate:(id<PWSTracksContextServiceDelegate>)delegate {

    PWSTracksContextFactory *service = [PWSTracksContextFactory
                                        contextFactoryWithDelegate:delegate];
    
	[service getContextById:contextId];
	return service;
}

@end
