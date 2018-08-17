//
//  ViewController.m
//  UIDynamicAnimator
//
//  Created by Jn_Kindle on 2018/8/17.
//  Copyright © 2018年 JnKindle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 *  仿真器，也是仿真行为的执行者
 */
@property (nonatomic, strong) UIDynamicAnimator *animator;

/**
 *  重力行为
 */
@property (nonatomic, strong) UIGravityBehavior *gravity;

/**
 *  碰撞行为
 */
@property (nonatomic, strong) UICollisionBehavior *collision;

@end

@implementation ViewController

/**
 *  仿真器，也是仿真行为的执行者
 */
- (UIDynamicAnimator *)animator
{
    if (!_animator)
    {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    return _animator;
}

/**
 *  重力行为
 */
- (UIGravityBehavior *)gravity
{
    if (!_gravity)
    {
        _gravity = [[UIGravityBehavior alloc] init];
    }
    
    return _gravity;
}

/**
 *  碰撞行为
 */
- (UICollisionBehavior *)collision
{
    if (!_collision)
    {
        _collision = [[UICollisionBehavior alloc] init];
        //不会超过编辑
        _collision.translatesReferenceBoundsIntoBoundary = YES;
    }
    
    return _collision;
}

/**
 *  创建一个视图
 *
 *  @param frame           frame description
 *  @param backgroundColor backgroundColor description
 *
 *  @return return value description
 */
- (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor
{
    UIView *v = [[UIView alloc] initWithFrame:frame];
    v.backgroundColor = backgroundColor;
    [self.view addSubview:v];
    return v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(createItem) userInfo:nil repeats:YES];
    
}

- (void)createItem
{
    int width = 40;
    
    //视图
    UIView *view = [self createViewWithFrame:CGRectMake(arc4random_uniform(330), 0, width, width) backgroundColor:[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]];
    //view.layer.cornerRadius = width/2;
    
    //添加仿真元素
    [self.gravity addItem:view];
    [self.collision addItem:view];
    
    
    //执行重力行为
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.collision];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
