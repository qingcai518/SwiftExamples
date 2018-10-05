//
//  ViewController.swift
//  SwiftExamples
//
//  Created by liqc on 2018/10/05.
//  Copyright © 2018年 liqc. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    let viewModel = MainViewModel()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSubviews()
        getData()
    }
    
    private func setSubviews() {
        self.title = "Swift Examples"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ExampleCell.self, forCellReuseIdentifier: ExampleCell.id)
        
        view.addSubview(tableView)
        
        // set constraints.
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func getData() {
        viewModel.setNames()
        tableView.reloadData()
    }
}

extension MainController: UITableViewDelegate {
    
}

extension MainController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExampleCell.id, for: indexPath) as! ExampleCell
        let data = viewModel.examples[indexPath.item]
        cell.configure(with: data)
        return cell
    }
}
