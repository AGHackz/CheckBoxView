//
//  RadioButtonView.swift
//  RadioButtonView
//
//  Created by Ankit Gupta on 30/03/19.
//  Copyright © 2019 Ankit Gupta. All rights reserved.
//

import UIKit

class RadioButtonView: UIView {
    
    private var img_icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "unselected")
        return imageView
    }()
    
    private var lbl_title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Test Title"
        return label
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var title: String = "" {
        didSet {
            self.lbl_title.text = self.title
        }
    }
    
    var selected: Bool = false {
        didSet {
            self.didChangeSelectionState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.translatesAutoresizingMaskIntoConstraints = false
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.commonInit()
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    private func commonInit() {
        self.contentView.addSubview(self.img_icon)
        self.img_icon.translatesAutoresizingMaskIntoConstraints = false
        self.img_icon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8.0).isActive = true
        self.img_icon.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        self.img_icon.widthAnchor.constraint(equalTo: self.img_icon.heightAnchor, multiplier: 1.0).isActive = true
        self.img_icon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0.0).isActive = true
        self.img_icon.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 8.0).isActive = true
        self.img_icon.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -8.0).isActive = true
        
        self.contentView.addSubview(self.lbl_title)
        self.lbl_title.translatesAutoresizingMaskIntoConstraints = false
        self.lbl_title.leadingAnchor.constraint(equalTo: self.img_icon.trailingAnchor, constant: 4.0).isActive = true
        self.lbl_title.topAnchor.constraint(greaterThanOrEqualTo: self.contentView.topAnchor, constant: 6.0).isActive = true
        self.lbl_title.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -6.0).isActive = true
        self.lbl_title.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.lbl_title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8.0).isActive = true
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 3.0
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
        self.contentView.fillSuperview()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapOnRadioButton(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
//    private func commonInit() {
//        self.addSubview(self.img_icon)
//        self.img_icon.translatesAutoresizingMaskIntoConstraints = false
//        self.img_icon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0).isActive = true
//        self.img_icon.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
//        self.img_icon.widthAnchor.constraint(equalTo: self.img_icon.heightAnchor, multiplier: 1.0).isActive = true
//        self.img_icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
//        self.img_icon.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 8.0).isActive = true
//        self.img_icon.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8.0).isActive = true
//
//        self.addSubview(self.lbl_title)
//        self.lbl_title.translatesAutoresizingMaskIntoConstraints = false
//        self.lbl_title.leadingAnchor.constraint(equalTo: self.img_icon.trailingAnchor, constant: 4.0).isActive = true
//        self.lbl_title.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 6.0).isActive = true
//        self.lbl_title.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -6.0).isActive = true
//        self.lbl_title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        self.lbl_title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0).isActive = true
//
//        self.layer.borderWidth = 1.0
//        self.layer.borderColor = UIColor.lightGray.cgColor
//        self.layer.cornerRadius = 3.0
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapOnRadioButton(_:)))
//        self.addGestureRecognizer(tapGesture)
//    }
    
    convenience init(title: String) {
        self.init()
        self.lbl_title.text = title
    }
    
    private func didChangeSelectionState() {
        self.img_icon.image = selected ? UIImage(named: "selected") : UIImage(named: "unselected")
    }
    
    @objc func didTapOnRadioButton(_ sender: UITapGestureRecognizer) {
        selected.toggle()
    }
    
//    func animateRadioButtonToggle() {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.img_icon.transform = CGAffineTransform(scaleX: 0.55, y: 0.55)
//        }) { (isFinished) in
//            self.img_icon.image = self.selected ? UIImage(named: "selected") : UIImage(named: "unselected")
//            UIView.animate(withDuration: 0.45, animations: {
//                self.img_icon.transform = .identity
//            }) { (isFinished) in
//            }
//        }
//    }
}
