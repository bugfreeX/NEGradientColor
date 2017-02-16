//
//  ViewController.m
//  NEGradientColor
//
//  Created by Nslson on 2017/2/15.
//  Copyright © 2017年 Nelson. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Gradient.h"
#import "GradientViewController.h"
@interface ViewController (){
    NSArray * titles;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"NEGradientColor";
    // Do any additional setup after loading the view, typically from a nib.
    titles = @[@"UIGradientLeftToRight",@"UIGradientRadial",@"UIGradientTopToBottom"];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titles.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GradientViewController * gradientVC = [[GradientViewController alloc]init];
    switch (indexPath.row) {
        case 0:{
            gradientVC.type = UIGradientLeftToRight;
            gradientVC.colors = @[[UIColor orangeColor],[UIColor cyanColor]];
        }
            break;
        case 1:{
            gradientVC.type = UIGradientRadial;
            gradientVC.colors = @[[UIColor redColor],[UIColor purpleColor]];
        }
            break;
        case 2:{
            gradientVC.type = UIGradientTopToBottom;
            gradientVC.colors = @[[UIColor blueColor],[UIColor yellowColor]];
        }
            break;
    }
    [self.navigationController pushViewController:gradientVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
