//
//  WrapOpenCV.m
//  WorkOpenCV2
//
//  Created by YamanaToshiyuki on 2014/12/21.
//  Copyright (c) 2014年 YamanaToshiyuki. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <opencv2/opencv.hpp>
#import <opencv2/highgui/ios.h>
#import <iostream>

#import "WorkOpenCV2-Bridging-Header.h"
#import "SevenSegOCR.h"

@implementation WrapOpenCV : NSObject

static void MyUIImageToMat(const UIImage* image, cv::Mat& m) {
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);//これはretainしない
    CGFloat cols = image.size.width, rows = image.size.height;
    m.create(rows, cols, CV_8UC4); // 8 bits per component, 4 channels
    NSLog(@"tom4, mc=%d", *(m.refcount));
    CGContextRef contextRef = CGBitmapContextCreate(m.data, m.cols, m.rows, 8, m.step[0], colorSpace, kCGImageAlphaNoneSkipLast | kCGBitmapByteOrderDefault);
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
}

+(UIImage *)DetectEdge:(UIImage *)image{
    cv::Mat mat;
    MyUIImageToMat(image, mat);
    NSLog(@"de2, mc=%d", *(mat.refcount));
    
    cv::Mat gray;
    cv::cvtColor(mat, gray, CV_RGB2GRAY);

    cv::Mat edge;
    cv::Canny(gray, edge, 200, 180);

    //std::cout << edge.col(0) << std::endl << std::endl;
    std::cout << MatToDbl(edge);

    UIImage* resv = MatToUIImage(gray);
    mat.release();
    return resv;
}

@end