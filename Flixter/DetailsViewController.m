//
//  DetailsViewController.m
//  Flixter
//
//  Created by Rachna Gupta on 6/16/22.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdrop;
@property (weak, nonatomic) IBOutlet UIImageView *detailedPoster;
@property (weak, nonatomic) IBOutlet UILabel *detailedTitle;
@property (weak, nonatomic) IBOutlet UILabel *detailedOverview;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailedTitle.text = self.detailDict[@"title"];
    self.detailedOverview.text = self.detailDict[@"overview"];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.detailDict[@"poster_path"];
    NSString *backdropURLString = self.detailDict[@"backdrop_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
    self.detailedPoster.image = nil;
    [self.detailedPoster setImageWithURL:posterURL];
    self.backdrop.image = nil;
    [self.backdrop setImageWithURL:backdropURL];
    // Do any additional setup after loading the view.
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
