//
//  ListView.swift
//  RAC3Test
//
//  Created by 江钧龙 on 15/9/2.
//  Copyright (c) 2015年 江钧龙. All rights reserved.
//

import UIKit
import ReactiveCocoa
import SVPullToRefresh
import Spring
class ListView: UITableViewController {
    private let viewModel = ListViewModel()
    private var  tableViewBondHelper : TableViewBindingHelper<ListCellViewModel>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBondHelper = TableViewBindingHelper(tableView: tableView, sourceSignal: viewModel.lists.producer, nibName: "ListCell")
        tableView.tableFooterView = UIView()
        
//        //refresh
//        tableView.addInfiniteScrollingWithActionHandler {[unowned self] _ in
//            self.viewModel.refresh()
//        }
//        viewModel.isLoadding.producer.start(next:{
//           [unowned self] in
//            $0 ? self.tableView.triggerInfiniteScrolling()  : self.tableView.infiniteScrollingView.stopAnimating()
//        })

    }

}
