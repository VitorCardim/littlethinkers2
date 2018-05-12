//
//  TutorialViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var comojogar: UILabel!
    @IBOutlet weak var quadroTutorial: UICollectionView!
    @IBOutlet weak var continuar: UIButton!
    var imageTu = [String]()
    var condicoes = ["e","ou"]
    var formas = ["triangulo","circulo","trapezio","quadrado"]
    var cores = ["rosa","verde","azul","amarelo"]
    var igualimg = ["igual"]
    var formacor = ["circuloamarelo", "circuloazul","circuloblue","circulolara","circulolima","circulorosa","circuloverde","circulovermelho","quadradoamarelo","quadradoazul","quadradoblue","quadradolara","quadradolima","quadradorosa","quadradoverde","quadradovermelho","trianguloamarelo", "trianguloazul","trianguloblue","triangulolara","triangulolima","triangulorosa","trianguloverde","triangulovermelho","trapezioamarelo", "trapezioazul","trapezioblue","trapeziolara","trapeziolima","trapeziorosa","trapezioverde","trapeziovermelho"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        quadroTutorial.delegate = self
        quadroTutorial.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "default-opaco")!)
        let randomforma = [formas[Int(arc4random_uniform(UInt32(formas.count)))],formas[Int(arc4random_uniform(UInt32(formas.count)))],formas[Int(arc4random_uniform(UInt32(formas.count)))]]
        let randomcores = [cores[Int(arc4random_uniform(UInt32(cores.count)))],cores[Int(arc4random_uniform(UInt32(cores.count)))],cores[Int(arc4random_uniform(UInt32(cores.count)))]]
        let randomcondi = [condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))],condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))],condicoes[Int(arc4random_uniform(UInt32(condicoes.count)))]]
        let formacorrandom = formacor.shuffled()
        var i = 0
        while imageTu.count != 15 && i != 3{
            imageTu.append(randomforma[i])
            imageTu.append(randomcondi[i])
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




