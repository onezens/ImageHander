//
//  ViewController.m
//  ImageHander
//
//  Created by wz on 2017/11/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import "ViewController.h"
#import "ImageHander.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)handerImageAction:(id)sender {
    UIImage *image = [UIImage imageNamed:@"fengjing"];
    self.imageView.image = [ImageHander opencvImage:image level:10];
}
- (IBAction)oriImageAction:(id)sender {
    UIImage *image = [UIImage imageNamed:@"fengjing"];
    self.imageView.image = image;
}

@end
