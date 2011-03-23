//
//  PWSTracksTodoImp.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksTodo.h"


@interface PWSTracksTodoImp : NSObject <PWSTracksTodo> {

    NSString *title;
    NSString *notes;
    NSString *state;
    NSString  *IPAddress;
    NSNumber *ID;
    NSNumber *contextID;
    NSNumber *projectID;
    NSNumber *recurringTodoID;
    NSDate *completedAt;
    NSDate *createdAt;
    NSDate *dueAt;
    NSDate *showFrom;
    NSDate *updatedAt;
}

+(id<PWSTracksTodo>) todo;

@end
