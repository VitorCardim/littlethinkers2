//
//  AcertosEErrosViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 15/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class AcertosEErrosViewController: UIViewController {

    @IBAction func sairdoapp(_ sender: Any) {
        func showMessageResetApp(){
            let exitAppAlert = UIAlertController(title: "Obrigado por jogar",
                                                 message: "Esperamos que joguem mais vezes e aprendam com isso",
                                                 preferredStyle: .alert)
            
            let resetApp = UIAlertAction(title: "Close Now", style: .destructive) {
                (alert) -> Void in
                // home button pressed programmatically - to thorw app to background
                UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                // terminaing app in background
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    exit(EXIT_SUCCESS)
                })
            }
            
            let laterAction = UIAlertAction(title: "Later", style: .cancel) {
                (alert) -> Void in
                self.dismiss(animated: true, completion: nil)
            }
            
            exitAppAlert.addAction(resetApp)
            exitAppAlert.addAction(laterAction)
            present(exitAppAlert, animated: true, completion: nil)
        }}
    
    var acertosnumerico = Int()
    var errosnumerico = Int()
    var pontosnumerico = Int()
    
    @IBOutlet weak var pontos: UILabel!
    @IBOutlet weak var erros: UILabel!
    @IBOutlet weak var acertos: UILabel!
    @IBOutlet weak var texto: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

    

