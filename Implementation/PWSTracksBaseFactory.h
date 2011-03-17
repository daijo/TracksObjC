//
//  PWSTracksBaseFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PWSTracksBaseFactory : NSObject {
    
}

+(void)setServerAddress:(NSString *)newServerAddress;
+(NSString *)serverAddress;

-(void)makeRequest:(NSString *) url;
@end
