//
//  AcertosEErrosViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 15/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class AcertosEErrosViewController: UIViewController {
    @IBOutlet weak var tex: UIButton!
    var pontosarray = Array<Int>()
    var acertosarray = Array<Int>()
    var errosarray = Array<Int>()
    var arraypontosfirebase = Array<Int>()
    


    @IBOutlet weak var sair: UIButton!
    
    
    var acertosnumerico = Int()
    var errosnumerico = Int()
    var pontosnumerico = Int()
    

    @IBOutlet weak var acertos: UILabel!
    @IBOutlet weak var pontos: UILabel!
    @IBOutlet weak var erros: UILabel!
    @IBOutlet weak var texto: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tex.layer.cornerRadius = tex.bounds.height / 2
        sair.layer.cornerRadius = sair.bounds.height / 2
        sair.layer.borderWidth = 1
        sair.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
        texto.text = "Parabéns"
        for x in acertosarray{
            
            acertosnumerico = acertosnumerico + x}
        
        for x in errosarray {
            
            errosnumerico = errosnumerico + x}
        
        for x in pontosarray {
            
            pontosnumerico = pontosnumerico + x}
        
        acertos.text = String(acertosnumerico)
        
        erros.text = String(errosnumerico)
        
        pontos.text = String(pontosnumerico)
        if  arraypontosfirebase.count > 0{
           if  pontosnumerico > arraypontosfirebase.max()!{
            texto.text = "Novo Recorde!"}}}

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

    

