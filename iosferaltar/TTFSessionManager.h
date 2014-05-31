//
//  TTFHTTPSessionManager.h
//  iosferaltar
//
//  Created by Eduardo Tonini on 06/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface TTFSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
