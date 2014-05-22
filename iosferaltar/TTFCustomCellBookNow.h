//
//  TTFFormCell.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 05/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFCustomCellBookNow : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *image;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) IBOutlet UILabel *labelText;
@property (nonatomic, strong) IBOutlet UILabel *labelField;

@end
