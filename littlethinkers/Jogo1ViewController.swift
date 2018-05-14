//
//  Jogo1ViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit
import QuartzCore
// 34 519 75 0
class Jogo1ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var timernumero = Timer()
    var segundos = 31
    let tempo = UILabel.init()
    var pontonumerico = 0
    var acertos = 0
    var erros = 0
    var bonus = 1
    var verificador = Bool()
    let pontos = UILabel.init()
    @IBOutlet weak var gridponto: UILabel!
    @IBOutlet weak var timer: UIImageView!
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
    
    var formacorcorrect = ["circuloamarelocorrect", "circuloazulcorrect","circulobluecorrect","circulolaracorrect","circulolimacorrect","circulorosacorrect","circuloverdecorrect","circulovermelhocorrect","quadradoamarelocorrect","quadradoazulcorrect","quadradobluecorrect","quadradolaracorrect","quadradolimacorrect","quadradorosacorrect","quadradoverdecorrect","quadradovermelhocorrect","trianguloamarelocorrect","trianguloazulcorrect","triangulobluecorrect","triangulolaracorrrect","triangulolimacorrect","triangulorosacorrect","trianguloverdecorrect","triangulovermelhocorrect","trapezioamarelocorrect","trapezioazulcorrect","trapeziobluecorrect","trapeziolaracorrect","trapeziolimacorrect","trapeziorosacorrect","trapezioverdecorrect","trapeziovermelhocorrect"]
    
    var formacorcross = ["circuloamarelocross", "circuloazulcross","circulobluecross","circulolaracross","circulolimacross","circulorosacross","circuloverdecross","circulovermelhocross","quadradoamarelocross","quadradoazulcross","quadradobluecross","quadradolaracross","quadradolimacross","quadradorosacross","quadradoverdecross","quadradovermelhocross","trianguloamarelocross", "trianguloazulcross","triangulobluecross","triangulolaracorss","triangulolimacross","triangulorosacross","trianguloverdecross","triangulovermelhocross","trapezioamarelocross", "trapezioazulcross","trapeziobluecross","trapeziolaracross","trapeziolimacross","trapeziorosacross","trapezioverdecross","trapeziovermelhocross"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dicas.layer.cornerRadius = dicas.bounds.width*0.1
        dicas.layer.borderColor = UIColor.red.cgColor
        dicas.layer.borderWidth = 1.0
        quadrocondicao.delegate = self
        quadrocondicao.dataSource = self
        quadrojogo.delegate = self
        quadrojogo.dataSource = self
        gridponto.layer.borderColor = UIColor.red.cgColor
        gridponto.layer.borderWidth = 1.0
        tempo.frame = CGRect(x: 67, y: 79, width: 40, height: 42)
        tempo.font = UIFont.init(name:"confortaa-bold", size: 25)
        tempo.textAlignment = .center
        tempo.textColor = UIColor(displayP3Red: 62/255, green: 255/255, blue: 109/255, alpha: 1)
        timernumero = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Jogo1ViewController.iniciodojogo), userInfo: nil, repeats: true)
        pontos.frame = CGRect(x: 30, y: 519, width: 75, height: 0)
        pontos.backgroundColor = UIColor(patternImage: UIImage(named: "points-bar")!)
        self.view.addSubview(pontos)
        self.view.addSubview(tempo)
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
        var verificador0 = true
        let formacerta0 = condicaoimages[0] + condicaoimages[2]
        for x in jogoimages{
            if formacerta0 == x{
                verificador0 = false
                break}
        }
        if verificador0 == true{
            while verificador0 == true{
                jogoimages = []
                let formacorrandom = formacor.shuffled()
                for x in formacorrandom[0..<24]{
                    jogoimages.append(x)}
                for x in jogoimages{
                    if formacerta0 == x{
                        verificador0 = false
                        break}
                }}}
        
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
            let formacerta = condicaoimages[0] + condicaoimages[2]
            var novacell = formacor[Int(arc4random_uniform(UInt32(formacor.count)))]
            let posicao  = jogoimages.index(of: jogoimages[indexPath.row])!
            let formaerrada = jogoimages[indexPath.row]
            verificador = true
            if condicaoimages[1] == "e"{
                if jogoimages[indexPath.row] == formacerta{
                    pontonumerico = pontonumerico + 1
                    acertos = acertos + 1
                    var altura = pontonumerico*40
                    if altura > 400{
                        altura = 400
                    }
                    if altura < 0{
                        altura = 0
                    }
                    pontos.frame = CGRect(x: 30, y: 519, width: 80, height: Int(-altura))
                    var certo = formacerta + "correct"
                    jogoimages.remove(at: posicao)
                    jogoimages.insert(certo, at: posicao)
                    tempo.text = String(Int(tempo.text!)! + bonus)
                    if Int(tempo.text!)! + bonus > 30{
                        tempo.text = String(30)
                    }
                    bonus = bonus + 1
                    if bonus > 3{
                        bonus = 3
                    }
                    quadrojogo.reloadData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.jogoimages.remove(at: posicao)
                        while self.garantir(cell: novacell, ary: self.jogoimages) == false {
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                        self.jogoimages.insert(novacell, at: posicao)
                        for x in self.jogoimages{
                            if formacerta == x{
                                self.verificador = false
                                break}
                        }
                        if self.verificador == true{
                            while self.self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.self.formacor.shuffled()
                                for x in formacorrandom[0..<24]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                    if formacerta == x{
                                        self.self.verificador = false
                                        break}
                            }}
                            self.quadrojogo.reloadData()}
                    }}
                else{
                    pontonumerico = pontonumerico - 1
                    if pontonumerico < 0{
                        pontonumerico = 0
                    }
                    erros = erros + 1
                    var altura = pontonumerico*40
                    if altura > 400{
                        altura = 400
                    }
                    if altura < 0{
                        altura = 0
                    }
                    pontos.frame = CGRect(x: 30, y: 519, width: 80, height: Int(-altura))
                    var errado = formaerrada + "cross"
                    jogoimages.remove(at: posicao )
                    jogoimages.insert(errado, at: posicao )
                    tempo.text = String(Int(tempo.text!)! - 1)
                    if Int(tempo.text!)! < 0{
                        tempo.text = String(0)
                    }
                    bonus = 1
                    quadrojogo.reloadData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                        self.jogoimages.remove(at: posicao)
                        while self.garantir(cell: novacell, ary: self.jogoimages) == false {
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                        self.jogoimages.insert(novacell, at: posicao)
                        for x in self.jogoimages{
                        if formacerta == x{
                            self.verificador = false}
                    }
                        if self.verificador == true{
                            while self.verificador == true{
                            self.jogoimages = []
                                let formacorrandom = self.self.formacor.shuffled()
                            for x in formacorrandom[0..<24]{
                                self.jogoimages.append(x)}
                                for x in self.self.jogoimages{
                                if formacerta == x{
                                    self.verificador = false
                                    break}
                            }}
                            }
                        self.quadrojogo.reloadData()
                }
                }}
            else{
                var condi1 = 0
                var condi2 = 0
                var condi3 = 0
                var facilitador = String(jogoimages[indexPath.row])
                if (facilitador == formacerta){
                    condi1 = 1}
                if facilitador.contains(condicaoimages[0]) {
                    condi2 = 1 }
                if facilitador.contains(condicaoimages[2]) {
                    condi3 = 1 }
                if (condi1 | condi2 | condi3) == 1{
                    pontonumerico = pontonumerico + 1
                    acertos = acertos + 1
                    var altura = pontonumerico*40
                    if altura > 400{
                        altura = 400
                    }
                    if altura < 0{
                        altura = 0
                    }
                    pontos.frame = CGRect(x: 30, y: 519, width: 80, height: Int(-altura))
                    var certo = formacerta + "correct"
                    jogoimages.remove(at: posicao)
                    jogoimages.insert(certo, at: posicao)
                    quadrojogo.reloadData()
                    tempo.text = String(Int(tempo.text!)! + bonus)
                    if Int(tempo.text!)! + bonus > 30{
                        tempo.text = String(30)
                    }
                    bonus = bonus + 1
                    if bonus > 3{
                        bonus = 3
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        self.jogoimages.remove(at: posicao)
                        while self.garantir(cell: novacell, ary: self.jogoimages) == false {
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                        self.jogoimages.insert(novacell, at: posicao)
                        self.verificador = true
                        for x in self.jogoimages{
                            if  x.contains(self.self.condicaoimages[0]){
                                self.self.verificador = false}
                            if  x.contains(self.condicaoimages[2]){
                                self.verificador = false}
                            }
                        if self.self.verificador == true{
                            while self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.formacor.shuffled()
                                for x in formacorrandom[0..<24]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                if formacerta == x{
                                    self.verificador = false
                                        break}
                            }
                        }
                        }
                        self.quadrojogo.reloadData()
                    }
                    
                    }
                else{
                    pontonumerico = pontonumerico - 1
                    if pontonumerico < 0{
                        pontonumerico = 0
                    }
                    erros = erros + 1
                    var altura = pontonumerico*40
                    if altura > 400{
                        altura = 400
                    }
                    if altura < 0{
                        altura = 0
                    }
                    pontos.frame = CGRect(x: 30, y: 519, width: 80, height: Int(-altura))
                    var errado = formaerrada + "cross"
                    jogoimages.remove(at: posicao )
                    jogoimages.insert(errado, at: posicao )
                    tempo.text = String(Int(tempo.text!)! - 1)
                    if Int(tempo.text!)! < 0{
                        tempo.text = String(0)
                    }
                    bonus = 1
                    quadrojogo.reloadData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                        self.jogoimages.remove(at: posicao )
                        while self.garantir(cell: novacell, ary: self.jogoimages) == false{
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                        self.jogoimages.insert(novacell, at: posicao )
                        self.verificador = true
                        for x in self.jogoimages{
                            if  x.contains(self.condicaoimages[0]){
                                self.self.verificador = false}
                            if  x.contains(self.condicaoimages[2]){
                                self.verificador = false}
                        }
                        if self.self.verificador == true{
                            while self.self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.formacor.shuffled()
                                for x in formacorrandom[0..<24]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                    if formacerta == x{
                                        self.verificador = false
                                        break}
                            }}
                        }
                        self.quadrojogo.reloadData()}
        }
}
}
}
    @objc func iniciodojogo(){
        segundos -= 1
        tempo.text = String(segundos)
        if segundos == 0{
            timernumero.invalidate()}
        }
    func garantir(cell:String, ary:Array<String>)-> Bool{
        for x in ary{
            if x == cell {
                return false}}
        return true}
    }


