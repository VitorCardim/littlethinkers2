//
//  Jogo1ViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit
import QuartzCore

class Jogo1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var alturadospontos:Int = 0
    var pontonumerico = 0
    var bonus = 1
    @IBOutlet weak var gridponto: UILabel!
    @IBOutlet weak var timer: UIImageView!
    @IBOutlet weak var pontos: UIImageView!
    @IBOutlet weak var tempo: UILabel!
    @IBOutlet weak var quadrojogo: UICollectionView!
    @IBOutlet weak var quadrocondicao: UICollectionView!
    @IBOutlet weak var dicas: UIButton!
    @IBOutlet weak var dificuldade: UILabel!
    var condicaoimages = [String]()
    var jogoimages = [String]()
    //Possibilidades e Arrays bases
    var condicoes = ["e","ou"]
    var formas = ["triangulo","circulo","trapezio","quadrado"]
    var cores = ["rosa","verde","azul","amarelo"]
    var igualimg = ["igual"]
    var formacor = ["circuloamarelo", "circuloazul","circuloblue","circulolara","circulolima","circulorosa","circuloverde","circulovermelho","quadradoamarelo","quadradoazul","quadradoblue","quadradolara","quadradolima","quadradorosa","quadradoverde","quadradovermelho","trianguloamarelo", "trianguloazul","trianguloblue","triangulolara","triangulolima","triangulorosa","trianguloverde","triangulovermelho","trapezioamarelo", "trapezioazul","trapezioblue","trapeziolara","trapeziolima","trapeziorosa","trapezioverde","trapeziovermelho"]
    

    @IBOutlet weak var teste: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempo.layer.cornerRadius = tempo.bounds.width / 2
        dicas.layer.cornerRadius = dicas.bounds.width*0.1
        quadrocondicao.delegate = self
        quadrocondicao.dataSource = self
        quadrojogo.delegate = self
        quadrojogo.dataSource = self
        gridponto.layer.borderColor = UIColor.red.cgColor
        gridponto.layer.borderWidth = 1.0
        
        let randomforma = formas[Int(arc4random_uniform(UInt32(formas.count)))]
        let randomcores = cores[Int(arc4random_uniform(UInt32(cores.count)))]
        let randomcondi = condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]
        condicaoimages.append(randomforma)
        condicaoimages.append(randomcondi)
        condicaoimages.append(randomcores)
        let formacorrandom = formacor.shuffled()
        for x in formacorrandom[0..<24]{
            jogoimages.append(x)
        }
        
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
            cellC.image1.image = UIImage(named:condicaoimages[indexPath.row])
            return cellC
            }
        
        
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.quadrojogo{
            let cellJ = collectionView.cellForItem(at: indexPath)
            var formacerta = condicaoimages[0] + condicaoimages[2]
            let novacell = formacor[Int(arc4random_uniform(UInt32(formacor.count)))]
            teste.text = "1"
            if condicaoimages[1] == "e"{
                teste.text = "2"
                if jogoimages[indexPath.row] == formacerta{
                    teste.text = "3"
                    pontonumerico = pontonumerico + 1
                    alturadospontos = alturadospontos - 40
                    //fazer barrinha subir
                    //colocar imagem com temporizador
                    var posicao  = jogoimages.index(of: jogoimages[indexPath.row])!
                    jogoimages.remove(at: posicao )
                    jogoimages.insert(novacell, at: posicao )
                    quadrojogo.reloadData()
                    tempo.text = String(Int(tempo.text!)! + bonus)
                    bonus = bonus + 1
                    for x in jogoimages{
                        if jogoimages[indexPath.row] == x{
                            break
                        }
                        else{
                            jogoimages = []
                            let formacorrandom = formacor.shuffled()
                            for x in formacorrandom[0..<24]{
                                jogoimages.append(x)
                            }
                            break
                            
                        }
                    }
                }
                else{
                    pontonumerico = pontonumerico - 1
                    alturadospontos = alturadospontos + 40
                    //fazer barrinha descer
                    //colocar imagem com temporizador
                    var posicao  = jogoimages.index(of: jogoimages[indexPath.row])!
                    jogoimages.remove(at: posicao )
                    jogoimages.insert(novacell, at: posicao )
                    quadrojogo.reloadData()
                    tempo.text = String(Int(tempo.text!)! + bonus)
                    bonus = 0
                    for x in jogoimages{
                        if jogoimages[indexPath.row] == x{
                            break
                        }
                        else{
                            jogoimages = []
                            let formacorrandom = formacor.shuffled()
                            for x in formacorrandom[0..<24]{
                                jogoimages.append(x)
                            }
                            break
                            
                        }
                    }
}
}
}
                

