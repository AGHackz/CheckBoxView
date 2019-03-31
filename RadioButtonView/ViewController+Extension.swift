//
//  ViewController+Extension.swift
//  RadioButtonView
//
//  Created by Ankit Gupta on 31/03/19.
//  Copyright © 2019 Ankit Gupta. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        self.collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
        self.collectionView.collectionViewLayout = layout
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.cellIdentifier, for: indexPath) as! TagCollectionViewCell
        let title = self.titles[indexPath.row]
        cell.configCell(title: title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = self.titles[indexPath.row]
        let radioButtonView = RadioButtonView(title: title)
        radioButtonView.sizeToFit()
        let calculatedSize: CGSize = radioButtonView.getAutoLayoutedSize()
        debugPrint("Size : \(calculatedSize)")
        return calculatedSize
    }
    
}

extension UIView {
    
    func getAutoLayoutedSize() -> CGSize {
        return self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
}
