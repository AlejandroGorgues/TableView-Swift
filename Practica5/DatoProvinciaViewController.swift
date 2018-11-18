//
//  DatoProvinciaViewController.swift
//  Practica5
//
//  Created by Admin on 10/11/2018.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit


class DatoProvinciaViewController: UIViewController {
    
    @IBOutlet var lProvincia: UILabel!
    @IBOutlet var textoProvincia: UITextView!
    
    var nProvincia: String = ""
    var dProvincia: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lProvincia.text = nProvincia
        textoProvincia.text = dProvincia

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.setValue(textoProvincia.text!, forKey: nProvincia)
        
    }
}

