//
//  DynamicContent.h
//  DynamicCellHeight
//
//  Created by Alexander Fridlund on 2014-09-03.
//  Copyright (c) 2014 Screenlab Research AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DynamicContent : NSObject
@property (nonatomic, strong) UIImage *firstImage;
@property (nonatomic, strong) UIImage *secondImage;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *numImages;

@end
