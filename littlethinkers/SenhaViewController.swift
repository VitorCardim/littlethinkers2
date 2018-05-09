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
    var imageTeclado = [ "CRAzul","TRAzul","QDAzul","TRRosa","QDRosa","CRRosa","CRVerm","TRVerm","QDVerm"]
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
            if imageSenha.count != 3 {
            imageSenha.append(imageTeclado[indexPath.row])
                quadroSenha.reloadData()}
            if imageSenha.count == 3{
                continuar.isEnabled = true
                continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
                continuar.setTitleColor(UIColor.black, for: .normal)
            }else{
                continuar.isEnabled = false
                continuar.backgroundColor = UIColor(displayP3Red: 128/255, green: 165/255, blue: 132/255, alpha: 1)
                continuar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)}
            if imageSenha.count > 0 {
                apagar.isEnabled = true
                apagar.setTitleColor(UIColor.black, for: .normal)
                apagar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
            }else{
                apagar.isEnabled = false
                apagar.backgroundColor = UIColor(displayP3Red: 130/255, green: 214/255, blue: 60/255, alpha: 1)}
                apagar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)
            }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.tecladoSenhas{
        let cellT = collectionView.cellForItem(at: indexPath)
        cellT?.backgroundColor = UIColor(displayP3Red: 130/255, green: 214/255, blue: 60/255, alpha: 1)
            cellT?.layer.borderWidth = 0}}
        
        @IBAction func voltar(_ sender: UIButton) {
            dismiss(animated: false, completion: nil)}
    
    @IBAction func apagar(_ sender: UIButton) {
        if imageSenha.count > 0{
        imageSenha.removeLast()
        quadroSenha.reloadData()
            if imageSenha.count == 0{
                apagar.backgroundColor = UIColor(displayP3Red: 128/255, green: 165/255, blue: 132/255, alpha: 1)
                apagar.isEnabled = false
                apagar.setTitleColor(UIColor(red:0.50, green:0.65, blue:0.52, alpha:1.0), for: .normal)
                
            }
        }}
}





