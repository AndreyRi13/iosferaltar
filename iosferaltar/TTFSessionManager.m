//
//  TTFHTTPSessionManager.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 06/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFSessionManager.h"

//static NSString * const baseURLString = @"http://localhost/projrestful/";
static NSString * const baseURLString = @"http://www.api.cancunreservation.net/";

@implementation TTFSessionManager

+ (instancetype)sharedInstance {
    static TTFSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // Network activity indicator manager setup
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        // Session configuration setup
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfiguration.HTTPAdditionalHeaders = @{ @"User-Agent"    : @"iOS Client",
                                                        @"Content-Type"  : @"application/json; charset=UTF-8",
                                                        @"Content-MD5"   : @"b04b77ac5851224ac844547bc6e61915" };
        
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024     // 10MB. memory cache
                                                          diskCapacity:50 * 1024 * 1024     // 50MB. on disk cache
                                                              diskPath:nil];
        
        sessionConfiguration.URLCache = cache;
        sessionConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        
        // Initialize the session
        _sharedInstance = [[TTFSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString] sessionConfiguration:sessionConfiguration];
        
    });
    
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
    if (!self) return nil;
    
    // Configuraciones adicionales de la sesión
    
    return self;
}

@end

