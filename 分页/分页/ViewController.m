//
//  ViewController.m
//  分页
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 从希望看到的效果的角度来考虑，UIScrollView控件和UIPageControl控件最好是一个整体，所以在storyboard中把这两个控件都放到了一个view上面。
 */
#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int count = 10;
    CGFloat w = self.scrollView.frame.size.width;
    CGFloat h = self.scrollView.frame.size.height;
    
    for (int i = 0; i < count; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        NSString *name = [NSString stringWithFormat:@"%d", i];
        imageView.image = [UIImage imageNamed:name];
        
        imageView.frame = CGRectMake(i * w, 0, w, h);
        [self.scrollView addSubview:imageView];
    }
    
    //设置UIScrollView控件内容层的大小
    CGFloat contentW = count * w;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
    
    //设置UIScrollView控件的相关属性
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;  //开启分页功能
    
    //设置UIPageControl控件的总页数
    self.pageControl.numberOfPages = count;
}

#pragma mark ————— UIScrollViewDelegate —————
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //四舍五入
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end;
