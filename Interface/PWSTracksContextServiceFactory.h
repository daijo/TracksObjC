//
//  PWSTracksContextServiceFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksService.h"
#import "PWSTracksContextServiceDelegate.h"


@interface PWSTracksContextServiceFactory : NSObject {
}

+(id<PWSTracksService>)getContexts:(id<PWSTracksContextServiceDelegate>)delegate;
+(id<PWSTracksService>)getContextById:(NSNumber *)contextId
                          delegate:(id<PWSTracksContextServiceDelegate>)delegate;

@end
