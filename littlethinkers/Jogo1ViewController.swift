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
    
    var pontosarray = Array<Int>()
    
    var acertosarray = Array<Int>()
    
    var errosarray = Array<Int>()
    
    var avatar = Int()
    
    var aluno = String()
    

    @IBOutlet weak var fimatividade: UIButton!
    @IBOutlet weak var voltarparatelasenha: UIButton!
    var tempoprofessora = Int()
    var timernumero = Timer()
    var segundos = 61
    let tempo = UILabel.init()
    var pontonumerico = 0
    var acertos = Int()
    var erros = Int()
    var bonus = 1
    var verificador = Bool()
    let pontos = UILabel.init()
    @IBOutlet weak var gridponto: UILabel!
    @IBOutlet weak var quadrojogo: UICollectionView!
    @IBOutlet weak var quadrocondicao: UICollectionView!
    var dificuldade = "1"
    var condicaoimages = [String]()
    var jogoimages = [String]()
    //Possibilidades e Arrays bases
    var condicoes = ["e","ou"]
    var formas = ["triangulo","circulo","trapezio","quadrado", "losango"]
    var cores = ["rosa","verde","azul","amarelo", "lima","blue","lara","vermelho"]
    var igualimg = ["igual"]
    var formacor =    ["circuloamarelo", "circuloazul", "circuloblue", "circulolara", "circulolima", "circulorosa", "circuloverde", "circulovermelho", "quadradoamarelo", "quadradoazul", "quadradoblue", "quadradolara", "quadradolima", "quadradorosa", "quadradoverde", "quadradovermelho", "trianguloamarelo", "trianguloazul", "trianguloblue", "triangulolara", "triangulolima", "triangulorosa", "trianguloverde", "triangulovermelho", "trapezioamarelo", "trapezioazul", "trapezioblue", "trapeziolara", "trapeziolima", "trapeziorosa", "trapezioverde", "trapeziovermelho", "losangoamarelo", "losangoazul", "losangoblue", "losangolara", "losangolima", "losangorosa", "losangoverde", "losangovermelho"]
    
    var formacorcorrect = ["circuloamarelocorrect", "circuloazulcorrect","circulobluecorrect","circulolaracorrect","circulolimacorrect","circulorosacorrect","circuloverdecorrect","circulovermelhocorrect","quadradoamarelocorrect","quadradoazulcorrect","quadradobluecorrect","quadradolaracorrect","quadradolimacorrect","quadradorosacorrect","quadradoverdecorrect","quadradovermelhocorrect","trianguloamarelocorrect","trianguloazulcorrect","triangulobluecorrect","triangulolaracorrrect","triangulolimacorrect","triangulorosacorrect","trianguloverdecorrect","triangulovermelhocorrect","trapezioamarelocorrect","trapezioazulcorrect","trapeziobluecorrect","trapeziolaracorrect","trapeziolimacorrect","trapeziorosacorrect","trapezioverdecorrect", "trapeziovermelhocorrect", "losangoamarelocorrect", "losangoazulcorrect", "losangobluecorrect", "losangolaracorrect", "losangolimacorrect", "losangorosacorrect", "losangoverdecorrect", "losangovermelhocorrect"]
    
    var formacorcross = ["circuloamarelocross", "circuloazulcross","circulobluecross","circulolaracross","circulolimacross","circulorosacross","circuloverdecross","circulovermelhocross","quadradoamarelocross","quadradoazulcross","quadradobluecross","quadradolaracross","quadradolimacross","quadradorosacross","quadradoverdecross","quadradovermelhocross","trianguloamarelocross", "trianguloazulcross","triangulobluecross","triangulolaracorss","triangulolimacross","triangulorosacross","trianguloverdecross","triangulovermelhocross","trapezioamarelocross", "trapezioazulcross","trapeziobluecross","trapeziolaracross","trapeziolimacross","trapeziorosacross","trapezioverdecross","trapeziovermelhocross", "losangoamarelocross", "losangoazulcross", "losangobluecross", "losangolaracross", "losangolimacross", "losangorosacross", "losangoverdecross", "losangovermelhocross"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempoprofessora = 10
        quadrocondicao.delegate = self
        quadrocondicao.dataSource = self
        quadrojogo.delegate = self
        quadrojogo.dataSource = self
        gridponto.layer.borderColor = UIColor.red.cgColor
        gridponto.layer.borderWidth = 1.0
        tempo.frame = CGRect(x: 10, y: 140, width: 45, height: 45)
        tempo.font = UIFont.init(name:"confortaa-bold", size: 45)
        tempo.textAlignment = .center
        tempo.textColor = UIColor.black
        timernumero = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Jogo1ViewController.iniciodojogo), userInfo: nil, repeats: true)
        pontos.frame = CGRect( x: 11 , y: 649 , width: 43, height: 0)
        pontos.backgroundColor = UIColor(displayP3Red: 193/255, green: 255/255, blue: 151/255, alpha: 1)
        self.view.addSubview(pontos)
        self.view.addSubview(tempo)
        let randomforma = formas[Int(arc4random_uniform(UInt32(formas.count)))]
        let randomcores = cores[Int(arc4random_uniform(UInt32(cores.count)))]
        let randomcondi = condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]
        condicaoimages.append(randomforma)
        condicaoimages.append(randomcondi)
        condicaoimages.append(randomcores)
        
        let formacorrandom = formacor.shuffled()
        
        for x in formacorrandom[0..<28]{
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
                for x in formacorrandom[0..<28]{
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
        return condicaoimages.count
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
            var novacell = formacor[Int(arc4random_uniform(UInt32(formacor.count)))]
            let posicao  = jogoimages.index(of: jogoimages[indexPath.row])!
            var formaerrada = jogoimages[indexPath.row]
            verificador = true
            if condicaoimages[1] == "e" && dificuldade == "1"{
                if jogoimages[indexPath.row] == formacerta{
                    pontonumerico = pontonumerico + 1
                    if pontonumerico > 20 {
                        pontonumerico = 0
                        dificuldade = "2"
                    }
                    acertos = acertos + 1
                    var altura = pontonumerico*((510)/20)
                    pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                    var certo = formacerta + "correct"
                    jogoimages.remove(at: posicao)
                    jogoimages.insert(certo, at: posicao)
                    quadrojogo.reloadData()
                    segundos = Int(tempo.text!)! + bonus
                    if segundos > 60{
                        segundos = 60}
                    tempo.text = String(segundos)
                    bonus = bonus + 1
                    if bonus > 3{
                        bonus = 3
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        let randomforma = self.formas[Int(arc4random_uniform(UInt32(self.formas.count)))]
                        let randomcores = self.cores[Int(arc4random_uniform(UInt32(self.cores.count)))]
                        var randomcondi = self.condicoes[Int(arc4random_uniform(UInt32(self.condicoes.count)))]
                        if self.dificuldade == "1"{
                            randomcondi = "e"
                        }
                        self.condicaoimages = []
                        self.condicaoimages.append(randomforma)
                        self.condicaoimages.append(randomcondi)
                        self.condicaoimages.append(randomcores)
                        self.quadrocondicao.reloadData()
                        formacerta = self.condicaoimages[0] + self.condicaoimages[2]
                        while self.verificador == true{
                            self.jogoimages = []
                            let formacorrandom = self.formacor.shuffled()
                            for x in formacorrandom[0..<28]{
                                self.jogoimages.append(x)}
                            for x in self.jogoimages{
                                if formacerta == x{
                                    self.verificador = false
                                    self.quadrojogo.reloadData()
                                    break}}}
                    }
                }
                else{
                    pontonumerico = pontonumerico - 1
                    if pontonumerico < 0{
                        pontonumerico = 0   }
                    erros = erros + 1
                    var altura = pontonumerico*((510)/20)
                    pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                    var errado = formaerrada + "cross"
                    jogoimages.remove(at: posicao)
                    jogoimages.insert(errado, at: posicao )
                    segundos = Int(tempo.text!)! - 1
                    if segundos <= 0{
                        segundos = 0}
                    tempo.text = String(segundos)
                    bonus = 1
                    quadrojogo.reloadData()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        self.jogoimages.remove(at: posicao)
                        novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]
                        while self.garantir(cell: novacell, ary: self.jogoimages) == false {
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                        self.jogoimages.insert(novacell, at: posicao)
                        self.quadrojogo.reloadData()
                    }
                    
                }
            }
            
            if condicaoimages[1] == "ou" && dificuldade == "1"{
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
                        let randomforma = formas[Int(arc4random_uniform(UInt32(formas.count)))]
                        let randomcores = cores[Int(arc4random_uniform(UInt32(cores.count)))]
                        let randomcondi = condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]
                        condicaoimages = []
                        condicaoimages.append(randomforma)
                        condicaoimages.append(randomcondi)
                        condicaoimages.append(randomcores)
                        quadrocondicao.reloadData()
                        pontonumerico = pontonumerico + 1
                        if pontonumerico > 20 {
                            pontonumerico = 0
                            dificuldade = "2"}
                        acertos = acertos + 1
                        var altura = pontonumerico*((510)/20)
                        pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                        formacerta = jogoimages[posicao]
                        var certo = formacerta + "correct"
                        jogoimages.remove(at: posicao)
                        jogoimages.insert(certo, at: posicao)
                        quadrojogo.reloadData()
                        segundos = Int(tempo.text!)! + bonus
                        if segundos > 60{
                            segundos = 60
                        }
                        bonus = bonus + 1
                        if bonus > 3{
                            bonus = 3
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                            self.jogoimages.remove(at: posicao)
                            let randomforma = self.formas[Int(arc4random_uniform(UInt32(self.formas.count)))]
                            let randomcores = self.cores[Int(arc4random_uniform(UInt32(self.cores.count)))]
                            var randomcondi = self.condicoes[Int(arc4random_uniform(UInt32(self.condicoes.count)))]
                            if self.dificuldade == "1"{
                                randomcondi = "ou"
                            }
                            self.condicaoimages = []
                            self.condicaoimages.append(randomforma)
                            self.condicaoimages.append(randomcondi)
                            self.condicaoimages.append(randomcores)
                            self.quadrocondicao.reloadData()
                            formacerta = self.condicaoimages[0] + self.condicaoimages[2]
                            while self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.formacor.shuffled()
                                for x in formacorrandom[0..<28]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                    if formacerta == x{
                                        self.verificador = false
                                        self.quadrojogo.reloadData()
                                        break}}}}
                        self.quadrojogo.reloadData()
                    }
                    else{
                        pontonumerico = pontonumerico - 1
                        if pontonumerico < 0{
                            pontonumerico = 0
                        }
                        erros = erros + 1
                        var altura = pontonumerico*((510)/20)
                        pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                        formaerrada = jogoimages[posicao]
                        var errado = formaerrada + "cross"
                        jogoimages.remove(at: posicao )
                        jogoimages.insert(errado, at: posicao )
                        segundos = Int(tempo.text!)! - 1
                        if segundos <= 0{
                            segundos = 0}
                        tempo.text = String(segundos)
                        bonus = 1
                        quadrojogo.reloadData()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                            self.jogoimages.remove(at: posicao )
                            novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]
                            while self.garantir(cell: novacell, ary: self.jogoimages) == false{
                                novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                            self.jogoimages.insert(novacell, at: posicao )
                            for x in self.jogoimages{
                                if  x.contains(self.condicaoimages[0]){
                                    self.self.verificador = false}
                                if  x.contains(self.condicaoimages[2]){
                                    self.verificador = false}
                            }
                            while self.self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.formacor.shuffled()
                                for x in formacorrandom[0..<28]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                    if formacerta == x{
                                        self.verificador = false
                                        break}
                                }}
                            self.quadrojogo.reloadData()}}}

                if condicaoimages[1] == "e" && dificuldade == "2"{
                    if jogoimages[indexPath.row] == formacerta{
                        pontonumerico = pontonumerico + 1
                        if pontonumerico > 300 {
                            pontonumerico = 300
                        }
                        acertos = acertos + 1
                        var altura = pontonumerico*((510)/200)
                        pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                        var certo = formacerta + "correct"
                        jogoimages.remove(at: posicao)
                        jogoimages.insert(certo, at: posicao)
                        quadrojogo.reloadData()
                        segundos = Int(tempo.text!)! + bonus
                        if segundos > 60{
                            segundos = 60}
                        tempo.text = String(segundos)
                        bonus = bonus + 1
                        if bonus > 3{
                            bonus = 3
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            let randomforma = self.formas[Int(arc4random_uniform(UInt32(self.formas.count)))]
                            let randomcores = self.cores[Int(arc4random_uniform(UInt32(self.cores.count)))]
                            let randomcondi = self.condicoes[Int(arc4random_uniform(UInt32(self.condicoes.count)))]
                            self.condicaoimages = []
                            self.condicaoimages.append(randomforma)
                            self.condicaoimages.append(randomcondi)
                            self.condicaoimages.append(randomcores)
                            self.quadrocondicao.reloadData()
                            formacerta = self.condicaoimages[0] + self.condicaoimages[2]
                            while self.verificador == true{
                                self.jogoimages = []
                                let formacorrandom = self.formacor.shuffled()
                                for x in formacorrandom[0..<28]{
                                    self.jogoimages.append(x)}
                                for x in self.jogoimages{
                                    if formacerta == x{
                                        self.verificador = false
                                        self.quadrojogo.reloadData()
                                        break}}}
                        }
                    }
                        else{
                            pontonumerico = pontonumerico - 1
                            if pontonumerico < 0{
                                pontonumerico = 0   }
                            erros = erros + 1
                            var altura = pontonumerico*((510)/200)
                            pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                            var errado = formaerrada + "cross"
                            jogoimages.remove(at: posicao)
                            jogoimages.insert(errado, at: posicao )
                            segundos = Int(tempo.text!)! - 1
                            if segundos <= 0{
                                segundos = 0}
                            tempo.text = String(segundos)
                            bonus = 1
                            quadrojogo.reloadData()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                self.jogoimages.remove(at: posicao)
                                novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]
                                while self.garantir(cell: novacell, ary: self.jogoimages) == false {
                                    novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                                self.jogoimages.insert(novacell, at: posicao)
                                self.quadrojogo.reloadData()
                            }
                            
                        }
                    }
                    
                    if condicaoimages[1] == "ou" && dificuldade == "2"{
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
                            let randomforma = formas[Int(arc4random_uniform(UInt32(formas.count)))]
                            let randomcores = cores[Int(arc4random_uniform(UInt32(cores.count)))]
                            let randomcondi = condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]
                            condicaoimages = []
                            condicaoimages.append(randomforma)
                            condicaoimages.append(randomcondi)
                            condicaoimages.append(randomcores)
                            quadrocondicao.reloadData()
                            pontonumerico = pontonumerico + 1
                            if pontonumerico > 300 {
                                pontonumerico = 300
                            }
                            acertos = acertos + 1
                            var altura = pontonumerico*((510)/200)
                            pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                            formacerta = jogoimages[posicao]
                            var certo = formacerta + "correct"
                            jogoimages.remove(at: posicao)
                            jogoimages.insert(certo, at: posicao)
                            quadrojogo.reloadData()
                            segundos = Int(tempo.text!)! + bonus
                            if segundos > 60{
                                segundos = 60
                            }
                            bonus = bonus + 1
                            if bonus > 3{
                                bonus = 3
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                self.jogoimages.remove(at: posicao)
                                let randomforma = self.formas[Int(arc4random_uniform(UInt32(self.formas.count)))]
                                let randomcores = self.cores[Int(arc4random_uniform(UInt32(self.cores.count)))]
                                let randomcondi = self.condicoes[Int(arc4random_uniform(UInt32(self.condicoes.count)))]
                                self.condicaoimages = []
                                self.condicaoimages.append(randomforma)
                                self.condicaoimages.append(randomcondi)
                                self.condicaoimages.append(randomcores)
                                self.quadrocondicao.reloadData()
                                formacerta = self.condicaoimages[0] + self.condicaoimages[2]
                                while self.verificador == true{
                                    self.jogoimages = []
                                    let formacorrandom = self.formacor.shuffled()
                                    for x in formacorrandom[0..<28]{
                                        self.jogoimages.append(x)}
                                    for x in self.jogoimages{
                                        if formacerta == x{
                                            self.verificador = false
                                            self.quadrojogo.reloadData()
                                            break}}}}
                            self.quadrojogo.reloadData()
                        }
                            else{
                                pontonumerico = pontonumerico - 1
                                if pontonumerico < 0{
                                    pontonumerico = 0
                                }
                                erros = erros + 1
                                var altura = pontonumerico*((510)/200)
                                pontos.frame = CGRect(x: 11, y: 649, width: 43, height: Int(-altura))
                                formaerrada = jogoimages[posicao]
                                var errado = formaerrada + "cross"
                                jogoimages.remove(at: posicao )
                                jogoimages.insert(errado, at: posicao )
                                segundos = Int(tempo.text!)! - 1
                                if segundos <= 0{
                                    segundos = 0}
                                tempo.text = String(segundos)
                                bonus = 1
                                quadrojogo.reloadData()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                    self.jogoimages.remove(at: posicao )
                                    novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]
                                    while self.garantir(cell: novacell, ary: self.jogoimages) == false{
                                        novacell = self.formacor[Int(arc4random_uniform(UInt32(self.formacor.count)))]}
                                    self.jogoimages.insert(novacell, at: posicao )
                                    for x in self.jogoimages{
                                        if  x.contains(self.condicaoimages[0]){
                                            self.self.verificador = false}
                                        if  x.contains(self.condicaoimages[2]){
                                            self.verificador = false}
                                    }
                                    while self.self.verificador == true{
                                        self.jogoimages = []
                                        let formacorrandom = self.formacor.shuffled()
                                        for x in formacorrandom[0..<28]{
                                            self.jogoimages.append(x)}
                                        for x in self.jogoimages{
                                            if formacerta == x{
                                                self.verificador = false
                                                break}
                                        }}
                                    self.quadrojogo.reloadData()}}}}}


    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        var pontos = (acertos - erros)*10
        
        if pontos < 0 {
            
            pontos = 0
            
        }
        
        acertosarray.append(acertos)
        errosarray.append(erros)
        pontosarray.append(pontos)
        if tempoprofessora != 0{
        let enviarpontosarray = segue.destination as! SenhaViewController
        enviarpontosarray.pontosarray = pontosarray
        let enviaracertosarray = segue.destination as! SenhaViewController
        enviaracertosarray.acertosarray = acertosarray
        let enviarerrosarray = segue.destination as! SenhaViewController
        enviarerrosarray.errosarray = errosarray}
        else{
        if acertos >= 100{
            let enviarpontosarray1 = segue.destination as! FimAtividadeTrofeusViewController
            enviarpontosarray1.pontosarray = pontosarray
            let enviaracertosarray1 = segue.destination as! FimAtividadeTrofeusViewController
            enviaracertosarray1.acertosarray = acertosarray
            let enviarerrosarray1 = segue.destination as! FimAtividadeTrofeusViewController
            enviarerrosarray1.errosarray = errosarray}
        
        }}
    
    @objc func iniciodojogo(){
        
        segundos -= 1
        
        tempo.text = String(segundos)
        
        if acertos >= 100 {
            tempoprofessora = 0
            self .performSegue(withIdentifier: "fim", sender: self)
            
        }
        
        
        
        if segundos <= 0{
            
            timernumero.invalidate()
            
            self .performSegue(withIdentifier: "voltarsenha", sender: self)
            
        }
        
    }
    
    func garantir(cell:String, ary:Array<String>)-> Bool{
        for x in ary{
            if x == cell {
                return false}}
        return true}


    }



