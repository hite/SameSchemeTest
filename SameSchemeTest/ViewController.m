//
//  ViewController.m
//  SameSchemeTest
//
//  Created by liang on 2019/3/8.
//  Copyright © 2019 liang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *bid = [[NSBundle mainBundle] bundleIdentifier];
    UILabel *l = [UILabel new];
    l.text = bid;
    l.textColor = [UIColor redColor];
    [self.view addSubview:l];
    [l sizeToFit];
    
    l.center = self.view.center;
}


@end
