//
//  WangCustomTableViewCell.swift
//  WangSwift
//
//  Created by swift on 2017/9/28.
//  Copyright © 2017年 王家伟. All rights reserved.
//

import UIKit
import Kingfisher

class WangCustomTableViewCell: UITableViewCell {
    
    var wangImageView: UIImageView!
    var wangLabel: UILabel!
    private var wangPrivateLabel: UILabel! = {
        () -> UILabel in
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 5)
        label.textAlignment = .right
        label.text = "版权:王家伟"
        return label
    }()
    
    func wangReload(imageUrl: String, title: String) {
        //使用kingfisher +
        self.wangImageView.kf.setImage(with: URL(string: imageUrl))
        self.wangLabel.text = title
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        self.wangImageView = UIImageView()
        self.wangImageView.backgroundColor = .green
        self.contentView.addSubview(self.wangImageView)
        self.wangImageView.snp.makeConstraints({ (make) in
            make.left.equalTo(self.contentView.snp.left).offset(10)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 20, height: 20))
        })
        
        self.wangLabel = UILabel()
        self.wangLabel.textColor = .black
        self.wangLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(self.wangLabel)
        self.wangLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.wangImageView.snp.right).offset(15)
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.right.equalTo(self.contentView.snp.right).offset(-15)
        })
        
        self.contentView.addSubview(self.wangPrivateLabel)
        self.wangPrivateLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.right.equalTo(self.contentView.snp.right)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
