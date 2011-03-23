//
//  PWSTracksTodoFactory.m
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import "PWSTracksTodoFactory.h"


@implementation PWSTracksTodoFactory

#pragma mark -
#pragma mark Internal implementation declaration

static NSDictionary *localEndElement;

static NSDictionary *localStartElement;

#pragma mark -
#pragma mark Memory and member management

//Retain
@synthesize todo;

-(void)cleanUp {
    self.todo = nil;
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

-(void)startElementTodo {
    
    self.todo = [PWSTracksTodoImp todo];
}

-(void)endElementTodo {
    
    [(id<PWSTracksTodoServiceDelegate>)self.delegate todoService:self
                                                           gotTodo:self.todo];
}

-(void)endElementNotes {
    
    if([currentStringValue length] > 0) {
        self.todo.notes = currentStringValue;
    }
}

-(void)endElementDescription {
    
    if([currentStringValue length] > 0) {
        self.todo.title = currentStringValue; // Yes, I call it title to avoid confusion.
    }
}

-(void)endElementState {
    
    if([currentStringValue length] > 0) {
        self.todo.state = currentStringValue;
    }
}

-(void)endElementIPAddress {
    
    if([currentStringValue length] > 0) {    
        self.todo.IPAddress = currentStringValue;
    }
}

-(void)endElementID {
    
    if([currentStringValue length] > 0) {
        self.todo.ID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementContextID {
    
    if([currentStringValue length] > 0) {
        self.todo.contextID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementProjectID {
    
    if([currentStringValue length] > 0) {
        self.todo.projectID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementRecurringTodoID {
    
    if([currentStringValue length] > 0) {
        self.todo.recurringTodoID = [NSNumber numberWithInteger:[currentStringValue integerValue]];
    }
}

-(void)endElementCreatedAt {
    self.todo.createdAt = [self createDateFromString:currentStringValue];
}

-(void)endElementUpdatedAt {
    self.todo.updatedAt = [self createDateFromString:currentStringValue];
}

-(void)endElementCompletedAt {
    self.todo.createdAt = [self createDateFromString:currentStringValue];
}

-(void)endElementDueAt {
    self.todo.dueAt = [self createDateFromString:currentStringValue];
}

-(void)endElementShowFrom {
    self.todo.showFrom = [self createDateFromString:currentStringValue];
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
       (startElementTodo)], @"todo",
      nil] retain];
    
    localEndElement =
    [[NSDictionary dictionaryWithObjectsAndKeys:
      [NSValue valueWithPointer:@selector
       (endElementTodo)], @"todo",
      [NSValue valueWithPointer:@selector
       (endElementNotes)], @"notes",
      [NSValue valueWithPointer:@selector
       (endElementDescription)], @"description",
      [NSValue valueWithPointer:@selector
       (endElementIPAddress)], @"ip-address",
      [NSValue valueWithPointer:@selector
       (endElementState)], @"state",
      [NSValue valueWithPointer:@selector
       (endElementID)], @"id",
      [NSValue valueWithPointer:@selector
       (endElementContextID)], @"context-id",
      [NSValue valueWithPointer:@selector
       (endElementProjectID)], @"project-id",
      [NSValue valueWithPointer:@selector
       (endElementRecurringTodoID)], @"recurring-todo-id",
      [NSValue valueWithPointer:@selector
       (endElementCreatedAt)], @"created-at",
      [NSValue valueWithPointer:@selector
       (endElementUpdatedAt)], @"updated-at",
      [NSValue valueWithPointer:@selector
       (endElementCompletedAt)], @"completed-at",
      [NSValue valueWithPointer:@selector
       (endElementDueAt)], @"due-at",
      [NSValue valueWithPointer:@selector
       (endElementShowFrom)], @"show-from",
      [NSValue valueWithPointer:@selector
       (endElementError)], @"error",
      nil] retain];
}

#pragma mark -
#pragma mark Interface implementation
#pragma mark - Class

+(PWSTracksTodoFactory *)todoFactoryWithDelegate:
(id<PWSTracksTodoServiceDelegate>)delegate {
    return [[[PWSTracksTodoFactory alloc] initWithDelegate:delegate] autorelease]; 
}

#pragma mark - Instance

-(void)getTodos {
	
	[self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/todos.xml",
					   [PWSTracksBaseFactory serverAddress]]];
}

-(void)getTodoById:(NSNumber *)todoId {
    
    [self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/todos/%@.xml",
					   [PWSTracksBaseFactory serverAddress],
                       [todoId stringValue]]];
}

-(void)getTodosByContextId:(NSNumber *)contextId {
    
    [self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/contexts/%@/todos.xml",
					   [PWSTracksBaseFactory serverAddress],
                       [contextId stringValue]]];
}

-(void)getTodosByProjectId:(NSNumber *)projectId {
    
    [self makeRequest:[NSString
					   stringWithFormat:
					   @"%@/projects/%@/todos.xml",
					   [PWSTracksBaseFactory serverAddress],
                       [projectId stringValue]]];
}

@end
