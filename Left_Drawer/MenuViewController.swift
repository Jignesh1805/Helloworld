//
//  TableViewController.swift
//  Left_Drawer
//
//  Created by Romal Tandel on 9/25/17.
//  Copyright © 2017 Romal Tandel. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var menuNameArr:Array = [String]()
    var menuImage:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuNameArr = ["Home","Message"]
        menuImage = [UIImage(named : "menu-three-lines-button-interface-symbol")!,UIImage(named : "message")!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        cell.imgIcon.image = menuImage[indexPath.row]
        cell.lblMenu.text = menuNameArr[indexPath.row]
        cell.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        if cell.tag == 0{
            let mainStoryBoard:UIStoryboard = UIStoryboard(name : "Main" ,bundle : nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontviewController = UINavigationController.init(rootViewController:desController)
            revealViewController().pushFrontViewController(newFrontviewController,animated:true)
        }
        if cell.tag == 1{
            let mainStoryBoard:UIStoryboard = UIStoryboard(name : "Main" ,bundle : nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "MessageViewController") as! MessageViewController
            let newFrontviewController = UINavigationController.init(rootViewController:desController)
            revealViewController().pushFrontViewController(newFrontviewController,animated:true)
        }
    }
    

}
