//
//  TTFData.h
//  iosferaltar
//
//  Created by Eduardo Tonini on 26/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTFData : NSObject

@property (nonatomic, strong) NSString *fromID;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *toID;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, strong) NSString *pax;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) NSString *transfer;
@property (nonatomic, strong) NSString *fromDest;
@property (nonatomic, strong) NSString *toDest;
@property (nonatomic, strong) NSString *ow;
@property (nonatomic, strong) NSString *rt;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *owDiscount;
@property (nonatomic, strong) NSString *rtDiscount;

@property (nonatomic, strong) NSString *primaryPassengerName;
@property (nonatomic, strong) NSString *emailAdress;
@property (nonatomic, strong) NSString *mobilPhone;
@property (nonatomic, strong) NSString *airline;
@property (nonatomic, strong) NSString *flight;
@property (nonatomic, strong) NSString *dayAndTime;

@property (nonatomic, strong) NSString *other;

//@property (nonatomic, strong) NSArray *include;

@end
