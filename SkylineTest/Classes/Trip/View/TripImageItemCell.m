//
//  TripImageItemCell.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripImageItemCell.h"
#import "HenryPreviewImageView.h"

@interface TripImageItemCell()

@property(nonatomic,strong)HenryPreviewImageView *previewImageView;

@end

@implementation TripImageItemCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    
    TripImageItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TripImageItemCell" forIndexPath:indexPath];
    
    [cell commonInit];
    return cell;
    
}

- (void)commonInit {
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    
    self.tripImageView.userInteractionEnabled = YES;
    
    [self.tripImageView addGestureRecognizer:tapGesture];
}

#pragma mark - Setter
- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.tripImageView.image = image;
}

#pragma mark - Getter
- (HenryPreviewImageView *)previewImageView {
    
    if (!_previewImageView) {
        _previewImageView = [[HenryPreviewImageView alloc] init];
        _previewImageView.frame = [UIScreen mainScreen].bounds;
    }
    return _previewImageView;
}

#pragma mark - Event Handler
- (void)tapImageView:(UITapGestureRecognizer *)recognizer {
    
    self.previewImageView.sourceView = self;
    self.previewImageView.sourceImageView = self.tripImageView;
    
    [self.previewImageView showPreviewView];
}

@end
