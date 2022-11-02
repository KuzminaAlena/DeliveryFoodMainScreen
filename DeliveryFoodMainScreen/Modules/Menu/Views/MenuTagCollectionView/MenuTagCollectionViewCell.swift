//
//  MenuTagCollectionViewCell.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

class MenuTagCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "MenuTagCollectionViewCell"
    
    private(set) lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .displayRegularSubtitle
        view.textColor = .redCustom
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        layer.cornerRadius = 15
        layer.borderColor = UIColor.redCustom.cgColor
        layer.borderWidth = 1
        contentView.backgroundColor = .clear
        
        contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 6
            )
        ])
    }
    
    func update(with viewModel: MenuTagViewModel){
        titleLabel.text = viewModel.title
    }
}
