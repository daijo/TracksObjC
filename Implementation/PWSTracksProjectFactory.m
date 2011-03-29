//
//  PWSTracksProjectFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksProjectFactory.h"


@implementation PWSTracksProjectFactory

#pragma mark -
#pragma mark Internal implementation declaration

static NSDictionary *localEndElement;

static NSDictionary *localStartElement;

#pragma mark -
#pragma mark Memory and member management

//Retain
@synthesize project;

-(void)cleanUp {
    self.project = nil;
    [super cleanUp];
}

-(void)dealloc {
    [self cleanUp];
    [super dealloc];
}

-(NSDictionary *)startElement {
    
    return localStartElement;
}

-(NSDictionary *)endElement {
    
    return localEndElement;
}

#pragma mark -
#pragma mark Internal implementation declaration

-(void)startElementProject {
    
    self.project = [PWSTracksProjectImp project];
}

-(void)endElementProject {
    
    [(id<PWSTracksProjectServiceDelegate>)self.delegate projectService:self gotProject:self.project];
}

-(void)endElementName {
    
    if([currentStringValue length] > 0) {
        self.project.name = currentStringValue;
    }
}

-(void)endElementDescription {
    
    if([currentStringValue length] > 0) {
        self.project.desc = currentStringValue;
    }
}

-(void)endElementState {
    
    if([currentStringValue length] > 0) {
        self.project.state = currentStringValue;
    }
}

-(void)endElementDefaultTags {
    
    if([currentStringValue length] > 0) {
        self.project.defaultTags = currentStringValue;
    }
}

-(void)endElementID {
    
    if([currentStringValue length] > 0) {
        self.project.ID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementDefaultContextId {
    
    if([currentStringValue length] > 0) {
        self.project.defaultContextID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementCreatedAt {
    self.project.createdAt = [self createDateFromString:currentStringValue];
}

-(void)endElementUpdatedAt {
    self.project.updatedAt = [self createDateFromString:currentStringValue];
}

-(void)endElementCompletedAt {
    self.project.completedAt = [self createDateFromString:currentStringValue];
}

-(void)endElementPosition {
    if([currentStringValue length] > 0) {
        self.project.position = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementError {
    
    [self handleErrorWithCode:PWSTracksServerError];
}

#pragma mark -
#pragma mark Super override implementation

+(void)initialize {
    
    localStartElement =
    [[NSDictionary dictionaryWithObjectsAndKeys:
      [NSValue valueWithPointer:@selector
       (startElementProject)], @"project",
      nil] retain];
    
    localEndElement =
    [[NSDictionary dictionaryWithObjectsAndKeys:
      [NSValue valueWithPointer:@selector
       (endElementProject)], @"project",
      [NSValue valueWithPointer:@selector
       (endElementName)], @"name",
      [NSValue valueWithPointer:@selector
       (endElementDescription)], @"description",
      [NSValue valueWithPointer:@selector
       (endElementState)], @"state",
      [NSValue valueWithPointer:@selector
       (endElementID)], @"id",
      [NSValue valueWithPointer:@selector
       (endElementDefaultContextId)], @"default-context-id",
      [NSValue valueWithPointer:@selector
       (endElementDefaultTags)], @"default-tags",
      [NSValue valueWithPointer:@selector
       (endElementCreatedAt)], @"created-at",
      [NSValue valueWithPointer:@selector
       (endElementUpdatedAt)], @"updated-at",
      [NSValue valueWithPointer:@selector
       (endElementCompletedAt)], @"completed-at",
      [NSValue valueWithPointer:@selector
       (endElementPosition)], @"position",
      [NSValue valueWithPointer:@selector
       (endElementError)], @"error",
      nil] retain];
}

#pragma mark -
#pragma mark Interface implementation
#pragma mark - Class

+(PWSTracksProjectFactory *)projectFactoryWithDelegate:
(id<PWSTracksProjectServiceDelegate>)delegate {
    return [[[PWSTracksProjectFactory alloc] initWithDelegate:delegate] autorelease]; 
}

#pragma mark - Instance

-(void)getProjects {
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/projects.xml",
					   [PWSTracksBaseFactory serverAddress]]];
}

-(void)getProjectById:(NSNumber *)projectId {
    
    [self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/projects/%@.xml",
					   [PWSTracksBaseFactory serverAddress],
                       projectId]];
}

@end
