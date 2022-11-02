//
//  MenuTagCollectionView.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import Foundation
import UIKit

class MenuTagCollectionView: UIView {
    
    private(set) lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: collectionViewLayout
        )
        view.contentInset = UIEdgeInsets(
            top: .zero,
            left: 16,
            bottom: .zero,
            right: .zero
        )
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints =  false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .background
        view.register(
            MenuTagCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuTagCollectionViewCell.reuseId
        )
        return view
    }()
    
    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: 88, height: 32)
        return layout
    }()
    
    var tagsViewModels = MenuTagsViewModel(tags: [])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        backgroundColor = .background
        addSubview(collectionView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -24
            ),
            collectionView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 24
            ),
            heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func update(with viewModel: MenuTagsViewModel) {
        tagsViewModels = viewModel
        collectionView.reloadData()
    }
}

extension MenuTagCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        tagsViewModels.tags.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuTagCollectionViewCell.reuseId,
            for: indexPath
        ) as! MenuTagCollectionViewCell
        cell.update(with: tagsViewModels.tags[indexPath.row])
        return cell
    }
}
