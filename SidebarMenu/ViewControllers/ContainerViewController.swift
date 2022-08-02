//
//  ViewController.swift
//  SidebarMenu
//
//  Created by Tech Fitco on 1/08/22.
//

import UIKit

class ContainerViewController: UIViewController {
  
  enum MenuState {
    case opened
    case closed
  }
  
  private var menuState: MenuState = .closed
  
  let homeVC = HomeViewController()
  let menuVC = MenuViewController()
  var navVc: UINavigationController?

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .red
    addChildVCs()
    
  }
  
  private func addChildVCs(){
    //Menu
    addChild(menuVC)
    view.addSubview(menuVC.view)
    menuVC.didMove(toParent: self)
    //Home
    homeVC.delegate = self
    let navVC = UINavigationController(rootViewController: homeVC)
    addChild(navVC)
    view.addSubview(navVC.view)
    navVC.didMove(toParent: self)
    self.navVc = navVC
  }
  


}

extension ContainerViewController: HomeViewControllerDelegate{
  func didTapMenuButton(){
    switch menuState {
    case .opened:
      //Lógic para opened
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
        self.navVc?.view.frame.origin.x = 0
      } completion: { [weak self] done in
        if done {
          self?.menuState = .closed
        }
      }
      break
    case .closed:
      //Logic para closed
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
        self.navVc?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
      } completion: { [weak self] done in
        if done {
          self?.menuState = .opened
        }
      }
      
    }
  }
}


