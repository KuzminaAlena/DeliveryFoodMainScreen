//
//  MenuRoundedViewTableViewCell.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

class MenuRoundedViewTableViewCell: UITableViewCell {
    
    static let reuseId = "MenuViewTableViewCell"

    private(set) lazy var roundedView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .whiteCustom
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
        contentView.backgroundColor = .background
        contentView.addSubview(roundedView)
        
        setupConstraints()
        
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            roundedView.heightAnchor.constraint(equalToConstant: 20),
            roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
