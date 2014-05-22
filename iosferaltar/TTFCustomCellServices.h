//
//  TTFCustomCellServices.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 10/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFCustomCellServices : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *money;
@property (nonatomic, strong) IBOutlet UIImageView *image;
@property (nonatomic, strong) IBOutlet UILabel *owLabel;
@property (nonatomic, strong) IBOutlet UILabel *rtLabel;
@property (nonatomic, strong) IBOutlet UIButton *owButton;
@property (nonatomic, strong) IBOutlet UIButton *rtButton;
@property (nonatomic, strong) IBOutlet UILabel *msg;
@property (nonatomic, strong) IBOutlet UIButton *moreinfo;

@end
