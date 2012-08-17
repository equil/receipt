//
//  IGRCCategoryTableViewController.h
//  receipt
//
//  Created by Alexey Rogatkin on 15.08.12.
//
//

#import <UIKit/UIKit.h>

@class NSFetchedResultsController;

@interface IGRCCategoryTableViewController : UITableViewController
@property(nonatomic, readonly) NSFetchedResultsController *fetchResultsController;
@end
