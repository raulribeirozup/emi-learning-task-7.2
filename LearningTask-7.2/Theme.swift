//
//  Theme.swift
//  LearningTask-7.2
//
//  Created by rafael.rollo on 13/05/2022.
//

import UIKit

protocol ThemeConfigurable: UIViewController {
    func applyTheme()
}

extension ThemeConfigurable {
    func applyTheme() {
        configureNavigationItem()
    }
    
    private func configureNavigationItem() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .init(named: "Logo")
        imageView.contentMode = .scaleAspectFit
    
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = .secondaryLabel
        label.text = "Dogepédia"
        
        let titleView = UIStackView(arrangedSubviews: [
            imageView, label
        ])
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.axis = .horizontal
        titleView.alignment = .center
        titleView.distribution = .fill
        titleView.spacing = 8
        titleView.isLayoutMarginsRelativeArrangement = true
        titleView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        
        navigationItem.titleView = titleView
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: navigationItem.titleView!.heightAnchor, constant: -titleView.layoutMargins.bottom)
        ])
    }
}

extension UIViewController: ThemeConfigurable {}
