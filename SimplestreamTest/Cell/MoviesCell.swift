//
//  MoviesCell.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import UIKit

class MoviesCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var backgroundImageView: UIImageView = {
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    //MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        separatorInset = .zero
        accessoryType = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if superview != nil {
            setupUI()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

//MARK: - Private methods
private extension MoviesCell {
    
    func setupUI() {
        self.contentView.addSubview(backgroundImageView)
        backgroundImageView.frame = self.contentView.bounds

        backgroundImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
}

//MARK: - Public methods
extension MoviesCell {
    
    func setData(with video: Video) {
        
        if let url = URL(string: video.thumbnail),
           let data = try? Data(contentsOf: url) {
            backgroundImageView.image = UIImage(data: data)
        }
    }
}
