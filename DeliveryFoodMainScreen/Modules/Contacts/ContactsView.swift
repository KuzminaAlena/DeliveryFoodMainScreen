//
//  ContactsView.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import UIKit

final class ContactsView: UIView {
    
    private(set) lazy var iconImageView: UIImageView = {
        let view = UIImageView(image: .repairWork)
        view.contentMode = .scaleAspectFit
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
    
    func setup(){
        backgroundColor = .whiteCustom
        addSubview(iconImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 150),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }
}
