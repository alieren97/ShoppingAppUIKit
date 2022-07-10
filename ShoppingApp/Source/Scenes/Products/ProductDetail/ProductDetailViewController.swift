//
//  ProductDetail.swift
//  ShoppingApp
//
//  Created by AliEren on 29.05.2022.
//

import Foundation
import UIKit
import SnapKit

class ProductDetailViewController: UIViewController,Layouting {
    typealias ViewType = ProductDetail
    var product: ProductList?
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
//        setupTargets()
    }
    
}


extension ProductDetailViewController: UITableViewDelegate,UITableViewDataSource {
    
    func setupTableView() {
        layoutableView.productImageTableView.dataSource = self
        layoutableView.productImageTableView.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return product?.img.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductImageTableViewCell.identifier,
                                                       for: indexPath) as? ProductImageTableViewCell else { return UITableViewCell() }
        let productImage = product?.img[indexPath.row] ?? ""
        
        cell.configure(productImage: productImage)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

//extension ProductDetailViewController {
//    func setupTargets() {
//        let panGestureRecognizerMiniPlayerContainer = UIPanGestureRecognizer(target: self,
//                                                                             action: #selector(showPopUpPanGesture))
//        layoutableView.productDetailScrollView.addGestureRecognizer(panGestureRecognizerMiniPlayerContainer)
//
//
//    }
//}

//
//extension ProductDetailViewController {
//    @objc func showPopUpPanGesture(_ gesture: UIPanGestureRecognizer) {
//
//        guard let gestureView = layoutableView.productDetailScrollView.superview else {return}
//        let translation = gesture.translation(in: gestureView)
//        let velocity = gesture.velocity(in: gestureView)
//        let height = UIScreen.main.bounds.height
//
//        switch gesture.state {
//        case .changed:
//            guard translation.y <= 0 else { return }
//            print(translation.y)
//            layoutableView.productDetailScrollView.transform = CGAffineTransform(translationX: 0, y:translation.y)
//
//            layoutableView.productDetailScrollView.snp.remakeConstraints{ remake in
//                remake.bottom.equalToSuperview()
//                remake.height.equalTo(350 - translation.y)
//                remake.width.equalToSuperview()
//            }
//            self.view.layoutIfNeeded()
//
////            layoutableView.productSubContainerView.transform = CGAffineTransform(translationX: 0, y: translation.y)
////            layoutableView.productSubContainerView.transform = CGAffineTransform(translationX: v0, y: (height - 80) + translation.y)
////            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
////                self.layoutableView.productContainerView.alpha = 0 + (-(translation.y) / 30)
////            }
//        case .ended:
//            print("translation.y")
////            self.navigationController?.isNavigationBarHidden = true
////            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut) {
////                if translation.y < ((-height) * 0.25) || (velocity.y) / 60 < -30 {
////                    self.layoutableView.productSubContainerView.transform = CGAffineTransform(translationX: 0, y: 0)
////                    self.layoutableView.productContainerView.alpha = 1
////                } else {
////                    self.layoutableView.productSubContainerView.transform = CGAffineTransform(translationX: 0, y: (height - 80))
////                    self.layoutableView.productContainerView.alpha = 0
////                }
////            }
//        default:
//            break
//        }
//    }
//}
