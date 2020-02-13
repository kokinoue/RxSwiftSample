//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by koki inoue on 2020/02/13.
//  Copyright © 2020 koki inoue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown

        let textField = UITextField()
        textField.frame = CGRect(x:((self.view.bounds.width-320)/2),y:300,width:320,height:50)
        textField.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.frame = CGRect(x:((self.view.bounds.width-320)/2),y:400,width:320,height:50)
        label.backgroundColor = UIColor.green
        label.textColor = UIColor.white
        
        view.addSubview(textField)
        view.addSubview(label)
        
        textField.rx.text.orEmpty
        .map {$0.description}
        .bind(to: label.rx.text)
        .disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

