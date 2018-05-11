//
//  ViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 07/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var studentname: UITextField!
    @IBOutlet weak var continuar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        if let name = UserDefaults.standard.value(forKey: "name") as?String{
            studentname.text = name
        }
        studentname.delegate = self
        if studentname.text?.isEmpty == false {
            continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            continuar.isEnabled = true
            continuar.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            continuar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
            continuar.isEnabled = false
            continuar.setTitleColor(UIColor(red:0.81, green:0.88, blue:0.90, alpha:1.0), for: .normal)
        }
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let enviarnome = segue.destination as! AvaViewController
        enviarnome.student = studentname.text!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            UserDefaults.standard.set(textField.text, forKey: "name")
        }
        self.view.endEditing(true)
        if studentname.text?.isEmpty == false {
            continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            continuar.isEnabled = true
            continuar.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            continuar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
            continuar.isEnabled = false
            continuar.setTitleColor(UIColor(red:0.81, green:0.88, blue:0.90, alpha:1.0), for: .normal)
        }
        
        return false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        if studentname.text?.isEmpty == false {
            continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            continuar.isEnabled = true
            continuar.setTitleColor(UIColor.black, for: .normal)
        }
        else{
            continuar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
            continuar.isEnabled = false
            continuar.setTitleColor(UIColor(red:0.81, green:0.88, blue:0.90, alpha:1.0), for: .normal)
        }
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}






