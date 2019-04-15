//
//  ViewController.swift
//  MultiCollectionView
//
//  Created by acotilla91 on 04/14/2019.
//  Copyright (c) 2019 acotilla91. All rights reserved.
//

import UIKit

import MultiCollectionView

class ViewController: UIViewController, MultiCollectionViewDelegate {
    
    @IBOutlet weak var collectionView: MultiCollectionView! {
        didSet {
            collectionView.delegate = self
            
            collectionView.register(UINib(nibName: PosterCellView.typeName, bundle: nil), forCellWithReuseIdentifier: PosterCellView.typeName)
            collectionView.register(UINib(nibName: FeaturedCellView.typeName, bundle: nil), forCellWithReuseIdentifier: FeaturedCellView.typeName)
            collectionView.register(UINib(nibName: HeaderView.typeName, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.typeName)
        }
    }
    
    // MARK: - MultiCollectionView Delegate -
    
    func numberOfSections(in collectionView: MultiCollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: MultiCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: MultiCollectionView, reuseIdentifierForCellAt indexPath: IndexPath) -> String {
        return indexPath.section == 0 ? FeaturedCellView.typeName : PosterCellView.typeName
    }
    
    func collectionView(_ collectionView: MultiCollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? LabeledCellView {
            cell.label.text = "Cell at \(indexPath.section),\(indexPath.item)"
        }
    }
    
    func collectionView(_ collectionView: MultiCollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size: CGSize!
        if indexPath.section == 0 {
            let width = collectionView.frame.width
            let height = 9 * width / 21
            size = CGSize(width: width, height: height)
        }
        else {
            size = CGSize(width: 160, height: 240)
        }
        
        return size
    }
    
    func collectionView(_ collectionView: MultiCollectionView, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets: UIEdgeInsets!
        if section == 0 {
            insets = UIEdgeInsets(top: 20, left: 0, bottom: 30, right: 0)
        }
        else if section == self.numberOfSections(in: collectionView) - 1 {
            insets = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
        }
        else {
            insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        return insets
    }
    
    func collectionView(_ collectionView: MultiCollectionView, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 0 : 20
    }
    
    func collectionView(_ collectionView: MultiCollectionView, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return .zero
        case 1:
            return CGSize(width: collectionView.frame.width, height: 55)
        default:
            return CGSize(width: collectionView.frame.width, height: 85)
        }
    }
    
    func collectionView(_ collectionView: MultiCollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.typeName, for: indexPath) as! HeaderView
            headerView.label.text = "Section \(indexPath.section)"
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: MultiCollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select: \(indexPath)")
    }
    
    func collectionView(_ collectionView: MultiCollectionView, shouldEnablePagingAt section: Int) -> Bool {
        return section == 0 ? true : false
    }
}

