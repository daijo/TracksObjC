//
//  PWSTracksContext.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksContext <NSObject>

@property (copy) NSString *name;
@property (copy) NSNumber *ID;
@property (copy) NSNumber *position;
@property (retain) NSDate *createdAt;
@property (retain) NSDate *updatedAt;
@property (assign) BOOL hide;

@end
