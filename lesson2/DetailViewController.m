//
//  DetailViewController.m
//  lesson2
//
//  Created by rimi on 15/6/2.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "DetailViewController.h"
//返回按钮
@interface DetailViewController ()
//@property (nonatomic,strong) NSString       *username;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self initializeUserInterface];
    [self initializationInterface];
    // Do any additional setup after loading the view.
    
}

- (void)initializationInterface
{
    self.view.backgroundColor = [UIColor colorWithRed:0.4 green:0.1 blue:0.9 alpha:0.9];
    
    NSLog(@"username = %@",self.username);
    
    #pragma mark - 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0, 300, 100, 30);
    backButton.center = self.view.center;
    backButton.backgroundColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(handleButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}

- (void)handleButtonEvent:(UIButton *)sender
{
    //返回以前的界面
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
