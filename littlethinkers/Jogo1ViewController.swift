//
//  Jogo1ViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class Jogo1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var tempo: UILabel!
    @IBOutlet weak var quadrojogo: UICollectionView!
    @IBOutlet weak var quadrocondicao: UICollectionView!
    @IBOutlet weak var dicas: UIButton!
    @IBOutlet weak var dificuldade: UILabel!
    var condicaoimages = [["CRAzul","TRAzul","QDAzul","TRRosa"],["QDRosa","CRRosa","CRVerm","TRVerm"], ["boy-1","boy-2","boy-3","girl-1"],["girl-2","girl-3","other-1","other-2"]]
    var jogoimages = ["CRAzul","TRAzul","QDAzul","TRRosa","QDRosa","CRRosa","CRVerm","TRVerm","QDVerm","CRAzul","TRAzul","QDAzul","TRRosa","QDRosa","CRRosa","CRVerm","TRVerm","QDVerm","CRAzul","TRAzul","QDAzul","TRRosa","QDRosa","CRRosa","CRVerm","TRVerm","QDVerm"]
    //Possibilidades e Arrays bases
    var condicoes = ["e","ou"]
    var formastra = ["tri-tra","cir-tra","trap-tra","cir-tra"]
    var cores = ["Rosa","Verde","Azul","Amarelo"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dicas.layer.cornerRadius = dicas.bounds.width*0.8
        tempo.layer.cornerRadius = tempo.bounds.width*0.8
        quadrocondicao.delegate = self
        quadrocondicao.dataSource = self
        quadrojogo.delegate = self
        quadrojogo.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.quadrojogo{
            return 1}
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.quadrojogo{
            return jogoimages.count
        }
        return condicaoimages[0].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.quadrojogo{
            let cellJ:Jogo1JogoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageJogo", for: indexPath) as! Jogo1JogoCollectionViewCell
            cellJ.image1.image = UIImage(named:jogoimages[indexPath.row])
            return cellJ
        }else{
            let cellC:Jogo1CondicaoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCondicao", for: indexPath) as! Jogo1CondicaoCollectionViewCell
            cellC.image1.image = UIImage(named:condicaoimages[0][indexPath.row])
            return cellC
            }
}


}
