//
//  FimAtividadeTrofeusViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 15/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class FimAtividadeTrofeusViewController: UIViewController {
    
    @IBOutlet weak var qualtip: UIButton!
    @IBOutlet weak var continuar: UIButton!
    var pontosarray = Array<Int>()
    
    var acertosarray = Array<Int>()
    
    var errosarray = Array<Int>()
    
    var acertos = Int()
    @IBOutlet weak var backgroundcolorido: UIButton!
    @IBOutlet weak var imagemtrophy: UIImageView!
    @IBOutlet weak var qualtipo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.borderWidth = 1
        continuar.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
        backgroundcolorido.layer.borderWidth = 1
        backgroundcolorido.layer.borderColor = #colorLiteral(red: 0.9968630672, green: 0.9929154521, blue: 0.9364566787, alpha: 1)
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        backgroundcolorido.layer.cornerRadius = backgroundcolorido.bounds.height*(0.1)
        qualtip.layer.cornerRadius = qualtip.bounds.height / 2
        
        if acertos <= 50{
            
            qualtipo.text = "Participação"
            
            imagemtrophy.image = UIImage(named:"participação")}
        
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
            
            qualtipo.text = "200 acertos"
            
            imagemtrophy.image = UIImage(named:"200 acertos")
            
        }
        
        
        
    }

        

        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let enviarpontosarray = segue.destination as! AcertosEErrosViewController
        
        enviarpontosarray.pontosarray = pontosarray
        
        let enviaracertosarray = segue.destination as! AcertosEErrosViewController
        
        enviaracertosarray.acertosarray = acertosarray
        
        let enviarerrosarray = segue.destination as! AcertosEErrosViewController
        
        enviarerrosarray.errosarray = errosarray
        
        
        
    }
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


