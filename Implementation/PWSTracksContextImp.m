//
//  PWSTracksContextImp.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/23/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksContextImp.h"


@implementation PWSTracksContextImp

// Copy
@synthesize name, ID, position;

// Retain
@synthesize createdAt, updatedAt;

// Assign
@synthesize hide;

+(id<PWSTracksContext>) context {
    return [[[PWSTracksContextImp alloc] init] autorelease]; 
}

-(NSString *)description {
    
	return [NSString
			stringWithFormat:@"\nSTART - PWSTracksContext\n"
			"Name:%@\n"
			"ID:%@\n"
			"Position:%@\n"
			"Created at:%@\n"
			"Updated At:%@\n"
			"Hide:%@\n"
			"END - PWSTracksContext\n",
            self.name,
            self.ID,
            self.position,
            self.createdAt,
            self.updatedAt,
            self.hide ? @"YES" : @"NO"];
}

- (void)dealloc {
    
    self.name = nil;
    self.ID = nil;
    self.position = nil;
    self.createdAt = nil;
    self.updatedAt = nil;
	[super dealloc];
}

@end
