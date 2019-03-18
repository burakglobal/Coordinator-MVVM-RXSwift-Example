//  
//  LoginViewController.swift
//  XCoordinator_Example
//
//  Created by Joan Disho on 03.05.18.
//  Copyright © 2018 QuickBird Studios. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

class LoginViewController: UIViewController, BindableType {
    var viewModel: LoginViewModel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    // MARK: - Views

    @IBOutlet private var loginButton: UIButton!

    // MARK: - Stored properties
    
    private let disposeBag = DisposeBag()

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login"
    }

    // MARK: - BindableType

    func bindViewModel() {
     
        userName.rx.text
            .orEmpty
            .bindTo(self.viewModel.username)
            .addDisposableTo(disposeBag)
        
        viewModel.isValid.map { $0 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
