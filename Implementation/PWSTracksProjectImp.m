//
//  PWSTracksProjectImp.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksProjectImp.h"


@implementation PWSTracksProjectImp

// Copy
@synthesize name, desc, state, defaultTags, ID, defaultContextID, position;

// Retain
@synthesize createdAt, updatedAt, completedAt;

+(id<PWSTracksProject>) project {
    return [[[PWSTracksProjectImp alloc] init] autorelease]; 
}

-(NSString *)description {
    
	return [NSString
			stringWithFormat:@"\nSTART - PWSTracksProject\n"
			"Name:%@\n"
            "Description:%@\n"
            "State:%@\n"
            "Default Tags:%@\n"
			"ID:%@\n"
            "Default Context ID:%@\n"
			"Position:%@\n"
			"Created at:%@\n"
			"Updated At:%@\n"
            "Completed At:%@\n"
			"END - PWSTracksProject\n",
            self.name,
            self,desc,
            self,state,
            self.defaultTags,
            self.ID,
            self.defaultContextID,
            self.position,
            self.createdAt,
            self.updatedAt,
            self.completedAt];
}

- (void)dealloc {
    
    self.name = nil;
    self.desc = nil;
    self.state = nil;
    self.defaultTags = nil;
    self.ID = nil;
    self.defaultContextID = nil;
    self.position = nil;
    self.createdAt = nil;
    self.updatedAt = nil;
    self.completedAt = nil;
	[super dealloc];
}


@end
