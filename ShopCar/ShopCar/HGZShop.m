//
//  HGZShop.m
//  ShopCar
//
//  Created by 韩桂铸 on 16/9/28.
//  Copyright © 2016年 韩桂铸. All rights reserved.
//

#import "HGZShop.h"

@implementation HGZShop

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self == [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}
+(instancetype)shopWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
