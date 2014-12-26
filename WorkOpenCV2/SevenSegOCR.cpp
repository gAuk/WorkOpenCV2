//
//  SevenSegOCR.cpp
//  WorkOpenCV2
//
//  Created by YamanaToshiyuki on 2014/12/23.
//  Copyright (c) 2014年 YamanaToshiyuki. All rights reserved.
//

#include "SevenSegOCR.h"
//#include <opencv2/core/core.hpp>
#include <iostream>
#include <vector>
#include <memory>

// boarder between dark and light
const double THRESHOLD = 50.0;
enum Em_darkLight {
    DARK = 0,
    LIGHT = 1,
    UNKNOWN = 2,
};

// states
enum Em_find {
    FIND_DARK,
    FIND_LIGHT,
};

// colors used by ssocr
enum Em_ssocr {
    SSOCR_BLACK = 0,
    SSOCR_WHITE = 255,
};

static inline Em_find findDarkOrLight(Em_ssocr s) {
    return (s == SSOCR_BLACK) ? FIND_DARK : FIND_LIGHT;
}

class Digit {
    int x1,y1,x2,y2,digit;
public:
    //
};

typedef std::unique_ptr<std::vector<Digit> > DigitVecPtr;

/*static*/ double MatToDbl(const cv::Mat& m) {
    //ssocr.c 45
    const Em_ssocr ocr = SSOCR_BLACK;
    // 414 get image parameters
    const int w = m.rows;
    const int h = m.cols;
    // 702 crop image
    // 790 allocate memory for seven segment digits
    DigitVecPtr digits(new std::vector<Digit>(8));
    // 803 horizontal partition
    int d = 0;
    const Em_find state = findDarkOrLight(ocr);
    for(int i=0; i<w; i++) {
        Em_darkLight col = UNKNOWN;
        int found_pixels = 0;
    }

    return -1.0;
}
