//
//  MenuBannersCollectionViewCell.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

class MenuBannersCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "MenuBannersCollectionViewCell"
    
    private lazy var bannerView: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var bannerImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
        layer.backgroundColor = UIColor.red.cgColor
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
        layer.masksToBounds = false    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.layer.backgroundColor = UIColor.background.cgColor
        contentView.addSubview(bannerImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupCell(viewModel: Banners){
        bannerImageView.image = viewModel.image
    }
}
