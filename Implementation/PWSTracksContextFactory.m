//
//  PWSTracksContextFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/24/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksContextFactory.h"


@implementation PWSTracksContextFactory

#pragma mark -
#pragma mark Internal implementation declaration

static NSDictionary *localEndElement;

static NSDictionary *localStartElement;

#pragma mark -
#pragma mark Memory and member management

//Retain
@synthesize context;

-(void)cleanUp {
    self.context = nil;
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

-(void)startElementContext {
    
    self.context = [PWSTracksContextImp context];
}

-(void)endElementContext {
    
    [(id<PWSTracksContextServiceDelegate>)self.delegate contextService:self
                                                         gotContext:self.context];
}

-(void)endElementName {
    
    if([currentStringValue length] > 0) {
        self.context.name = currentStringValue;
    }
}

-(void)endElementID {
    
    if([currentStringValue length] > 0) {
        self.context.ID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementCreatedAt {
    self.context.createdAt = [self createDateFromString:currentStringValue];
}

-(void)endElementUpdatedAt {
    self.context.updatedAt = [self createDateFromString:currentStringValue];
}

-(void)endElementHide {
    self.context.hide = [currentStringValue isEqualToString:@"true"];
}

-(void)endElementPosition {
    if([currentStringValue length] > 0) {
        self.context.position = [NSNumber numberWithInteger:[currentStringValue integerValue]];
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
       (startElementContext)], @"context",
      nil] retain];
    
    localEndElement =
    [[NSDictionary dictionaryWithObjectsAndKeys:
      [NSValue valueWithPointer:@selector
       (endElementContext)], @"context",
      [NSValue valueWithPointer:@selector
       (endElementName)], @"name",
      [NSValue valueWithPointer:@selector
       (endElementID)], @"id",
      [NSValue valueWithPointer:@selector
       (endElementCreatedAt)], @"created-at",
      [NSValue valueWithPointer:@selector
       (endElementUpdatedAt)], @"updated-at",
      [NSValue valueWithPointer:@selector
       (endElementHide)], @"hide",
      [NSValue valueWithPointer:@selector
       (endElementPosition)], @"position",
      [NSValue valueWithPointer:@selector
       (endElementError)], @"error",
      nil] retain];
}

#pragma mark -
#pragma mark Interface implementation
#pragma mark - Class

+(PWSTracksContextFactory *)contextFactoryWithDelegate:
(id<PWSTracksContextServiceDelegate>)delegate {
    return [[[PWSTracksContextFactory alloc] initWithDelegate:delegate] autorelease]; 
}

#pragma mark - Instance

-(void)getContexts {
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/contexts.xml",
					   [PWSTracksBaseFactory serverAddress]]];
}

-(void)getContextById:(NSNumber *)contextId {
    
    [self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/contexts/%@.xml",
					   [PWSTracksBaseFactory serverAddress],
                       contextId]];
}

@end
