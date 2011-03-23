//
//  PWSTracksTodoImp.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/16/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoImp.h"


@implementation PWSTracksTodoImp

@synthesize title;
@synthesize notes;
@synthesize state;
@synthesize IPAddress;
@synthesize ID;
@synthesize contextID;
@synthesize projectID;
@synthesize recurringTodoID;
@synthesize completedAt;
@synthesize createdAt;
@synthesize dueAt;
@synthesize showFrom;
@synthesize updatedAt;

+(id<PWSTracksTodo>)todo {
	return [[[PWSTracksTodoImp alloc] init] autorelease]; 
}

-(NSString *)description {
    
	return [NSString
			stringWithFormat:@"\nSTART - PWSTracksTodo\n"
			"Description:%@\n"
			"Notes:%@\n"
			"State:%@\n"
			"ID:%@\n"
			"Contect ID:%@\n"
			"Project ID:%@\n"
			"Completed At:%@\n"
			"Due At:%@\n"
			"Show From:%@\n"
			"Updated At:%@\n"
			"IP Address:%@\n"
			"END - PWSTracksTodo\n",
            self.title,
            self.notes,
            self.state,
            self.ID,
            self.contextID,
            self.projectID,
            self.recurringTodoID,
            self.completedAt,
            self.createdAt,
            self.dueAt,
            self.showFrom,
            self.updatedAt,
            self.IPAddress];
}

- (void)dealloc {
    
    self.title = nil;
    self.notes = nil;
    self.state = nil;
    self.ID = nil;
    self.contextID = nil;
    self.projectID = nil;
    self.recurringTodoID = nil;
    self.completedAt = nil;
    self.createdAt = nil;
    self.dueAt = nil;
    self.showFrom = nil;
    self.updatedAt = nil;
    self.IPAddress = nil;
	[super dealloc];
}

@end
