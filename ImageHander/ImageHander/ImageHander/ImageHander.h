//
//  ImageHander.h
//  ImageHander
//
//  Created by wz on 2017/11/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageHander : NSObject

+ (UIImage *)opencvImage:(UIImage *)image level:(int)level;

@end
