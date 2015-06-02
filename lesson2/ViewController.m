//
//  ViewController.m
//  lesson2
//
//  Created by rimi on 15/6/2.
//  Copyright (c) 2015年 rectinajh. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"


//私有类，延展方法
@interface ViewController() <UITextFieldDelegate>

@property (nonatomic,strong)UITextField     *usernameTextField;
@property (nonatomic,strong)UITextField     *passwordTextField;

//初始化界面
- (void)initializeUserInterface;

//Button点击事件
- (void)handButtonEvent:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    //调用一次父类的viewDidLoad方法
    [super viewDidLoad];//创建父类的对象
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeUserInterface];
    
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeUserInterface
{
#pragma mark //创建头像
    // 创建头像
    UIImageView *headImageView = [[UIImageView alloc]init];
    // 设置大小
    headImageView.bounds = CGRectMake(0, 0, 110, 100);
    // 设置中心点,1，获取父视图的x中心点
    CGFloat centerx = CGRectGetMidX(self.view.bounds);
    // 2，设置Y的中心点
    CGFloat centerY = 150;
    headImageView.center = CGPointMake(centerx, centerY);
    // 设置图片
    UIImage *image = [UIImage imageNamed:@"9.jpg"];//png不用加后缀名
    // 关联图片
    headImageView.image = image;
    // 添加到父视图
    [self.view addSubview:headImageView];
    // 设置圆形（当前大小一半）
    headImageView.layer.cornerRadius = 50;
    // 进行裁剪
    headImageView.clipsToBounds = YES;
    
    // UIImageView特效
    // 设置缩放方式
    headImageView.contentMode = UIViewContentModeScaleToFill;
    // 栅格化数据试讲矢量图变为位图，如果层中的内容是变动的，每次都需要栅格化，就会影响效率。一般设置为NO
    [headImageView.layer setShouldRasterize:YES];
    // 设置边框颜色
    [headImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    // 设置边框宽度
    [headImageView.layer setBorderWidth:2.0];
    // 设置投影偏移量，CGSizeMake
    [[headImageView layer] setShadowOffset:CGSizeMake(1, 1)];
    // 设置投影颜色
    [[headImageView layer] setShadowColor:[UIColor redColor].CGColor];
    // 设置投影半径
    [[headImageView layer] setShadowRadius:3];
    // 设置透明度
    [[headImageView layer] setShadowOpacity:0.9];
    // 圆角外的区域将被遮盖。与cornerradius使用，
    [headImageView.layer setMasksToBounds:YES];
    headImageView.layer.cornerRadius = 10;
    
    
#pragma mark - 创建textfield文本框
    
    // 用户名文本框
    self.usernameTextField = [[UITextField alloc]init];
    // 获取父视图大小
    CGFloat width = CGRectGetWidth(self.view.bounds);
    // 设置frame
    self.usernameTextField.frame = CGRectMake(0, 220, width, 40);
    // 添加父视图
    [self.view addSubview:self.usernameTextField];
    // 添加边框
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    // 设置提示语言
    self.usernameTextField.placeholder = @"用户名";
    // 获取字体家族
    NSLog(@"%@",[UIFont familyNames]);
    // 字体
    self.usernameTextField.font =[UIFont fontWithName:@"Heiti SC" size:20];
    // 居中,设置对齐方式
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    // 设置自动大小方式
    self.usernameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 设置进行纠正
    self.usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    // 委托
    self.usernameTextField.delegate = self;
    
    // 配置清空按钮
    self.usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 获取字体家族
    NSLog(@"%@",[UIFont familyNames]);
    // 配置字体
    self.usernameTextField.font = [UIFont systemFontOfSize:20];
    
#pragma mark - 创建密码文本框
    
    self.passwordTextField = [[UITextField alloc]init];
    // 获取父视图大小
    // CGFloat width =CGRectGetWidth(self.view.bounds);
    // 设置frame
    self.passwordTextField.frame = CGRectMake(0, 265, width, 40);
    // 添加父视图
    [self.view addSubview:self.passwordTextField];
    // 设置安全输入
    self.passwordTextField.secureTextEntry = YES;
    // 添加边框
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    // 设置提示语言
    self.passwordTextField.placeholder = @"密码";
    // 居中,设置对齐方式
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
    // 设置自动大小方式
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    // 设置进行纠正
    self.passwordTextField.autocorrectionType = UITextAutocorrectionTypeYes;
    
#pragma mark  - 视图层级
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 450, 100, 100)];
    view1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(200, 500, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];

    // 交换视图层级，进入UIview.h收索收索addsubview，就可以看到所有方法
    // 获取父视图
    NSLog(@"view1.supview =%@",view1.superview);
    // 获取子视图
    NSLog(@"%@",self.view.superview);
    
#pragma mark - 创建button登录按钮
    // 创建button（类型为自定义类型）
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 设置背景颜色
    button.backgroundColor = [UIColor grayColor];
    // 设置标题
    [button setTitle:@"登录" forState:UIControlStateNormal];
    // 设置标题颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 添加事件
    // 参数1，当前目标执行者
    // 参数2，当前执行者响应的方法名
    // 参数3，当前相应事件的方式
    [button addTarget:self action:@selector(handButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    // 设置大小
    button.bounds = CGRectMake(0, 300, 170, 30);
    // 设置中心点
    button.center = CGPointMake(width / 2, 400);
    // 添加父视图
    [self.view addSubview:button];
    // 设置button的圆角
    button.layer.cornerRadius = 10;
    //
    
}

#pragma mark - buttonEvent,点击跳转
- (void)handButtonEvent:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    //传值属性
    detailVC.username = self.usernameTextField.text;
    //视图跳转
    [self presentViewController:detailVC animated:YES completion:^{
        NSLog(@"已经跳转完毕!");
    }];
}
#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);//__func__当前的对象

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s",__func__);
}

#pragma mark - UITextFiledDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //失去焦点
    [textField resignFirstResponder];
    return YES;

}

#pragma mark - 限定密码长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    NSLog(@"range = %@,string = %@",NSStringFromRange(range),string);
    if (textField.text.length + string.length > 10 ) {
        return NO;
    }
    return YES;
}

#pragma mark - touch优先处理
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}





@end
