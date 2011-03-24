//
//  PWSTracksContextFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksBaseFactory.h"
#import "PWSTracksContextServiceDelegate.h"
#import "PWSTracksContextImp.h"


@interface PWSTracksContextFactory : PWSTracksBaseFactory {
    PWSTracksContextImp* context;
}

@property (retain) PWSTracksContextImp* context;

-(void)getContexts;
-(void)getContextById:(NSNumber *)contextId;

+(PWSTracksContextFactory *)contextFactoryWithDelegate:
(id<PWSTracksContextServiceDelegate>)delegate;

@end