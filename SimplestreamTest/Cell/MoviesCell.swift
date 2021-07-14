//
//  MoviesCell.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    //MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        separatorInset = .zero
        accessoryType = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}
