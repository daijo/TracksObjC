//
//  PWSTracksProject.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksProject <NSObject>

@property (copy) NSString *name;
@property (copy) NSString *desc;
@property (copy) NSString *state;
@property (copy) NSString *defaultTags;
@property (copy) NSNumber *ID;
@property (copy) NSNumber *defaultContextID;
@property (copy) NSNumber *position;
@property (retain) NSDate *createdAt;
@property (retain) NSDate *updatedAt;
@property (retain) NSDate *completedAt;

@end
