//
//  PWSTracksTodoServiceImp.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksTodoServiceDelegate.h"
#import "PWSTracksTodoFactoryDelegate.h"


@interface PWSTracksTodoServiceImp : NSObject <PWSTracksTodoService, PWSTracksTodoFactoryDelegate> {
    
    id<PWSTracksTodoServiceDelegate> delegate;
	BOOL running;
}

@property (retain) id<PWSTracksTodoServiceDelegate> delegate;
+(id) todoServiceWithDelegate:(id<PWSTracksTodoServiceDelegate>) delegate;

@end
