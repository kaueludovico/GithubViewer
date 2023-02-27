//
//  SearchScreenView.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 23/02/23.
//

import UIKit


class SearchScreenView: BaseView {
    
    lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "  Buscar"
        textField.text = "kaueludovico"
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buscar", for: .normal)
        return button
    }()
    
    override func addSubviews() {
        addSubview(searchField)
        addSubview(searchButton)
    }
    
    override func setContrainsts() {
        
        searchField.anchor(
            top: safeAreaLayoutGuide.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 250, left: 0, bottom: 0, right: 0),
            size: .init(width: 350, height: 40))
        searchField.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        searchButton.anchor(
            top: searchField.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 100, left: 0, bottom: 0, right: 0),
            size: .init(width: 150, height: 40))
        searchButton.centerXAnchor.constraint(equalTo: searchField.centerXAnchor).isActive = true
    }
}
