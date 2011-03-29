//
//  PWSTracksProjectServiceFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/25/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksService.h"
#import "PWSTracksProjectServiceDelegate.h"

@interface PWSTracksProjectServiceFactory : NSObject {
    
}

+(id<PWSTracksService>)getProjects:(id<PWSTracksProjectServiceDelegate>)delegate;
+(id<PWSTracksService>)getProjectById:(NSNumber *)projectId
                             delegate:(id<PWSTracksProjectServiceDelegate>)delegate;

@end
