//
//  TutorialViewController.swift
//  littlethinkers
//
//  Created by Vitor Cardim Menezes on 10/05/18.
//  Copyright © 2018 tet. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var quadroTutorial: UICollectionView!
    @IBOutlet weak var continuar: UIButton!
    @IBOutlet weak var sim: UIButton!
    @IBOutlet weak var nao: UIButton!
    var images = [ "boy-1","boy-2","boy-3","girl-1","girl-2","girl-3","other-1","other-2","other-3","other-1","other-2","other-3"]
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        nao.layer.cornerRadius = continuar.bounds.height / 2
        sim.layer.cornerRadius = continuar.bounds.height / 2
        quadroTutorial.delegate = self
        quadroTutorial.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sim(_ sender: UIButton) {
        continuar.isEnabled = true
        continuar.setTitleColor(UIColor.black, for: .normal)
        continuar.backgroundColor = UIColor(displayP3Red: 255/255, green: 216/255, blue: 43/255, alpha: 1)
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TutorialCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageTutorial", for: indexPath) as! TutorialCollectionViewCell
        cell.image1.image = UIImage(named:images[indexPath.row])
        return cell
    }
    
}
