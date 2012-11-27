//
//  FBAppAccessToken.m
//  FBAppAccessToken
//
//  Created by Danilo Priore on 27/11/12.
//  Copyright (c) 2012 Prioregorup.com. All rights reserved.
//
// Facebook Token to exchange app information.
// Can use the token to authenticate an application for a web service.
//

#import "FBAppAccessToken.h"

@implementation FBAppAccessToken

+ (NSString*)getAppAccessTokenWithAppId:(NSString*)appId cosumerSecret:(NSString*)secret
{
    // get application access token
    NSString *link = [NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=client_credentials", appId, secret];
    NSURL *url = [NSURL URLWithString:link];
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *params = [token componentsSeparatedByString:@"="];
    if (![[params objectAtIndex:0] isEqualToString:@"access_token"]) {
        // ERROR
        return nil;
    }
    
    return [params objectAtIndex:1];
}

+ (NSDictionary*)getAppInfoFromToken:(NSString*)token
{
    // get application info
    NSString *link = [NSString stringWithFormat:@"https://graph.facebook.com/app?access_token=%@", [token stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL *url = [NSURL URLWithString:link];
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:nil];
    NSDictionary *json = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return json;
}

@end
