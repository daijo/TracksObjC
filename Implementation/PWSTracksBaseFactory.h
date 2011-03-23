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
    NSMutableData *receivedData;
    NSString *request;
    NSXMLParser* parser;
    NSURLConnection *connection;
    NSMutableString *currentStringValue;
    BOOL failSent;
    BOOL cancelling;
    id<PWSTracksServiceDelegate> delegate; 
    NSDictionary *endElement;
    NSDictionary *startElement;
}

@property (retain) NSMutableData* receivedData;
@property (retain) NSXMLParser* parser;
@property (retain) NSURLConnection *connection;
@property (retain) NSMutableString *currentStringValue;
@property (copy) NSString* request;
@property (assign) BOOL failSent;
@property (assign) BOOL cancelling;
@property (retain) id<PWSTracksServiceDelegate> delegate;
@property (readonly, retain) NSDictionary *endElement;
@property (readonly, retain) NSDictionary *startElement;

+(void)setServerAddress:(NSString *)newServerAddress;
+(NSString *)serverAddress;

-(id<PWSTracksService>)initWithDelegate:(id<PWSTracksServiceDelegate>)newDelegate;
-(void)makeRequest:(NSString *) url;
-(void)cancelRequest;
-(void)cleanUp;
-(void)handleErrorWithCode:(PWSTracksError)code;
-(NSDate *)createDateFromString:(NSString *)string;
+(void)setServerAddress:(NSString *)newServerAddress;
+(NSString *)serverAddress;

@end
