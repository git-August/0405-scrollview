//
//  ViewController.m
//  0405-scrollview
//
//  Created by Ibokan on 15/4/5.
//  Copyright (c) 2015年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>{
    UIImageView * _imgview;
    UIImageView * _imgview2;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIScrollView * scrollview = [[UIScrollView alloc] init];
    [self.view addSubview:scrollview];
    
    

    _imgview2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bing2.jpg" ]];
    
        UIImage * img = [UIImage imageNamed:@"Bing.jpg"];
    _imgview = [[UIImageView alloc] initWithImage:img];
    //画布与画一般大
    CGSize scrollsize = _imgview.frame.size;
//    CGFloat imgW = scrollsize.width;
//    CGFloat imgH = scrollsize.height;
//    imgview.frame = CGRectMake(0, 0, imgW, imgH);
    //放大镜的子控件
    [scrollview addSubview:_imgview];
    [scrollview addSubview:_imgview2];//画布放在上面
    //放大镜就屏幕那么大
    scrollview.frame = self.view.bounds;
//    NSLog(@"%lf,%lf",self.view.bounds.size.height,self.view.bounds.size.width);
//        NSLog(@"%lf,%lf",self.view.frame.size.height,self.view.frame.size.width);
    scrollview.contentSize = scrollsize;
    //UIEdgeinsets类型,就对此类型make
    scrollview.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    scrollview.bounces = NO;
//    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.contentOffset = CGPointMake(0, 0);
    
    scrollview.delegate = self;
    scrollview.maximumZoomScale = 3.0;
    scrollview.minimumZoomScale = 0.3;
    

}
//only zoom for subview in scrollview
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgview2;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
     
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
