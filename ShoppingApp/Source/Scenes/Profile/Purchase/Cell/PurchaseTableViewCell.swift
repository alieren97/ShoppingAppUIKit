//
//  PurchaseTableViewCell.swift
//  ShoppingApp
//
//  Created by AliEren on 14.07.2022.
//

import Foundation
import UIKit
import SnapKit

final class PurchaseTableViewCell: UITableViewCell {
    static let identifier = "PurchaseTableViewCell"
    static let rowHeight: CGFloat = 325
    var images = [String]()
    var order: Order?
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubCells()
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var orderContainerView: UIView = {
        let view = UIView()
        view.addSubview(orderStatusLabel)
        view.addSubview(orderStatusView)
        view.addSubview(orderDateLabel)
        view.addSubview(orderPriceLabel)
        view.addSubview(imageCollectionView)
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var orderStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var orderStatusView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 24
        return view
    }()
    
    private lazy var orderDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var orderPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    private lazy var imageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 150)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(OrderProductImageCollectionViewCell.self, forCellWithReuseIdentifier: OrderProductImageCollectionViewCell.identifier)
        cv.isScrollEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    fileprivate  func setupSubCells(){
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
    }
    
    private func setupViews() {
        addSubview(orderContainerView)
    }
    
    private func setupLayout() {
        orderContainerView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        orderStatusLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        orderStatusView.snp.makeConstraints { make in
            make.leading.equalTo(orderStatusLabel.snp.trailing).offset(10)
            make.height.width.equalTo(20)
        }
        
        orderDateLabel.snp.makeConstraints { make in
            make.top.equalTo(orderStatusLabel.snp.bottom).offset(-5)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        
        orderPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(orderDateLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }
        
        imageCollectionView.snp.makeConstraints { make in
            make.top.equalTo(orderPriceLabel.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
    }
}


extension PurchaseTableViewCell {
    func configure(order:Order) {
        orderStatusLabel.text = order.status.uppercased()
        orderDateLabel.text = order.createdAt
        orderPriceLabel.text = String(order.amount)
        orderStatusView.backgroundColor = order.status == "pending" ? UIColor.red : UIColor.green
        self.images = order.getOrderImageLists()
        self.order = order
        
    }
}

extension PurchaseTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        return order?.products.count ?? 0
        return order?.getOrderImageLists().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderProductImageCollectionViewCell.identifier,
                                                            for: indexPath) as? OrderProductImageCollectionViewCell else { return UICollectionViewCell() }
        let image = self.images[indexPath.row]
        cell.configure(img: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 175)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = self.images[indexPath.row]
        print(image)
    }
}
