//
//  HGZShop.h
//  ShopCar
//
//  Created by 韩桂铸 on 16/9/28.
//  Copyright © 2016年 韩桂铸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGZShop : NSObject

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopWithDict:(NSDictionary *)dict;
@end
