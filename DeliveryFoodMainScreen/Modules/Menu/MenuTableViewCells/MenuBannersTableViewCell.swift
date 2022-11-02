//
//  MenuBannersTableViewCell.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 15.10.2022.
//

import Foundation
import UIKit

class MenuBannersTableViewCell: UITableViewCell {
    
    static let reuseId = "MenuBannersTableViewCell"

    private(set) lazy var banners = MenuBannersCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.backgroundColor = .background
        contentView.addSubview(banners)
        
        banners.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            banners.topAnchor.constraint(equalTo: contentView.topAnchor),
            banners.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            banners.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            banners.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    func update(with viewModel: MenuBannersViewModel) {
        banners.update(with: viewModel)
    }
}
