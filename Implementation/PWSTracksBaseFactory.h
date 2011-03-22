//
//  PWSTracksBaseFactory.h
//  TracksObjC
//
//  Created by Daniel Hjort on 3/17/11.
//  Copyright 2011 Patchwork Solutions AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWSTracksService.h"
#import "PWSTracksServiceDelegate.h"


@interface PWSTracksBaseFactory : NSObject <PWSTracksService, NSXMLParserDelegate> {
    NSURLConnection *connection;
    NSMutableData *receivedData;
    NSXMLParser *parser;
}

@property (retain) NSURLConnection *connection;
@property (retain) NSMutableData *receivedData;
@property (retain) NSXMLParser *parser;

+(void)setServerAddress:(NSString *)newServerAddress;
+(NSString *)serverAddress;

-(void)makeRequest:(NSString *) url;
@end
