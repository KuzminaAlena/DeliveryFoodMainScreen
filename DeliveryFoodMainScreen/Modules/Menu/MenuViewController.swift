//
//  MenuViewController.swift
//  DeliveryFoodMainScreen
//
//  Created by Алена on 13.10.2022.
//
import UIKit

final class MenuViewController: UIViewController {
    
    private lazy var leftNavBarLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = .displayMediumTitle
        label.textColor = .blackTitle
        return label
    }()
    
    private let presenter: MenuPresenter
    
    init(presenter: MenuPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainView = MenuView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        setupNavBar()
    }
    
    private func setupNavBar() {
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        
        let leftNavBarImageView = UIImageView(image: .arrowToDown)
        leftNavBarImageView.contentMode = .scaleAspectFit
        let leftNavBarStackView = UIStackView(arrangedSubviews: [leftNavBarLabel, leftNavBarImageView])
        leftNavBarStackView.axis = .horizontal
        leftNavBarStackView.spacing = 8.0
        let leftNavBarItem = UIBarButtonItem(customView: leftNavBarStackView)
        navigationItem.setLeftBarButton(leftNavBarItem, animated: true)
    }
}

extension MenuViewController: MenuViewProtocol {
    func update(with viewModel: MenuViewModel) {
        mainView.update(with: viewModel)
    }
}
