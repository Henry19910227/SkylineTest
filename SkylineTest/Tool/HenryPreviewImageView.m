//
//  HenryPreviewImageView.m
//  ATH
//
//  Created by 廖冠翰 on 2018/1/17.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "HenryPreviewImageView.h"
#import <AudioToolbox/AudioToolbox.h>

@interface HenryPreviewImageView()

@property (strong, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, assign) CGRect lastFrame;
@property (nonatomic,strong)UIImageView *previewImageView;

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@property (strong,nonatomic)void(^deleteAction)(void);

@end

@implementation HenryPreviewImageView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (void)previewViewDidDeleteImageWithCompletion:(void (^)(void))completion {
    
    if (completion) {
        self.deleteAction = completion;
    }
}

- (void)commonInit {
    
    [[NSBundle mainBundle] loadNibNamed:@"HenryPreviewImageView" owner:self options:nil];
    
    self.deleteButton.hidden = YES;
    self.contentView.frame = self.bounds;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.contentView.backgroundColor = [UIColor clearColor];
    self.contentView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePreviewView:)];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    [self.contentView addGestureRecognizer:tapGesture];
    [self.contentView addGestureRecognizer:longPressGesture];
    
    [self addSubview:self.contentView];
    
}

- (void)showPreviewView {
    
    if (self.sourceImageView.image.size.height <= 0 || self.sourceImageView.image.size.width <= 0) {
        
        return;
    }

    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.sourceImageView.image];
    imageView.frame = [self.sourceView convertRect:self.sourceImageView.frame toView:self.contentView];
    self.lastFrame = imageView.frame;
    self.previewImageView = imageView;
    [self.contentView insertSubview:imageView atIndex:0];
    //在放大前將底部原始圖片隱藏
    self.sourceImageView.alpha = 0;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.contentView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
        CGRect frame = imageView.frame;

        frame.size.width = self.contentView.frame.size.width;
        frame.size.height = self.contentView.frame.size.width * (imageView.image.size.height / imageView.image.size.width);
        frame.origin.x = 0;
        frame.origin.y = (self.contentView.frame.size.height - frame.size.height) * 0.5;
        imageView.frame = frame;
        
        
    } completion:nil];
}

- (void)hidePreviewView {
    [UIView animateWithDuration:0.25 animations:^{
        
        self.contentView.backgroundColor = [UIColor clearColor];
        self.previewImageView.alpha = 0;
        
    } completion:^(BOOL finished) {
         self.sourceImageView.alpha = 1.0;
        [self.previewImageView removeFromSuperview];
        self.previewImageView = nil;
        self.deleteButton.hidden = YES;
        [self removeFromSuperview];
        
    }];
}

#pragma mark - Event Handler
- (void)closePreviewView:(UITapGestureRecognizer *)recognizer {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        recognizer.view.backgroundColor = [UIColor clearColor];
        self.previewImageView.frame = self.lastFrame;
        
    } completion:^(BOOL finished) {
        
        //在關閉前將底部原始圖片顯示
        self.sourceImageView.alpha = 1.0;
        [self.previewImageView removeFromSuperview];
        self.previewImageView = nil;
        self.deleteButton.hidden = YES;
        [self removeFromSuperview];
    }];
}

- (void)longPressGesture:(UILongPressGestureRecognizer *)recognizer {
    
    if (self.deleteButton.hidden == YES && self.allowRemove) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        self.deleteButton.hidden = NO;
    }
}

- (IBAction)deleteButtonClick {
    
    [self hidePreviewView];
    
    if (self.deleteAction) {
        self.deleteAction();
    }
}

@end
