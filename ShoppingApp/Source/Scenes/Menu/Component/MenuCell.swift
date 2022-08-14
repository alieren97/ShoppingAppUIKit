//
//  MenuCell.swift
//  Deneme
//
//  Created by AliEren on 12.07.2022.
//

import Foundation
import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {
    let label: UILabel = {
       let l = UILabel()
        l.text = "Menu Item"
        l.textAlignment = .center
        l.textColor = .lightGray
        return l
    }()
    
    override var isSelected: Bool {
        didSet{
            label.textColor = isSelected ? .black : .lightGray
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
