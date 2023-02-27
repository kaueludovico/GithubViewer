//
//  RepositoryTableViewCell.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 24/02/23.
//

import UIKit

class RepositoryTableViewCell: BaseViewCell {
    
    var repository: Repository? {
        didSet {
            title.text = repository?.name
            language.text = repository?.language
        }
    }
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var language: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.textColor = .darkGray
        return label
    }()
    
    override func addSubviews() {
        addSubview(title)
        addSubview(language)
    }
    
    override func setConstraints() {
        title.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 10, left: 10, bottom: 0, right: 0),
            size: .init(width: 200, height: 30))
        language.anchor(
            top: title.bottomAnchor,
            leading: title.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: 300, height: 30))
    }
}
