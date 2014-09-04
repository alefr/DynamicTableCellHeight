//
//  DynamicTableViewCell.h
//  InstagramTests
//
//  Created by Alexander Fridlund on 2014-09-02.
//  Copyright (c) 2014 Screenlab Research AB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *firstArtwork;
@property (strong, nonatomic) IBOutlet UIImageView *secondArtwork;

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UILabel *numArtworks;

#pragma mark - 


#pragma mark -

@end
