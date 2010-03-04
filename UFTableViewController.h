//
//  UFTableViewController.h
//  UrzasFactory
//
//  Created by Cameron Knight on 2/27/10.
//  Copyright 2010 Moblico. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UFTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView * _tableView;
}

@property (nonatomic, retain) UITableView * tableView;
@end
