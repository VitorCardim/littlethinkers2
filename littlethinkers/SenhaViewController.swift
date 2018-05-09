//
//  SenhaViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 08/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class SenhaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var teste: UILabel!
    @IBOutlet weak var apagar: UIButton!
    @IBOutlet weak var continuar: UIButton!
    @IBOutlet weak var tecladoSenhas: UICollectionView!
    @IBOutlet weak var quadroSenha: UICollectionView!
    var imageTeclado = [ "boy-1","boy-2","boy-3","girl-1","girl-2","girl-3","other-2","other-3","sad-kitty"]
    var imageSenha = [String]()
    var senha = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quadroSenha.delegate = self
        quadroSenha.dataSource = self
        tecladoSenhas.delegate = self
        tecladoSenhas.dataSource = self
        continuar.isEnabled = false
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        apagar.isEnabled = false
        apagar.layer.cornerRadius = continuar.bounds.height / 2
        
        
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
                cellS.senhaColocar.image = UIImage(named:imageTeclado[indexPath.row])
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
        teste.text = String(imageTeclado[indexPath.row])
        imageSenha.append(imageTeclado[indexPath.row])
        quadroSenha.reloadData()
            if imageSenha.count == 3{
                continuar.setTitle("Continuar", for: .normal)
                continuar.isEnabled = true
                continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            }else{
                continuar.setTitle("", for: .normal)
                continuar.isEnabled = false
                continuar.backgroundColor = UIColor(displayP3Red: 131/255, green: 220/255, blue: 247/255, alpha: 1)}
            if imageSenha.count > 0 {
                apagar.setTitle("Apagar", for: .normal)
                apagar.isEnabled = true
                apagar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            }else{
                apagar.setTitle("", for: .normal)
                apagar.isEnabled = false
                apagar.backgroundColor = UIColor(displayP3Red: 131/255, green: 220/255, blue: 247/255, alpha: 1)}
            }
            
        
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.tecladoSenhas{
        let cellT = collectionView.cellForItem(at: indexPath)
        cellT?.backgroundColor = UIColor(displayP3Red: 131/255, green: 220/255, blue: 247/255, alpha: 1)
            cellT?.layer.borderWidth = 0}}
        
        @IBAction func voltar(_ sender: UIButton) {
            dismiss(animated: false, completion: nil)}
}




