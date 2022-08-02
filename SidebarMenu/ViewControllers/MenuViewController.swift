//
//  MenuViewController.swift
//  SidebarMenu
//
//  Created by Tech Fitco on 1/08/22.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  enum MenuOptions: String, CaseIterable{
    case home = "Home"
    case info = "Information"
    case appRating = "App Rating"
    case shareApp = "Share App"
    case setting = "Settings"
    
    var imageName:String{
      switch self{
      case .home: return "home"
      case .info: return "airplane"
      case .appRating: return "star"
      case .shareApp: return "message"
      case .setting: return "gear"
      }
    }
    
  }
  

  
  private let tableView: UITableView = {
    let table = UITableView()
    table.backgroundColor = nil
    table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
    return table
  }()
  
  let greyColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    view.backgroundColor = greyColor
    title = "Menu"
    // Do any additional setup after loading the view.
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
  }
  
  //Table
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return MenuOptions.allCases.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
    cell.textLabel?.textColor = .white
    cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
    cell.imageView?.tintColor = .white
    cell.backgroundColor = greyColor
    cell.contentView.backgroundColor = greyColor
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
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
