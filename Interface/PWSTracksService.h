//
//  PWSTracksService.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/22/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PWSTracksService <NSObject>

-(void)cancelRequest;

@end

/**
 * Error domain string used when tracksService:didFailWithError: is called.
 */
extern NSString * const PWSTracksErrorDomain;

typedef enum {
    PWSTracksServerError = 1, /**< Error recieved from the server */
    PWSTracksParserError = 2, /**< Error in parsing data from server */
    PWSTracksConnectionError = 3, /**< Error connecting to server */
} PWSTracksError;

