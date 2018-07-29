//
//  ViewController.swift
//  MVPExample
//
//  Created by Sanad Barjawi on 7/29/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var userPresenter:UserPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        userPresenter = UserPresenter(usrService: UserService())
        userPresenter.attachView(self)//set delegate to self
        userPresenter.getUsers()
    }
    
}
extension ViewController:UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userPresenter.usersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        guard let name = userPresenter.usersData(row: indexPath.row).Name,let age = userPresenter.usersData(row: indexPath.row).age else {
            return cell
        }
        cell.populateCell(name: name, age: age)
        return cell
    }
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let name = userPresenter.usersData(row: indexPath.row).Name else{
            print("name is not valid")
            return
        }
        print("\(name) is selected")
    }
}

extension ViewController:UserViewProtocol{
    func refreshData() {
        tableView.reloadData()
    }
    
    func setEmptyUsers() {
        print("no users found")
    }
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator.stopAnimating()
    }
  
}
