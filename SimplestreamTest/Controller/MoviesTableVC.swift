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
        static var cellIdentifier = "MoviesCell"
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
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? MoviesCell, indexPath.row < viewModel.numberOfItems else {
            return UITableViewCell()
        }

        cell.setData(with: viewModel.videos[indexPath.row])
        return cell
    }

    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row, viewController: self)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

//MARK: - Private methods
private extension MoviesTableVC {
    
    func fetchData() {
        
        viewModel.fetchData(completion: { _ in

            DispatchQueue.main.async {
                self.navigationItem.title = self.viewModel.contentTitle
                self.tableView.reloadData()
            }
        })
    }
    
    func configureTableView() {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.allowsSelection = true
    }
}
