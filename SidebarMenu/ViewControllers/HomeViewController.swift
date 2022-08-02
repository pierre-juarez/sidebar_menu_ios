//
//  HomeViewController.swift
//  SidebarMenu
//
//  Created by Tech Fitco on 1/08/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject{
  func didTapMenuButton()
}

class HomeViewController: UIViewController {
  
  weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .yellow
      title = "Home"
      
      navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))

        // Do any additional setup after loading the view.
    }
  
  @objc func didTapMenuButton(){
    delegate?.didTapMenuButton()
  }
  

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
