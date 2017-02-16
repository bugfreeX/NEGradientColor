//
//  GradientViewController.m
//  NEGradientColor
//
//  Created by Nslson on 2017/2/16.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "GradientViewController.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView * gradientView = [[UIView alloc]initWithFrame:self.view.bounds];
    gradientView.backgroundColor = [UIColor colorWithGradientType:self.type withFrame:gradientView.bounds andColors:self.colors];
    [self.view addSubview:gradientView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
