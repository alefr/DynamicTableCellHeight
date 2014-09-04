//
//  DynamicTableViewCell.m
//  InstagramTests
//
//  Created by Alexander Fridlund on 2014-09-02.
//  Copyright (c) 2014 Screenlab Research AB. All rights reserved.
//

#import "DynamicTableViewCell.h"

@implementation DynamicTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        /*[self loadViews];
        [self constrainViews];*/
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
