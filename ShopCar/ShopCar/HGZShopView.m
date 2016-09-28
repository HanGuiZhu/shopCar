//
//  HGZShopView.m
//  ShopCar
//
//  Created by 韩桂铸 on 16/9/28.
//  Copyright © 2016年 韩桂铸. All rights reserved.
//

#import "HGZShopView.h"
#import "HGZShop.h"
@interface HGZShopView ()

@property (nonatomic,strong) UIImageView *shopImage;

@property (nonatomic,strong) UILabel *shopLabel;

@end

@implementation HGZShopView

-(instancetype)init{
    if (self == [super init]) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithShop:(HGZShop *)shop{
    if (self == [super init]) {
        // 先创建再赋值，
        [self setUp];
        // 只有调用get和set方法才会调用下面的重写方法
        self.shop = shop;
    }
    return self;
}
+(instancetype)shopViewWithShop:(HGZShop *)shop{
    return [[self alloc] initWithShop:shop];
}
- (void)setUp{
    UIImageView *shopImage = [[UIImageView alloc] init];
    shopImage.backgroundColor = [UIColor yellowColor];
    [self addSubview:shopImage];
    self.shopImage = shopImage;
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor purpleColor];
    [self addSubview:label];
    self.shopLabel = label;
}
- (void)layoutSubviews{
    // 一定要调用父类方法
    [super layoutSubviews];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.shopImage.frame = CGRectMake(0, 0, width, width);
    self.shopLabel.frame = CGRectMake(0, width, width, height - width);
}
-(void)setShop:(HGZShop *)shop{
    _shop = shop;
    _shopImage.image = [UIImage imageNamed:shop.icon];
    _shopLabel.text = shop.name;
}
@end

