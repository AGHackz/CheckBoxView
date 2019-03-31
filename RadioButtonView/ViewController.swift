//
//  ViewController.swift
//  RadioButtonView
//
//  Created by Ankit Gupta on 30/03/19.
//  Copyright © 2019 Ankit Gupta. All rights reserved.
//

import UIKit
import TTGTagCollectionView

class ViewController: UIViewController {

    @IBOutlet weak var tagView: TTGTagCollectionView!
    
    @IBOutlet weak var collectionView: DynamicCollectionView!
    
    var tags: [RadioButtonView] = [RadioButtonView]()
    var titles: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addStackView()
        self.setupUI()
        self.setupCollectionView()
    }
    
    private func addStackView() {
        let stackView = UIStackView(arrangedSubviews: [RadioButtonView(title: "Ankit"), RadioButtonView(title: "Raju"), RadioButtonView(title: "AGCyberking")])
        stackView.spacing = 8.0
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: self.view.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(lessThanOrEqualTo: self.view.trailingAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -175.0).isActive = true
    }
    
    private func setupUI() {
        self.titles.append("Title 2")
        self.titles.append("Title 1")
        self.titles.append("Title 323425")
        self.titles.append("Title 425")
        self.titles.append("Title 2546")
        self.titles.append("Title 2sdgdfds")
        self.titles.append("Title 29797434")
        self.makeTags()
        self.tagView.delegate = self
        self.tagView.dataSource = self
    }
    
    func makeTags() {
//        for title in self.titles {
//            let view = RadioButtonView(title: title)
//            view.sizeToFit()
//            self.tags.append(view)
//        }
        self.tagView.reload()
    }

}

extension ViewController: TTGTagCollectionViewDelegate, TTGTagCollectionViewDataSource {
    
    func tagCollectionView(_ tagCollectionView: TTGTagCollectionView!, sizeForTagAt index: UInt) -> CGSize {
        debugPrint(self.tags[Int(index)].getAutoLayoutedSize())
        return self.tags[Int(index)].getAutoLayoutedSize()
    }
    
    func numberOfTags(in tagCollectionView: TTGTagCollectionView!) -> UInt {
        return UInt(self.tags.count)
    }
    
    func tagCollectionView(_ tagCollectionView: TTGTagCollectionView!, tagViewFor index: UInt) -> UIView! {
        return self.tags[Int(index)]
    }
    
}
