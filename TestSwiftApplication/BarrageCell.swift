//
//  BarrageCell.swift
//  TestSwiftApplication
//
//  Created by Keep on 2022/4/5.
//

import UIKit

class BarrageCell: UITableViewCell {
    var nickStr: String?{
        didSet{
            self.nickName.text = nickStr
        }
    }
    
    
    private lazy var praiseImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nickName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    private lazy var innerContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 8.0
        return view
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.lightGray
        setupUI()
    }
    func setupUI() {
        self.contentView.addSubview(innerContentView)
        innerContentView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        innerContentView.addSubview(praiseImageView)
        praiseImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(24.0)
            make.centerY.equalToSuperview()
        }
        
        innerContentView.addSubview(nickName)
        nickName.snp.makeConstraints { (make) in
            make.left.equalTo(self.praiseImageView.snp.right).offset(16)
            make.right.equalToSuperview().offset(-5.0)
            make.height.equalTo(22)
            make.centerY.equalToSuperview()
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
