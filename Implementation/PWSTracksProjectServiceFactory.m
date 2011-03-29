//
//  PWSTracksProjectServiceFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/25/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksProjectServiceFactory.h"
#import "PWSTracksProjectFactory.h"


@implementation PWSTracksProjectServiceFactory

+(id<PWSTracksService>)getProjects:(id<PWSTracksProjectServiceDelegate>)delegate {

    PWSTracksProjectFactory *service = [PWSTracksProjectFactory
                                        projectFactoryWithDelegate:delegate];
    
	[service getProjects];
	return service;
}

+(id<PWSTracksService>)getProjectById:(NSNumber *)projectId
                              delegate:(id<PWSTracksProjectServiceDelegate>)delegate {

    PWSTracksProjectFactory *service = [PWSTracksProjectFactory
                                        projectFactoryWithDelegate:delegate];
    
	[service getProjectById:projectId];
	return service;
}

@end
