//
//  DetailViewController.h
//  HTMLParsing
//
//  Created by Matt Galloway on 19/05/2012.
//  Copyright (c) 2012 Swipe Stack Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *detail_image;

@property (strong, nonatomic) id detailItem;

 
@property (strong, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@property (nonatomic, copy) NSMutableString *description_text;

 
@end
