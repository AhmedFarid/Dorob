//
//  navSetupHelper.swift
//  Dorob
//
//  Created by Ahmed farid on 3/10/20.
//  Copyright © 2020 E-bakers. All rights reserved.
//


import UIKit

extension UIViewController {
    
//    func setUpNav(logo: Bool = false ,menu: Bool = false, cart: Bool = false, back: Bool = false) {
//        switch logo {
//        case true:
//
//        default:
//            print("no")
//        }
//
//        switch menu {
//        case true:
//            let leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "menu-1"), style: .done, target: self, action: #selector(sideMenu))
//            self.navigationItem.leftBarButtonItem = leftBarButtonItem
//        default:
//            print("no")
//        }
//
//        switch cart {
//        case true:
//            print("x")
//        default:
//            print("no")
//        }
//
//        switch back {
//        case true:
//            let backImage = UIImage(named: "BACK-1")
//            self.navigationController?.navigationBar.backIndicatorImage = backImage
//            self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
//            self.navigationController?.navigationBar.backItem?.title = ""
//        default:
//            print("no")
//        }
        
//    }
    
    func setUpNavColore(isTranslucent: Bool, hiden: Bool, backColor: UIColor){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = isTranslucent
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8078431373, green: 0.5921568627, blue: 0.1490196078, alpha: 1)
        let backImage = UIImage(named: "Back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.backItem?.title = ""
        self.navigationController?.navigationBar.tintColor = backColor
        navigationController?.setNavigationBarHidden(hiden, animated: true)
    }
    
//    @objc func sideMenu() {
//        let menu = UIStoryboard(name: "sideMenu", bundle: nil).instantiateViewController(withIdentifier: "RightMenu") as! SideMenuNavigationController
//        menu.presentationStyle = .menuSlideIn
//        menu.menuWidth = view.frame.size.width - 50
//        present(menu, animated: true, completion: nil)
//    }
//
//    @objc func showCart() {
//        let vc = cartVC(nibName: "cartVC", bundle: nil)
//        vc.fromMnue = false
//        self.navigationController!.pushViewController(vc, animated: true)
//    }
//
//    func addBadge(count: Int) {
//        let bagButton = BadgeButton()
//        bagButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        bagButton.tintColor = UIColor.white
//        bagButton.setImage(UIImage(named: "bag nav"), for: .normal)
//        bagButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 5)
//        print("cart Count \(count)")
//        bagButton.badge = "\(count)"
//        bagButton.addTarget(self, action: #selector(self.showCart), for: UIControl.Event.touchUpInside)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: bagButton)
//    }
}
