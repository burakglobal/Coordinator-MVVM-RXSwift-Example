//  
//  LoginViewModel.swift
//  XCoordinator_Example
//
//  Created by Joan Disho on 03.05.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import Action
import RxSwift
import XCoordinator

struct LoginViewModel {
    
    let username = Variable<String>("")
    let password = Variable<String>("")
    
    let isValid: Observable<Bool>
    
    init() {
        isValid = Observable.combineLatest(self.username.asObservable(), self.password.asObservable())
        { (username, password) in
            return username.characters.count > 0
                && password.characters.count > 0
        }
    }
}
