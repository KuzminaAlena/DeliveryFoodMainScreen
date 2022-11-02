//
//  MenuView.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//

import UIKit

final class MenuView: UIView {
    
    var menuViewModel: MenuViewModel?
    let tagsView = MenuTagCollectionView()
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(
            MenuRoundedViewTableViewCell.self,
            forCellReuseIdentifier: MenuRoundedViewTableViewCell.reuseId
        )
        view.register(
            MenuMainInfoTableViewCell.self,
            forCellReuseIdentifier: MenuMainInfoTableViewCell.reuseId
        )
        view.register(
            MenuBannersTableViewCell.self,
            forCellReuseIdentifier: MenuBannersTableViewCell.reuseId
        )
        view.backgroundColor = .background
        view.sectionHeaderTopPadding = 0
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
        addSubview(tableView)
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    func update(with viewModel: MenuViewModel) {
        menuViewModel = viewModel
        tableView.reloadData()
    }
}
extension MenuView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = menuViewModel else { return nil }
        switch viewModel.sections[section].header {
        case .none:
            return UIView()
        case .tags(let tags):
            tagsView.update(with: tags)
            return tagsView
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = menuViewModel else { return 0 }
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = menuViewModel else { return 0 }
        return viewModel.sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = menuViewModel else { return UITableViewCell() }
        
        switch viewModel.sections[indexPath.section].cells[indexPath.row] {
        case .banners(let banners):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MenuBannersTableViewCell.reuseId
            ) as? MenuBannersTableViewCell else { fatalError() }
            cell.update(with: banners)
            
            return cell
        case .topFrame:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MenuRoundedViewTableViewCell.reuseId
            ) as? MenuRoundedViewTableViewCell else { fatalError() }
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            return cell
        case .mainCell(let mainCell):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MenuMainInfoTableViewCell.reuseId
            ) as? MenuMainInfoTableViewCell else { fatalError() }
            cell.update(viewModel: mainCell)
            return cell
        }
    }
}
