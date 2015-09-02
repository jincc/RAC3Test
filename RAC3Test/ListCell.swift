//
//  ListCell.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import UIKit
import ReactiveCocoa
class ListCell: UITableViewCell ,ReactiveView{

    @IBOutlet weak var listName: UILabel!
    
    @IBOutlet weak var photoCount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bindViewModel(viewModel: AnyObject){
        if let viewModel = viewModel as? ListCellViewModel {
            listName.rac_text <~ viewModel.listName
            photoCount.rac_text <~ viewModel.photoCount
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
