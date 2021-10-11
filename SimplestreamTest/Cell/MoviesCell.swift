//
//  MoviesCell.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import UIKit
import SDWebImage

class MoviesCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var backgroundImageView: UIImageView = {
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        return $0
    }(UILabel())
    private lazy var subTitleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 14.0)
        return $0
    }(UILabel())
    private lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        return $0
    }(UILabel())
    
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
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitleLabel)

        backgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5.0).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5.0).isActive = true
        backgroundImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -5.0).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.backgroundImageView.rightAnchor, constant: 5.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5.0).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo:self.backgroundImageView.rightAnchor, constant: 5.0).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0).isActive = true
        
        descriptionLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5.0).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5.0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15.0).isActive = true
    }
}

//MARK: - Public methods
extension MoviesCell {
    
    func setData(with video: Video) {
        
        if let url = URL(string: video.thumbnail){
            backgroundImageView.sd_setImage(with: url, placeholderImage: nil)
        }
        titleLabel.text = video.title
        subTitleLabel.text = video.subtitle
        descriptionLabel.text = video.description
    }
}
