//
//  PWSTracksProjectImp.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksProject.h"


@interface PWSTracksProjectImp : NSObject <PWSTracksProject> {
    
    NSString *name;
    NSString *desc;
    NSString *state;
    NSString *defaultTags;
    NSNumber *ID;
    NSNumber *defaultContextID;
    NSNumber *position;
    NSDate *createdAt;
    NSDate *updatedAt;
    NSDate *completedAt;
    
}

+(id<PWSTracksProject>) project;

@end
