//
//  ViewController.m
//  ChildViewControllerDemo
//
//  Created by ShawnXing on 2017/7/13.
//  Copyright © 2017年 Shangzx. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController ()

{
    UIViewController *currentVC;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ViewController1 *vc1 = [[ViewController1 alloc]init];
    [self addChildViewController:vc1];
    [vc1 didMoveToParentViewController:self];
    [vc1.view setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80)];
    currentVC = vc1;
    [self.view addSubview:vc1.view];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//理财
- (IBAction)click1:(UIButton *)sender {
    ViewController1 *vc1 = [[ViewController1 alloc] init];
    [vc1.view setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80)];
    [self changeControllerFromOldController:currentVC toNewController:vc1];
    
}
//金融
- (IBAction)click2:(UIButton *)sender {
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [vc2.view setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80)];
    [self changeControllerFromOldController:currentVC toNewController:vc2];
}
//基金
- (IBAction)click3:(UIButton *)sender {
    ViewController3 *vc3 = [[ViewController3 alloc] init];
    [vc3.view setFrame:CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80)];
    [self changeControllerFromOldController:currentVC toNewController:vc3];
}

#pragma mark - 切换viewController
- (void)changeControllerFromOldController:(UIViewController *)oldController toNewController:(UIViewController *)newController
{
    [self addChildViewController:newController];
    /**
     *  切换ViewController
     */
    newController.view.alpha = 0;
    [self transitionFromViewController:oldController toViewController:newController duration:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        //做一些动画
        newController.view.alpha = 1.0;
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            //移除oldController，但在removeFromParentViewController：方法前不会调用willMoveToParentViewController:nil 方法，所以需要显示调用
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            currentVC = newController;
            
        }else
        {
            currentVC = oldController;
        }
        
    }];
}




@end
