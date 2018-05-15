//
//  AvaViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 08/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class AvaViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var continuar: UIButton!
    @IBOutlet weak var quadroAvatares: UICollectionView!
    @IBOutlet weak var welcome: UILabel!
    var student = ""
    var numeroAvatar = Int()
    var images = ["boy-1","boy-2","boy-3","girl-1","girl-2","girl-3","other-1","other-2","other-3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        welcome.text = "Tudo bem, \(student)?"
        quadroAvatares.delegate = self
        quadroAvatares.dataSource = self
        continuar.isEnabled = false
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func voltar(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:AvatarChoiceCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagemAvatar", for: indexPath) as! AvatarChoiceCollectionViewCell
        cell.image1.image = UIImage(named:images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
        cell?.layer.borderWidth = 0
        continuar.isEnabled = true
        continuar.setTitleColor(UIColor.black, for: .normal)
        continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
        numeroAvatar = images.index(of: images[indexPath.row])!

        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = #colorLiteral(red: 0.5098039216, green: 0.8392156863, blue: 0.2352941176, alpha: 1)
        cell?.layer.borderWidth = 0
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let enviarnome = segue.destination as! SenhaViewController
        let enviaravatar = segue.destination as! SenhaViewController
        enviaravatar.avatar = numeroAvatar
        enviarnome.aluno = student
}
}
