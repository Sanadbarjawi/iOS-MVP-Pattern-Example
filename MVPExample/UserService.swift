//
//  UserService.swift
//  MVPExample
//
//  Created by Sanad Barjawi on 7/29/18.
//  Copyright © 2018 Sanad Barjawi. All rights reserved.
//

import Foundation
class UserService {
    
    //the service delivers mocked data with a delay
    func getUsers(_ callBack:@escaping ([User]) -> Void){
        let user1 = User()
        let user2 = User()
        let user3 = User()
        let user4 = User()

        user1.Name = "ahmad"
        user2.Name = "sameer"
        user3.Name = "Loai"
        user4.Name = nil

        user1.age = "32"
        user2.age = "23"
        user3.age = "26"
        user4.age = "30"
        let usersArr = [user1,user2,user3,user4]
        
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            callBack(usersArr)
        }
    }
}
