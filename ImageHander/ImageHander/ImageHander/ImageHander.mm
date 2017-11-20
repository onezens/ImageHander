//
//  ImageHander.m
//  ImageHander
//
//  Created by wz on 2017/11/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import "ImageHander.h"
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/highgui.hpp>
#import <opencv2/core/types.hpp>

using namespace cv;

@implementation ImageHander

+ (UIImage *)opencvImage:(UIImage *)image level:(int)level {
    
    Mat mat_image_src;
    
    //image to mat
    UIImageToMat(image, mat_image_src);
    
    //get image width height
    int width = mat_image_src.cols;
    int height = mat_image_src.rows;
    
    //remove alpha
    Mat mat_image_dst;
    cvtColor(mat_image_src, mat_image_dst, CV_RGBA2RGB, 3);
    
    //backup
    Mat mat_image_bp = mat_image_dst.clone();
    
    //dynamic
    int x = width - level;
    int y = height - level;
    
    for (int i=0; i<x; i+=level) {
        for(int j=0; j<y; j+=level){
            //create Mosaic rect
            Rect2i mosaicRect = Rect2i(i, j, level, level);
            
            Mat ori = mat_image_dst(mosaicRect);
            
            Scalar scalar = Scalar(
                                   mat_image_bp.at<Vec3b>(j, i)[0],
                                   mat_image_bp.at<Vec3b>(j, i)[1],
                                   mat_image_bp.at<Vec3b>(j, i)[2]);
            
            Mat oriCopy = Mat(mosaicRect.size(), CV_8UC3, scalar);
            oriCopy.copyTo(ori);
        }
    }
    
    return MatToUIImage(mat_image_dst);
}

@end
