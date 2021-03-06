//
//  IWComposeImageView.m
//  WeiBo17
//
//  Created by teacher on 15/8/26.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "IWComposeImageView.h"
#import "UIView+Extension.h"

@interface IWComposeImageView()

@property (nonatomic, weak) UIButton *deleteBtn;

@end

@implementation IWComposeImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //让删除按钮能点击
        self.userInteractionEnabled = YES;
        
        UIButton *deleteBtn = [[UIButton alloc] init];
        //设置图片
        [deleteBtn setImage:[UIImage imageNamed:@"compose_photo_close"] forState:UIControlStateNormal];
        //设置大小
        deleteBtn.size = [deleteBtn currentImage].size;
        
        [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:deleteBtn];
        self.deleteBtn = deleteBtn;
        
    }
    return self;
}

- (void)deleteBtnClick:(UIButton *)button{
//    if (self.bIWRemoveImageRemove) {
//        self.bIWRemoveImageRemove(self.tag);
//    }
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        //动画执行完毕,移除
        [self removeFromSuperview];
    }];

    if (self.RemoveImageRemove) {
        self.RemoveImageRemove(self.image);
    }else{//直接赋值 图片删除不走block 则用通知强制删除
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RemoveImageRemove" object:self.image];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.deleteBtn.x = self.width - self.deleteBtn.width;
}

@end
