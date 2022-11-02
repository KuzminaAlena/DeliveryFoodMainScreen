//
//  MenuMainInfoTableViewCell.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit
import Kingfisher

class MenuMainInfoTableViewCell: UITableViewCell {
    
    static let reuseId = "MenuTableViewCell"
    
    private(set) lazy var iconImageView: UIImageView = {
        let view = UIImageView(image: .foodDefault)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .displaySemiboldTitle
        view.textColor = .blackTitle
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = .displayRegularSubtitle
        view.textColor = .graySubtitle
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var priceView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.redCustom.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 6
        view.backgroundColor = .whiteCustom
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private(set) lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .displayRegularSubtitle
        view.textColor = .redCustom
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(priceView)
        priceView.addSubview(priceLabel)
        
        self.selectionStyle = .none
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 16
            ),
            iconImageView.heightAnchor.constraint(equalToConstant: 132),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            
            titleLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 32
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -24
            ),
            titleLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 16
            ),
            titleLabel.heightAnchor.constraint(
                equalToConstant: 20
            ),
            
            subtitleLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 32
            ),
            subtitleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -24
            ),
            subtitleLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 8
            ),
            subtitleLabel.bottomAnchor.constraint(
                equalTo: priceView.topAnchor,
                constant: -16
            ),
            
            priceView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -24
            ),
            priceView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -24
            ),
            priceView.heightAnchor.constraint(equalToConstant: 32),
            priceView.widthAnchor.constraint(equalToConstant: 87),
            
            priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: priceView.centerXAnchor),
            priceLabel.topAnchor.constraint(
                equalTo: priceView.topAnchor,
                constant: 8
            )
        ])
    }
    
    public func update(viewModel: MenuFoodCellViewModel) {
        iconImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        priceLabel.text = "от \(viewModel.price) р"
    }
}
