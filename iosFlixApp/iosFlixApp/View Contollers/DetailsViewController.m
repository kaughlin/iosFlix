//
//  DetailsViewController.m
//  iosFlixApp
//
//  Created by Kaughlin Caver on 11/12/18.
//  Copyright © 2018 Kaughlin Caver. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UIImageView *backDropView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    //posterView
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString: posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    self.posterView.image = nil;
    [self.posterView setImageWithURL: posterURL];
    
    //backdrop view
    NSString *backDropURLString = self.movie[@"backdrop_path"];
    NSString *fullBackDropURLString = [baseURLString stringByAppendingString: backDropURLString];
    NSURL *backDropURL = [NSURL URLWithString:fullBackDropURLString];
    self.backDropView.image = nil;
    [self.backDropView setImageWithURL: backDropURL];
    
    //title
    self.titleLabel.text = self.movie[@"title"];
    [self.titleLabel sizeToFit];
    //description
    self.synopsisLabel.text = self.movie[@"overview"];
    [self.synopsisLabel sizeToFit];
    
    

    
    
    
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
