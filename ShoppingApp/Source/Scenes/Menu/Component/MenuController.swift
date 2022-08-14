//
//  MenuController.swift
//  Deneme
//
//  Created by AliEren on 12.07.2022.
//

import Foundation
import UIKit
import SnapKit

protocol MenuControllerDelegate {
    func didTapMenuItem(indexPath: IndexPath)
}


class MenuController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate var cellId = "cellId"
    fileprivate let categoryMenuItems = ["MAN", "WOMAN", "CHILD"]
    fileprivate let profileMenuItems = ["PURCHASES","PROFILE","STORES","HELP","SETTINGS"]
    var delegate: MenuControllerDelegate?
    var menuPage: String?
 
    init(pageName:String ,collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        self.menuPage = pageName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var logoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "zara_logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(180)
            make.leading.equalToSuperview().inset(60)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(4)
            make.height.equalTo(50)
            make.trailing.equalToSuperview()
            menuPage == "profile" ? make.leading.equalToSuperview().inset(60) : make.leading.equalToSuperview()
        }
        
        collectionView.backgroundColor = .white
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
      
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapMenuItem(indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return menuPage == "profile" ? profileMenuItems.count : categoryMenuItems.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        let item = menuPage == "profile" ? profileMenuItems[indexPath.row] : categoryMenuItems[indexPath.row]
        cell.label.text = item
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return .init(width: menuPage == "profile" ? width / 3.5 : width / CGFloat(categoryMenuItems.count), height: view.frame.height) 
//        return .init(width: width / CGFloat(menuPage == "profile" ? profileMenuItems.count : categoryMenuItems.count), height: view.frame.height)
    }
}
