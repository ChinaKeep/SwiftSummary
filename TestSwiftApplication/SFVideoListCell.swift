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
    @IBOutlet weak var funcName: UILabel!

    var currentIndex: NSInteger = 0 {
        didSet{
            indexLabel.text  =  String.init(currentIndex)
        }
    }

    var funcNameString: String = "" {
        didSet{
            funcName.text = funcNameString
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        indexLabel.snp.makeConstraints {
//            $0.center.equalTo(self)
//        }
    }

}
