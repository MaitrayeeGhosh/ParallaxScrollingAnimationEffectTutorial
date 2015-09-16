//
//  ViewController.m
//  ParallaxScrollingAnimationEffectTutorial
//
//  Created by Maitrayee Ghosh on 16/09/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mTableView.delegate=(id)self;
    self.mTableView.dataSource=(id)self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.mTableView setContentInset:UIEdgeInsetsMake(self.containerUIView.bounds.size.height, 0.f, 0.f, 0.f)];
    [self.mTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
   
     float headerImageYOffset = 88 + self.containerUIView.bounds.size.height - self.view.bounds.size.height;
    CGRect headerImageFrame = _containerUIView.frame;
    headerImageFrame.origin.y = headerImageYOffset;
}

#pragma  mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid=@"hello";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    cell.textLabel.text=@"Beautiful Parallax animation effect";
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma  mark - Parallax Scrolling Animation

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat scrollOffset = -scrollView.contentOffset.y;
    CGFloat yPos = scrollOffset -_containerUIView.bounds.size.height;
    _containerUIView.frame = CGRectMake(0, yPos, _containerUIView.frame.size.width, _containerUIView.frame.size.height);
    float alpha=1.0-(-yPos/ _containerUIView.frame.size.height);
    _mImageView.alpha=alpha;
    float fontSize=24-(-yPos/20);
    _mUILabel.font=[UIFont systemFontOfSize:fontSize];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
