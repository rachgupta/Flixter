//
//  GridViewController.m
//  Flixter
//
//  Created by Rachna Gupta on 6/17/22.
//

#import "GridViewController.h"
#import "GridCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface GridViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UICollectionView *gridView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;


@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // [self.activityIndicator startAnimating];
    self.gridView.dataSource = self;
    self.gridView.delegate = self;
    [self fetchMovies];
    // self.refreshControl = [[UIRefreshControl alloc] init];
    // [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    // [self.gridView insertSubview:self.refreshControl atIndex:0];
    // Do any additional setup after loading the view.
}
- (void)fetchMovies {
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=b4aea5f984397bd225c805413c3f13c2"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot Get Movies"
                                                                                          message:@"The internet connection appears to be offline"
                                                                                   preferredStyle:(UIAlertControllerStyleAlert)];
               UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * _Nonnull action) {
                   [self fetchMovies];
                                                                        // handle response here.
                                                                }];
               // add the OK action to the alert controller
               [alert addAction:okAction];
               [self presentViewController:alert animated:YES completion:^{
                   // optional code for what happens after the alert controller has finished presenting
               }];
               NSLog(@"%@", [error localizedDescription]);
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               self.movies = dataDictionary[@"results"];
               [self.gridView reloadData];
               NSLog(@"%@", self.movies);
               // TODO: Get the array of movies
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
       }];
    [task resume];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridCell" forIndexPath:indexPath];
    NSDictionary *movie = self.movies[indexPath.item];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterPath = movie[@"poster_path"];
    // NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSString *posterURLString = [NSString stringWithFormat:@"%@%@", baseURLString, posterPath];
    NSURL *posterURL = [NSURL URLWithString:posterURLString];
    // cell.gridPoster = nil;
    [cell.gridPoster setImageWithURL:posterURL];
    return cell;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSIndexPath *myPath = [self.gridView indexPathForCell:sender];
    NSDictionary *dataToPass = self.movies[myPath.item];
    DetailsViewController *detailVC = [segue destinationViewController];
    detailVC.detailDict = dataToPass;
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
