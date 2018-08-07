//
//  HenryPreviewImageView.h
//  ATH
//
//  Created by 廖冠翰 on 2018/1/17.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HenryPreviewImageView : UIView

@property(nonatomic,strong)UIImageView *sourceImageView;

@property(nonatomic,strong)UIView *sourceView;

@property(nonatomic,assign)BOOL allowRemove;

- (void)showPreviewView;

- (void)previewViewDidDeleteImageWithCompletion:(void(^)(void))completion;


@end
