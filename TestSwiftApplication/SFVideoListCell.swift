//
//  SFVideoListCell.swift
//  TestSwiftApplication
//
//  Created by apple on 2021/6/10.
//

import UIKit
import SnapKit


class SFVideoListCell: UITableViewCell ,RegisterCellFromNib{
    @IBOutlet weak var indexLabel: UILabel!
    var currentIndex: NSInteger = 0 {
        didSet{
            indexLabel.text  =  String.init(currentIndex)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indexLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }

}
