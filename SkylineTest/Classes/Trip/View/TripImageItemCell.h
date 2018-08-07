//
//  TripImageItemCell.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripImageItemCell : UICollectionViewCell

@property(nonatomic,copy)NSString *imageUrl;

@property(nonatomic,strong)UIImage *image;

@property (weak, nonatomic) IBOutlet UIImageView *tripImageView;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
