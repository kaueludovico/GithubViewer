//
//  BaseViewCell.swift
//  GithubViewerScroll
//
//  Created by Kaue Ludovico on 23/02/23.
//

import UIKit

class BaseViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        
    }
    func setConstraints() {
        
    }
}
