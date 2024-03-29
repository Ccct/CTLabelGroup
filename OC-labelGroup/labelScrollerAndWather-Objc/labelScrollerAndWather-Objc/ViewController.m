//
//  ViewController.m
//  labelScrollerAndWather-Objc
//
//  Created by kms on 2018/8/7.
//  Copyright © 2018年 KMS. All rights reserved.
//

#import "ViewController.h"
#import "CBGroupAndStreamView.h"
@interface ViewController ()<CBGroupAndStreamDelegate>

@property (strong, nonatomic) CBGroupAndStreamView * menueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"GroupAndStream";

    UIButton * leftBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBut setTitle:@"重置" forState:UIControlStateNormal];
    [leftBut setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [leftBut setFrame:CGRectMake(0, 0, 40, 40)];
    leftBut.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBut];
    [leftBut addTarget:self action:@selector(resetSelt) forControlEvents:UIControlEventTouchUpInside];

    UIButton * rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBut setTitle:@"确定" forState:UIControlStateNormal];
    [rightBut setFrame:CGRectMake(0, 0, 40, 40)];
    [rightBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightBut.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBut];
    [rightBut addTarget:self action:@selector(confirmSelt) forControlEvents:UIControlEventTouchUpInside];


    NSArray * titleArr = @[@"关系",@"花",@"节日",@"枝数"];
    NSArray *contentArr = @[
          @[@"恋人",@"朋友朋友朋友朋友朋友朋友",@"亲人恩师恩师",@"恩师恩师",@"病人",@"其他",@"恋人"],
          @[@"玫",@"百合",@"康乃馨",@"郁金香",@"扶郎",@"马蹄莲"],
          @[@"情人节",@"母亲节",@"圣诞节",@"元旦节",@"春节",@"恋人",@"朋友朋友朋友朋友朋友朋友"],
          @[@"9枝",@"100000000枝",@"11枝",@"21枝",@"33枝",@"99枝",@"99999999枝以上"]
      ];

    CBGroupAndStreamView * silde = [[CBGroupAndStreamView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    silde.delegate = self;
    silde.isDefaultSel = YES;
    silde.isSingle = YES;
    silde.radius = 10;
    silde.font = [UIFont systemFontOfSize:12];
    silde.titleTextFont = [UIFont systemFontOfSize:18];
    silde.singleFlagArr = @[@1,@0,@1,@0];
    silde.defaultSelectIndex = 5;
    silde.defaultSelectIndexArr = @[@0,@[@1,@3],@0,@[@1,@9,@4]];
    silde.selColor = [UIColor orangeColor];
    [silde setContentView:contentArr titleArr:titleArr];
    [self.view addSubview:silde];
    _menueView = silde;
    //可以通过block传出来
//    silde.cb_confirmReturnValueBlock = ^(NSArray *valueArr, NSArray *groupIdArr) {
//         NSLog(@"组ID数组：%@，值数组：%@",groupIdArr,valueArr);
//    };
//    silde.cb_selectCurrentValueBlock = ^(NSString *value, NSInteger index, NSInteger groupId) {
//        NSLog(@"第 %ld 组，第 %ld 个，值：%@",groupId,index,value);
//    };
}

- (void)resetSelt{
    //重置
    [_menueView reset];
}

- (void)confirmSelt{
    //确定
    [_menueView confirm];
}

#pragma mark---delegate 可以通过代理传出来
- (void)cb_confirmReturnValue:(NSArray *)valueArr groupId:(NSArray *)groupIdArr{
     NSLog(@"组ID数组：%@，值数组：%@",groupIdArr,valueArr);
}

- (void)cb_selectCurrentValueWith:(NSString *)value index:(NSInteger)index groupId:(NSInteger)groupId{
    NSLog(@"第 %ld 组，第 %ld 个，值：%@",groupId,index,value);
}

@end
