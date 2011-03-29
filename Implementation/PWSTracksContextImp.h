//
//  PWSTracksContextImp.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksContext.h"


@interface PWSTracksContextImp : NSObject <PWSTracksContext> {
    
    NSString *name;
    NSNumber *ID;
    NSNumber *position;
    NSDate *createdAt;
    NSDate *updatedAt;
    BOOL hide;
    
}

+(id<PWSTracksContext>) context;

@end
