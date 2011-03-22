//
//  PWSTracksTodoFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksBaseFactory.h"
#import "PWSTracksTodoServiceDelegate.h"
#import "PWSTracksTodoImp.h"

@interface PWSTracksTodoFactory : PWSTracksBaseFactory {
    PWSTracksTodoImp* todo;
}

@property (retain) PWSTracksTodoImp* todo;

-(void)getTodos;
-(void)getTodoById:(NSNumber *)todoId;
-(void)getTodosByContextId:(NSNumber *)contextId;
-(void)getTodosByProjectId:(NSNumber *)projectId;

+(PWSTracksTodoFactory *)todoFactoryWithDelegate:
(id<PWSTracksTodoServiceDelegate>)delegate;

@end
