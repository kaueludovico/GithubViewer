//
//  BaseView.swift
//  ScrollStack
//
//  Created by Kaue Ludovico on 15/02/23.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setContrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        // Do nothing
    }
    
    func setContrainsts() {
        // Do nothing
    }
}
