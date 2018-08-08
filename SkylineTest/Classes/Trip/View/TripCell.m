//
//  TripCell.m
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import "TripCell.h"
#import "TripImageItemCell.h"
#import "NSString+Henry.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TripCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//UI
@property (weak, nonatomic) IBOutlet UILabel *tripTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *tripDescLabel;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


//Data
@property (strong, nonatomic)NSMutableArray<NSString *> *imageUrls;
@property (strong, nonatomic)TripModel *tripModel;

@end

@implementation TripCell

+ (instancetype)cellWithTableView:(UITableView *)tableView tripModel:(TripModel *)tripModel {
    
    TripCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripCell"];
    cell.tripTitleLabel.text = tripModel.stitle;
    cell.tripDescLabel.attributedText = [tripModel.xbody lineSpace:5.0 color:[UIColor grayColor] alignment:NSTextAlignmentLeft];
    cell.tripModel = tripModel;
    cell.collectionView.contentOffset = CGPointMake(0, 0);
   
    [cell.collectionView reloadData];
    
    return cell;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.tripModel.urls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TripImageItemCell *cell = [TripImageItemCell cellWithCollectionView:collectionView indexPath:indexPath];
    
    NSString *url = self.tripModel.urls[indexPath.row];
    
    [cell.tripImageView sd_setImageWithURL:[NSURL URLWithString:url]
                     placeholderImage:[UIImage imageNamed:@"placeholder"] options:SDWebImageAllowInvalidSSLCertificates];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(200, 150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(0, 15, 0, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 0;
}

@end
