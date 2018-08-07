//
//  TripCell.h
//  SkylineTest
//
//  Created by 廖冠翰 on 2018/8/7.
//  Copyright © 2018年 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TripModel.h"

@interface TripCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView tripModel:(TripModel *)tripModel;

@end
