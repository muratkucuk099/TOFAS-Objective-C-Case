//
//  ViewController.h
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> 

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

