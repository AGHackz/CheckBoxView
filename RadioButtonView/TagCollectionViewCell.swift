//
//  TagCollectionViewCell.swift
//  RadioButtonView
//
//  Created by Ankit Gupta on 31/03/19.
//  Copyright © 2019 Ankit Gupta. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "TagCollectionViewCell"
    var radioButtonView: RadioButtonView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.radioButtonView = RadioButtonView(title: "Test Title")
        self.contentView.addSubview(self.radioButtonView)
        self.radioButtonView.fillSuperview()
    }
    
    func configCell(title: String) {
        self.radioButtonView.title = title
    }
    
}

extension UIView {
    
    func fillSuperview(edgeInset: UIEdgeInsets = .zero) {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInset.left).isActive = true
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInset.top).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -edgeInset.right).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -edgeInset.bottom).isActive = true
        }
    }
    
}

class DynamicCollectionView: UICollectionView {
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override func reloadData() {
        super.reloadData()
        self.layoutIfNeeded()
    }
    
}
