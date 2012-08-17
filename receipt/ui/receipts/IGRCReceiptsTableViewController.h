//
//  IGRCReceiptsTableViewController.h
//  receipt
//
//  Created by Alexey Rogatkin on 15.08.12.
//
//

#import <UIKit/UIKit.h>

@class Category;

@interface IGRCReceiptsTableViewController : UITableViewController

@property(nonatomic, assign) BOOL showOnlyFavorites;
@property(nonatomic, retain) Category *fromCategory;

@end
