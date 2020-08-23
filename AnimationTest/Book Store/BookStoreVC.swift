//
//  BookStoreVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 9/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

private let cellId = "CellId"
let headerId = "headerId"
let categoryHeaderId = "categoryHeaderId"

class BookStoreVC: UIViewController  {

    @IBOutlet weak var bookCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureCollectionViewLayout()
    }
}

extension BookStoreVC {
    
    private func createLayout() -> UICollectionViewLayout {
           
       let layout = UICollectionViewCompositionalLayout{(sectionNumber, env) -> NSCollectionLayoutSection? in
           
           if sectionNumber == 0 {
               let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
               item.contentInsets.trailing = 5
               item.contentInsets.leading = 5
               
               let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
               let section = NSCollectionLayoutSection(group: group)
               section.orthogonalScrollingBehavior = .paging
               return section
           }else if sectionNumber == 1{
               
               let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150)))
               item.contentInsets.trailing = 16
               item.contentInsets.bottom = 16
               
               let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500)), subitems: [item])
               let section = NSCollectionLayoutSection(group: group)
               section.contentInsets.leading = 16
               
               section.boundarySupplementaryItems = [
                   .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
               ]
               
               return section
           }else if sectionNumber == 2{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 32
                
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.orthogonalScrollingBehavior = .continuous
                return section
           }else{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(250)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 32, leading: 16, bottom: 0, trailing: 0)
                return section
            }
        }

       return layout
   }
   
    private func configureCollectionViewLayout() {

        bookCollection.backgroundColor = .white
        bookCollection.dataSource = self
        bookCollection.delegate = self
        bookCollection.collectionViewLayout = createLayout()
        let cellNib = UINib(nibName: "BookCell", bundle: nil)
        bookCollection.register(cellNib, forCellWithReuseIdentifier: cellId)
        bookCollection.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
    }
}

extension BookStoreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BookCell
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        if indexPath.section == 1 {
            let item = indexPath[1]
            let category = SingleCategoryVC(nibName: "SingleCategoryVC", bundle: nil)
            category.newTitle = "\(item)"
            navigationController?.pushViewController(category, animated: true)
        }else{
            navigationController?.pushViewController(controller, animated: true)
        }
    }
}
