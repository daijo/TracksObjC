//
//  PWSTracksTodo.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksTodo <NSObject>

@property (copy) NSString *title;
@property (copy) NSString *notes;
@property (copy) NSString *state;
@property (copy) NSString  *IPAddress;
@property (copy) NSNumber *ID;
@property (copy) NSNumber *contextID;
@property (copy) NSNumber *projectID;
@property (copy) NSNumber *recurringTodoID;
@property (retain) NSDate *completedAt;
@property (retain) NSDate *createdAt;
@property (retain) NSDate *dueAt;
@property (retain) NSDate *showFrom;
@property (retain) NSDate *updatedAt;

@end
