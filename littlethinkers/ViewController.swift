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
    @IBOutlet weak var bottommargintext: NSLayoutConstraint!
    @IBOutlet weak var bottommargincontinuar: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        if let name = UserDefaults.standard.value(forKey: "name") as?String{
            studentname.text = name
        }
        studentname.delegate = self
    }
    @IBAction func continuar(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let enviarnome = segue.destination as! AvaViewController
        enviarnome.student = studentname.text!
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            UserDefaults.standard.set(textField.text, forKey: "name")
        }
        self.view.endEditing(true)
        return false
    }
}






