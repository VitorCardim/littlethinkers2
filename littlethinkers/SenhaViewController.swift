//
//  SenhaViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 08/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit
import Firebase

class SenhaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var senhaprofessora:[String] = []
    var ref = Database.database().reference()
    var stringsenha = ""
    var pontosarray = Array<Int>()
    var acertosarray = Array<Int>()
    var errosarray = Array<Int>()
    var pontos = String()
    var senhaenviar = String()
    @IBOutlet weak var codigoacesso: UILabel!
    @IBOutlet weak var apagar: UIButton!
    @IBOutlet weak var continuar: UIButton!
    @IBOutlet weak var tecladoSenhas: UICollectionView!
    @IBOutlet weak var quadroSenha: UICollectionView!
    var aluno = ""
    var avatar = Int()
    
    var imageTeclado = ["senha1","senha2","senha3","senha4","senha5","senha6","senha7","senha8","senha9"]
    var imageSenha = [String]()
    var senha = [Int]()
    var senhastring = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.child("atividades").observeSingleEvent(of: .value, with: { (snapshot) in
            let atividadeFirebase = snapshot.value as? NSDictionary
            for (codigo, _) in atividadeFirebase! {
                let code = codigo as! String
                self.senhaprofessora.append(code)
                

            }

            })

        
        quadroSenha.delegate = self
        quadroSenha.dataSource = self
        tecladoSenhas.delegate = self
        tecladoSenhas.dataSource = self
        continuar.isEnabled = false
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        apagar.isEnabled = false
        apagar.layer.cornerRadius = continuar.bounds.height / 2
        continuar.layer.borderWidth = 1
        apagar.layer.borderWidth = 1
        continuar.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
        apagar.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.tecladoSenhas{
            return 1}
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.tecladoSenhas{
            return imageTeclado.count
        }
        return imageSenha.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.tecladoSenhas{
        let cellT:SenhaTecladoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageTeclado", for: indexPath) as! SenhaTecladoCollectionViewCell
            cellT.senhaTeclado.image = UIImage(named:imageTeclado[indexPath.row])
            return cellT
        }else{
            let cellS:SenhaColocarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageSenha", for: indexPath) as! SenhaColocarCollectionViewCell
            if imageSenha.count > 0{
                cellS.senhaColocar.image = UIImage(named:imageSenha[indexPath.row])
            return cellS
            }else{
                return cellS
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.tecladoSenhas{
            let cellT = collectionView.cellForItem(at: indexPath)
            cellT?.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            cellT?.layer.borderWidth = 0
            self.codigoacesso.text = ""
            if imageSenha.count != 3 {
                imageSenha.append(imageTeclado[indexPath.row])
                senha.append(imageTeclado.index(of: imageTeclado[indexPath.row])! + 1)
                quadroSenha.reloadData()
                continuar.isEnabled = false
                continuar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
                continuar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)}
            if imageSenha.count == 3 && senhaprofessora.contains(String(senha[0])+String(senha[1])+String(senha[2])){
                continuar.isEnabled = true
                senhaenviar = String(senha[0]) + String(senha[1]) + String(senha[2])
                continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
                continuar.setTitleColor(UIColor.black, for: .normal)}
            if imageSenha.count > 0 {
                apagar.isEnabled = true
                apagar.setTitleColor(UIColor.black, for: .normal)
                apagar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)}
            if imageSenha.count == 0{
                apagar.isEnabled = false
                apagar.backgroundColor = UIColor(displayP3Red: 130/255, green: 214/255, blue: 60/255, alpha: 1)
                apagar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)}
            }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.tecladoSenhas{
        let cellT = collectionView.cellForItem(at: indexPath)
        cellT?.backgroundColor = #colorLiteral(red: 0.5098039216, green: 0.8392156863, blue: 0.2352941176, alpha: 1)
            cellT?.layer.borderWidth = 0}}
        
        @IBAction func voltar(_ sender: UIButton) {
            dismiss(animated: false, completion: nil)}
    
    @IBAction func apagar(_ sender: UIButton) {
        if imageSenha.count > 0{
        imageSenha.removeLast()
        quadroSenha.reloadData()
        senha.removeLast()
        continuar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
        continuar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)
            if imageSenha.count == 0{
                apagar.backgroundColor = UIColor(displayP3Red: 191/255, green: 247/255, blue: 197/255, alpha: 1)
                apagar.isEnabled = false
                apagar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)
                self.codigoacesso.text = "Insira o código"
                
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let enviarnome = segue.destination as! TutorialViewController
        
        let enviaravatar = segue.destination as! TutorialViewController
        let enviarsenhaenviar = segue.destination as! TutorialViewController
        enviarsenhaenviar.senha = senhaenviar
        
        enviaravatar.avatar = avatar
        
        enviarnome.aluno = aluno
        
        if pontosarray.count > 0 {
            
            let enviarpontosarray = segue.destination as! TutorialViewController
            
            enviarpontosarray.pontosarray = pontosarray
            
            let enviaracertosarray = segue.destination as! TutorialViewController
            
            enviaracertosarray.acertosarray = acertosarray
            
            let enviarerrosarray = segue.destination as! TutorialViewController
            
            enviarerrosarray.errosarray = errosarray
            
            
            
        }
        
}
}



