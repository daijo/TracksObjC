//
//  PWSTracksProjectFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/29/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksBaseFactory.h"
#import "PWSTracksProjectServiceDelegate.h"
#import "PWSTracksProjectImp.h"


@interface PWSTracksProjectFactory : PWSTracksBaseFactory {
    PWSTracksProjectImp* project;
}

@property (retain) PWSTracksProjectImp* project;

-(void)getProjects;
-(void)getProjectById:(NSNumber *)projectId;

+(PWSTracksProjectFactory *)projectFactoryWithDelegate:
(id<PWSTracksProjectServiceDelegate>)delegate;

@end
