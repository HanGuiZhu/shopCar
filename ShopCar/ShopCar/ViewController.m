//
//  ViewController.m
//  ShopCar
//
//  Created by 韩桂铸 on 16/9/28.
//  Copyright © 2016年 韩桂铸. All rights reserved.
//

#import "ViewController.h"
#import "HGZShop.h"
#import "HGZShopView.h"
@interface ViewController ()

/**购物车 */
@property (weak, nonatomic) IBOutlet UIView *shopView;

/**添加按钮 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

/**删除按钮 */
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
/**提示框 */
@property (weak, nonatomic) IBOutlet UILabel *labelHUB;

@property (nonatomic,strong) NSArray *dataArr;

//@property (nonatomic,assign) NSInteger index;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        // 加载数据
        // 1.获取全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"dataArr.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:path];
        // 创建一个临时数组
        NSMutableArray *tempArr = [NSMutableArray array];
        // 遍历获取数据
        for (NSDictionary *dict  in self.dataArr) {
            HGZShop *shop = [HGZShop shopWithDict:dict];
            [tempArr addObject:shop];
        }
        self.dataArr = tempArr;
    }
    return _dataArr;
}
- (IBAction)addButton:(UIButton *)sender {
    NSInteger width = 80;
    NSInteger height = 100;
    // 总例数
    NSInteger allCols = 3;
    // X方向间距
    CGFloat spacingX = (self.shopView.frame.size.width - (allCols * width))/(allCols - 1);
    // Y放向间距
    CGFloat spacingY = (self.shopView.frame.size.height - (2 * height))/ 1;
    // 子视图来代替索引
    NSInteger index = self.shopView.subviews.count;
    // 九宫格
    CGFloat shopX = (index % allCols) *(width + spacingX);
    CGFloat shopY = (index / allCols) * (height +spacingY);
    
    if (index == 5) {
        sender.enabled = NO;
        [self showHUBInfo:@"购物车已满，不要买买买～"];
    }
    self.removeBtn.enabled = YES;
    // 获取数据和自定义视图
    HGZShopView *shopImage = [HGZShopView shopViewWithShop:self.dataArr[index]];
    shopImage.frame = CGRectMake(shopX, shopY, width, height);
    [self.shopView addSubview:shopImage];
}
- (IBAction)removeButton:(UIButton *)sender {
    [self.shopView.subviews.lastObject removeFromSuperview];
    NSInteger index = self.shopView.subviews.count;
    if (index == 0) {
        self.removeBtn.enabled = NO;
        [self showHUBInfo:@"购物车已空，赶紧买买买～"];
    }
    self.addBtn.enabled = YES;
}
- (void)showHUBInfo:(NSString *)info{
    [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.labelHUB.text = info;
        self.labelHUB.alpha = 1.0f;
    } completion:^(BOOL finished) {
        self.labelHUB.alpha = 0.f;
    }];
}
@end
