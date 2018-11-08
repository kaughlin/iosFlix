//
//  MoviesViewController.m
//  iosFlixApp
//
//  Created by Kaughlin Caver on 11/7/18.
//  Copyright © 2018 Kaughlin Caver. All rights reserved.
//

#import "MoviesViewController.h"

@interface MoviesViewController () <UITableViewDataSource ,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *movies;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Do any additional setup after loading the view.
    //network request
    //set up
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //lines inside block called once network call is finished
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
        else {
            NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //"%@" means about to specify object
            //log data from api to
            NSLog(@"%@", dataDictionary);
            // TODO: Get the array of movies
            self.movies = dataDictionary[@"results"];
            // go through each element in the dictionary
            for(NSDictionary *movie in self.movies){
                NSLog(@"%@",movie[@"title"]);
            }
            // TODO: Store the movies in a property to use elsewhere
            // TODO: Reload your table view data
            [self.tableView reloadData];
        }
    }];
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // in java it would look like
    //UITableViewCell *cell = UITableViewCell();
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
//    NSLog(@"%@", [NSString stringWithFormat: @"row: %d, section %d", indexPath.row, indexPath.section]);
    NSDictionary *movie = self.movies[indexPath.row];
    cell.textLabel.text =  movie[@"title"];
//    cell.textLabel.text = [NSString stringWithFormat: @"row: %d, section %d", indexPath.row, indexPath.section];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
