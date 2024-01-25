//
//  ViewController.m
//  TOFAS OBJECTIVE-C
//
//  Created by Mac on 25.01.2024.
//

#import "ViewController.h"
#import "TableViewModel.h"
#import "MainTableViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) TableViewModel *viewModel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"reusableID"];
    
    self.viewModel = [[TableViewModel alloc] init];
    [self.viewModel performGetRequest:^(void) {
        [self.tableView reloadData];
    }];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

- (void)handleRefresh:(UIRefreshControl *)refreshControl {
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel getCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"reusableID";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    PostModel *post = [self.viewModel getOnePostAtIndex:indexPath.row];
    cell.titleLabel.text = post.title;
    cell.bodyLabel.text = post.body;
    
    return cell;
}

@end
