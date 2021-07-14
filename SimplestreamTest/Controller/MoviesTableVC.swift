//
//  MoviesTableVC.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import Foundation
import UIKit

class MoviesTableVC: UITableViewController {
    
    struct Constants {
        static var cellId = "MoviesCell"
    }
    
    var viewModel: MoviesViewModelProtocol

    // MARK: Initialiser
    init(with viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    fileprivate func configureTableView() {
        navigationItem.title = "My Movies"

        tableView.register(MoviesCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        tableView.estimatedRowHeight = 50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
