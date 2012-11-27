//
//  FBAppAccessToken.h
//  FBAppAccessToken
//
//  Created by Danilo Priore on 27/11/12.
//  Copyright (c) 2012 Prioregorup.com. All rights reserved.
//
// Facebook Token to exchange app information.
// Can use the token to authenticate an application for a web service.
//

#import <Foundation/Foundation.h>

@interface FBAppAccessToken : NSObject

+ (NSString*)getAppAccessTokenWithAppId:(NSString*)appId cosumerSecret:(NSString*)secret;
+ (NSDictionary*)getAppInfoFromToken:(NSString*)token;

@end
