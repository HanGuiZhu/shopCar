//
//  HGZShopView.h
//  ShopCar
//
//  Created by 韩桂铸 on 16/9/28.
//  Copyright © 2016年 韩桂铸. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HGZShop;

@interface HGZShopView : UIView

@property (nonatomic,strong) HGZShop *shop;

- (instancetype)initWithShop:(HGZShop *)shop;

+ (instancetype)shopViewWithShop:(HGZShop *)shop;

@end
