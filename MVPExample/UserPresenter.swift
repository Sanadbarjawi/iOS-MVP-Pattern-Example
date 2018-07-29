//
//  UserPresenter.swift
//  MVPExample
//
//  Created by Sanad Barjawi on 7/29/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import Foundation

protocol UserViewProtocol :class{
    func startLoading()
    func finishLoading()
    func reloadData()
    func setEmptyUsers()
}

class UserPresenter {
    
    init(usrService:UserService) {
        self.userService = usrService
    }
    
    
    private var userService:UserService? //to access and call the service
    weak private var userView : UserViewProtocol?//Delegate variable
    private var usersToDisplay = [User]()
    func attachView(_ view:UserViewProtocol){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    func usersCount()->Int{
        return usersToDisplay.count
    }
    func usersData(row:Int)->User{
        return usersToDisplay[row]
    }
    
    func getUsers(){
        self.userView?.startLoading()
        userService?.getUsers{ [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                self?.usersToDisplay = users
                self?.userView?.reloadData()
            }
        }
    }
}
