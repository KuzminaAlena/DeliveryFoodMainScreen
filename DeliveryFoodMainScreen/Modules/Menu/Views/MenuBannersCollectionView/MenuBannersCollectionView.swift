//
//  MenuBannersCollectionView.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

class MenuBannersCollectionView: UIView {
    
    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        view.contentInset = UIEdgeInsets(
            top: .zero,
            left: 8,
            bottom: .zero,
            right: .zero
        )
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints =  false
        view.dataSource = self
        view.register(
            MenuBannersCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuBannersCollectionViewCell.reuseId
        )
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 300, height: 112)
        return layout
    }()
    
    var bannersViewModels = MenuBannersViewModel(banners: [])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            
            heightAnchor.constraint(equalToConstant: 88)
        ])
    }
    
    func update(with viewModel: MenuBannersViewModel) {
        bannersViewModels = viewModel
    }
}

extension MenuBannersCollectionView: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        bannersViewModels.banners.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuBannersCollectionViewCell.reuseId,
            for: indexPath
        ) as! MenuBannersCollectionViewCell
        cell.setupCell(viewModel: bannersViewModels.banners[indexPath.row])
        return cell
    }
}
