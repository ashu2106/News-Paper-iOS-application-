//
//  DetailViewController.m
//  HTMLParsing
//
//  Created by Matt Galloway on 19/05/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "TFHpple.h"


@interface DetailViewController ()

{
    NSMutableArray *_objects;
}
- (void)configureView;

@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize description_text =_description_text;
@synthesize detail_image=_detail_image;
 

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    //if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
        
        // Update the view.
        
        [self load_description];
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = _description_text ;
        _detail_image = [[UIImageView alloc] initWithFrame:CGRectMake(05,60,310,250)];
        _detail_image.backgroundColor = [UIColor blackColor];
         NSString *ImageURL = @"http://www.lokmat.com/gall_content/2014/09/22/2014-09-22~doctor2_ns.jpg";
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
        _detail_image.image = [UIImage imageWithData:imageData];
  
        [self.view addSubview:_detail_image];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load_description];
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.detailDescriptionLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}


- (void)load_description {
    
    NSURL *tutorialsUrl = [NSURL URLWithString:[self.detailItem url]];
    NSData *tutorialsHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
    
    
    TFHpple *tutorialsParser = [TFHpple hppleWithHTMLData:tutorialsHtmlData];
    
   
    NSString *tutorialsXpathQueryString_headline = @"//ul[@class='article-list-inner']/li/p";
    
    NSArray *tutorialsNodes_headline = [tutorialsParser searchWithXPathQuery:tutorialsXpathQueryString_headline];
    
     TFHppleElement *element_title;
    
    _description_text= @" ";
    
     NSString *description_text_temp;
     for (int i =0 ; i<tutorialsNodes_headline.count; i++)
     {
        
        element_title = tutorialsNodes_headline[i];
        
        description_text_temp = [[element_title firstChild]content];
        
         
        _description_text = [_description_text stringByAppendingString:description_text_temp];
         
    }
}

							
@end
