//
//  ClassicDynamicHeightTableViewController.m
//  DynamicCellHeight
//
//  Created by Alexander Fridlund on 2014-09-03.
//  Copyright (c) 2014 Screenlab Research AB. All rights reserved.
//

#import "ClassicDynamicHeightTableViewController.h"
#import "DynamicContent.h"
#import "DynamicTableViewCell.h"

@interface ClassicDynamicHeightTableViewController ()
@property (nonatomic, strong) NSArray *tableData;

@end

@implementation ClassicDynamicHeightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    
    // Populate dummy data
    DynamicContent *content1 = [DynamicContent new];
    content1.firstImage = [UIImage imageNamed:@"lake"];
    content1.secondImage = [UIImage imageNamed:@"oia"];
    content1.name = @"Museum of modern art (MOMA)";
    content1.numImages = @(85);
    
    DynamicContent *content2 = [DynamicContent new];
    content2.firstImage = [UIImage imageNamed:@"sunset"];
    content2.secondImage = [UIImage imageNamed:@"tuscany"];
    content2.name = @"Thielska";
    content2.numImages = @(25);
    
    DynamicContent *content3 = [DynamicContent new];
    content3.firstImage = [UIImage imageNamed:@"flower"];
    content3.secondImage = [UIImage imageNamed:@"fox"];
    content3.name = @"Fotografiska";
    content3.numImages = @(20);
    
    self.tableData = @[content1, content2, content3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dynamicCell" forIndexPath:indexPath];
    
    [self populateCell:cell withContent:self.tableData[indexPath.row]];

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Don't care about memory leaks now:
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dynamicCell"];

    [self populateCell:cell withContent:self.tableData[indexPath.row]];
    
    // Make sure the constraints have been set up for this cell, since it may have just been created from scratch.
    // Use the following lines, assuming you are setting up constraints from within the cell's updateConstraints method:
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    // Set the width of the cell to match the width of the table view. This is important so that we'll get the
    // correct cell height for different table view widths if the cell's height depends on its width (due to
    // multi-line UILabels word wrapping, etc). We don't need to do this above in -[tableView:cellForRowAtIndexPath]
    // because it happens automatically when the cell is used in the table view.
    // Also note, the final width of the cell may not be the width of the table view in some cases, for example when a
    // section index is displayed along the right side of the table view. You must account for the reduced cell width.
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
 
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints.
    // (Note that you must set the preferredMaxLayoutWidth on multi-line UILabels inside the -[layoutSubviews] method
    // of the UITableViewCell subclass, or do it manually at this point before the below 2 lines!)
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell's contentView
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // So we can read debug values
    CGRect contentFrame = cell.contentView.frame;
    CGRect firstImageFrame = cell.firstArtwork.frame;
    CGRect secondImageFrame = cell.secondArtwork.frame;
    CGRect nameFrame = cell.name.frame;
    CGRect numArtworksFrame = cell.numArtworks.frame;
    
    // Add an extra point to the height to account for the cell separator, which is added between the bottom
    // of the cell's contentView and the bottom of the table view cell.
    height += 1.0f;
    return height;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (void)populateCell:(DynamicTableViewCell*)cell withContent:(DynamicContent*)content
{
    cell.firstArtwork.image = content.firstImage;
    cell.secondArtwork.image = content.secondImage;
    cell.name.text = content.name;
    cell.numArtworks.text = [NSString stringWithFormat:@"%@ artworks", content.numImages];
}

@end
