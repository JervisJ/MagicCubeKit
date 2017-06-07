//
//  ProductInfomationTableViewCell.m
//  MagicCubeKit
//
//  Created by LuisX on 2017/6/1.
//  Copyright © 2017年 LuisX. All rights reserved.
//

#import "ProductInfomationTableViewCell.h"

@implementation ProductInfomationTableViewCell{
    UIImageView *_flagIcon;         //标识
    UILabel *_titleLabel;           //标题
    UILabel *_priceLabel;           //价格
    UILabel *_originalPriceLabel;   //原价
    UILabel *_commissionLabel;      //佣金
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createSubViews];
        [self settingAutoLayout];
    }
    return self;
}

- (void)createSubViews{
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.font = [UIFont systemFontOfSize:15];
//    _titleLabel.backgroundColor = [UIColor greenColor];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    
    _flagIcon = [UIImageView new];
    [_flagIcon setImage:[UIImage imageNamed:@"1.jpg"]];
//    _flagIcon.backgroundColor = [UIColor redColor];
    _flagIcon.clipsToBounds = YES;
    _flagIcon.contentMode = 1;
    [self.contentView addSubview:_flagIcon];
    
    _priceLabel = [UILabel new];
//    _priceLabel.backgroundColor = [UIColor orangeColor];
    _priceLabel.font = [UIFont systemFontOfSize:20];
    _priceLabel.textColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.55 alpha:1.00];
    _priceLabel.numberOfLines = 0;
    [self.contentView addSubview:_priceLabel];

    _commissionLabel = [UILabel new];
//    _commissionLabel.backgroundColor = [UIColor orangeColor];
    _commissionLabel.textColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.55 alpha:1.00];
    _commissionLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:_commissionLabel];
    
    _originalPriceLabel = [UILabel new];
//    _originalPriceLabel.backgroundColor = [UIColor blueColor];
    _originalPriceLabel.textColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00];
    _originalPriceLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_originalPriceLabel];
    
    //删除线
    UIView *deleteLine = [UIView new];
    deleteLine.backgroundColor = [UIColor colorWithRed:0.60 green:0.60 blue:0.60 alpha:1.00];
    [_originalPriceLabel addSubview:deleteLine];
    [deleteLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_originalPriceLabel);
        make.left.equalTo(_originalPriceLabel).offset(-2);
        make.right.equalTo(_originalPriceLabel).offset(2);
        make.height.mas_equalTo(1);
    }];
    
}

- (void)settingAutoLayout{
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(Magic_screen_Width - 20);
    }];
    
    [_flagIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(_titleLabel);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [_commissionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel.mas_right).offset(10);
        make.centerY.equalTo(_priceLabel);
    }];
    
    [_originalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel);
        make.top.equalTo(_priceLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}


#pragma mark -更新数据
- (void)setModel:(ProductDetailModel *)model{
    
    if (_model != model) {
        _model = model;
    }
    
    NSString *temp = [NSString string];
    for (NSInteger i = 0; i < 5; i++) {
        temp = [temp stringByAppendingString:@" "];
    }
    _titleLabel.text = [NSString stringWithFormat:@"%@ %@ %@", temp, _model.item.brandName, _model.item.productTitle];
    _priceLabel.text = [NSString stringWithFormat:@"¥%.2f", _model.item.price];
    _commissionLabel.text = [NSString stringWithFormat:@"赚:¥%.2f", _model.commission];
    _originalPriceLabel.text = [NSString stringWithFormat:@"¥%.2f", _model.item.originalPrice];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
