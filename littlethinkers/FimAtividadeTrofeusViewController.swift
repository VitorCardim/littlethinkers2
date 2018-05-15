//
//  FimAtividadeTrofeusViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 15/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class FimAtividadeTrofeusViewController: UIViewController {
    var acertos = Int()
    @IBOutlet weak var backgroundcolorido: UIButton!
    @IBOutlet weak var imagemtrophy: UIImageView!
    @IBOutlet weak var qualtipo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundcolorido.layer.cornerRadius = backgroundcolorido.bounds.height*(0.1)
        if acertos < 50{
            qualtipo.text = "participação"
            imagemtrophy.image = UIImage(named:"Participação")}
        if acertos > 50 && acertos > 100 {
            qualtipo.text = "50 acertos"
            imagemtrophy.image = UIImage(named:"50 acertos")
            }
        if acertos > 100 && acertos > 150 {
            qualtipo.text = "100 acertos"
            imagemtrophy.image = UIImage(named:"100 acertos")
            }
        if acertos > 150 && acertos > 200 {
            qualtipo.text = "150 acertos"
            imagemtrophy.image = UIImage(named:"150 acertos")
            }
        if acertos > 150  {
            qualtipo.text = "50 acertos"
            imagemtrophy.image = UIImage(named:"200 acertos")
            }
            
        }

        

        // Do any additional setup after loading the view.

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
