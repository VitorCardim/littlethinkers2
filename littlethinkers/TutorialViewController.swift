//
//  TutorialViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var melhopont: UILabel!
    @IBOutlet weak var comojogar: UILabel!
    @IBOutlet weak var quadroTutorial: UICollectionView!
    @IBOutlet weak var continuar: UIButton!
    var avatar = Int()
    var aluno = String()
    var imageTu = [String]()
    var pontosarray = Array<Int>()
    var acertosarray = Array<Int>()
    var errosarray = Array<Int>()
    var formas = ["triangulo", "circulo", "trapezio", "quadrado", "losango"]
    var cores = ["rosa","verde","azul","amarelo","lima","blue","lara", "vermelho"]
    var igualimg = ["igual"]
    var condicoes = ["e","ou"]
    var formacor =    ["circuloamarelo", "circuloazul", "circuloblue", "circulolara", "circulolima", "circulorosa", "circuloverde", "circulovermelho", "quadradoamarelo", "quadradoazul", "quadradoblue", "quadradolara", "quadradolima", "quadradorosa", "quadradoverde", "quadradovermelho", "trianguloamarelo", "trianguloazul", "trianguloblue", "triangulolara", "triangulolima", "triangulorosa", "trianguloverde", "triangulovermelho", "trapezioamarelo", "trapezioazul", "trapezioblue", "trapeziolara", "trapeziolima", "trapeziorosa", "trapezioverde", "trapeziovermelho", "losangoamarelo", "losangoazul", "losangoblue", "losangolara", "losangolima", "losangorosa", "losangoverde", "losangovermelho"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.borderColor = #colorLiteral(red: 0.1188444101, green: 0.5952072539, blue: 0.2881412315, alpha: 1)
        if pontosarray.count > 0{
            melhopont.text = String(pontosarray.max()!) + " pontos"}
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        quadroTutorial.delegate = self
        quadroTutorial.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "default-opaco")!)
        var ok = false
        while ok == false{
            let randomforma = [formas[Int(arc4random_uniform(UInt32(formas.count)))],formas[Int(arc4random_uniform(UInt32(formas.count)))],formas[Int(arc4random_uniform(UInt32(formas.count)))]]
            let randomcores = [cores[Int(arc4random_uniform(UInt32(cores.count)))],cores[Int(arc4random_uniform(UInt32(cores.count)))],cores[Int(arc4random_uniform(UInt32(cores.count)))]]
            let randomcondi = [condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))],condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))],condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]]
            let formacorrandom = formacor.shuffled()
            var i = 0
            while imageTu.count != 15 && i != 3{
                imageTu.append(randomforma[i])
                if i > 1{
                    imageTu.append(condicoes[1])
                }else{imageTu.append(condicoes[i])}
                
                imageTu.append(randomcores[i])
                imageTu.append(igualimg[0])
                if (randomcondi[i] == "e"){
                    for x in formacorrandom{
                        if  x == randomforma[i] + randomcores[i]{
                            imageTu.append(x)
                        }
                    }
                    i = i + 1
                }else{
                    for x in formacorrandom{
                        if  x.contains(randomforma[i]){
                            imageTu.append(x)
                            break
                        }
                        if  x.contains(randomcores[i]){
                            imageTu.append(x)
                            break
                        }
                    }
                    i = i + 1
                }}
            if (((imageTu[4] != imageTu[9]) && (imageTu[4] != imageTu[14]) && (imageTu[9] != imageTu[14])) && (imageTu[1] != imageTu[6])){
                ok = true
            }
            else{
                ok = false
                imageTu = [String]()
            }
            
            
        }
        
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageTu.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TutorialCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageTutorial", for: indexPath) as! TutorialCollectionViewCell
        cell.image1.image = UIImage(named:imageTu[indexPath.row])
        return cell}
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let enviarnome = segue.destination as! Jogo1ViewController
        
        let enviaravatar = segue.destination as! Jogo1ViewController
        
        enviaravatar.avatar = avatar
        
        enviarnome.aluno = aluno
        
        if pontosarray.count > 0 {
            
            let enviarpontosarray = segue.destination as! Jogo1ViewController
            
            enviarpontosarray.pontosarray = pontosarray
            
            let enviaracertosarray = segue.destination as! Jogo1ViewController
            
            enviaracertosarray.acertosarray = acertosarray
            
            let enviarerrosarray = segue.destination as! Jogo1ViewController
            
            enviarerrosarray.errosarray = errosarray
            
        }
        
        
        
    }
}
    extension MutableCollection {
        /// Shuffles the contents of this collection.
        mutating func shuffle() {
            let c = count
            guard c > 1 else { return }
            
            for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
                // Change `Int` in the next line to `IndexDistance` in < Swift 4.1
                let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
                let i = index(firstUnshuffled, offsetBy: d)
                swapAt(firstUnshuffled, i)
            }
        }
    }
    
    extension Sequence {
        /// Returns an array with the contents of this sequence, shuffled.
        func shuffled() -> [Element] {
            var result = Array(self)
            result.shuffle()
            return result
        }
        
    }








