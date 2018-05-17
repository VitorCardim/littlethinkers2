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
    
    @IBAction func nameChanged(_ sender: Any) {
        UserDefaults.standard.set(studentname.text, forKey: "name")
        if (studentname.text?.isEmpty)! {
            disableButton(continuar)
        } else {
            enableButton(continuar)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        if let name = UserDefaults.standard.value(forKey: "name") as? String {
            studentname.text = name
        }
        studentname.delegate = self
        if (studentname.text?.isEmpty)! {
            disableButton(continuar)
        } else {
            enableButton(continuar)
        }
        
        continuar.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
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
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func disableButton(_ button:UIButton) {
        button.isEnabled = false
        continuar.backgroundColor = #colorLiteral(red: 0.7508755326, green: 0.9684799314, blue: 0.774261415, alpha: 1)
        continuar.setTitleColor(#colorLiteral(red: 0.5010768468, green: 0.6479894302, blue: 0.5168174807, alpha: 1), for: .normal)

    }
    
    func enableButton(_ button:UIButton) {
        button.isEnabled = true
        continuar.setTitleColor(UIColor.black, for: .normal)
        continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)

    }
}






