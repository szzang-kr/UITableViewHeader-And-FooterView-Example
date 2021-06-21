//
//  ViewController.swift
//  HeaderAndFooterExample
//
//  Created by AhnSangHoon on 2021/03/19.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView()
    private let tableHeaderView = UIView()
    private let tableFooterView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp() {
        attribute()
        layout()
    }
    
    private func attribute() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = tableHeaderView
        tableView.tableFooterView = tableFooterView
        tableHeaderView.backgroundColor = .brown
        tableFooterView.backgroundColor = .purple
    }
    
    private func layout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        headerViewLayout()
        footerViewLayout()
    }
    
    private func headerViewLayout() {
        tableHeaderView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
    }
    
    private func footerViewLayout() {
        tableFooterView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 100)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}

/* Other */

class HuniHeaderView: UIView {
    let label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        attribute()
        layout()
        
        setText("""
                안녕하세요 ! dvHuni입니다.\n
                데일리 이슈 4번째 포스트!!\n
                UITableView의 HeaderView&FooterView\n
                삽입하기 입니다!
                """)
    }
    
    private func attribute() {
        label.numberOfLines = 0
        backgroundColor = .orange
    }
    
    private func layout() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func setText(_ text: String) {
        label.text = text
    }
}
