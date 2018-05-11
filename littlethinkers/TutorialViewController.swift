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
    var imageTu = ["tri-tra","correct","splash-azul","cross","TRAzul","ret-tra","correct","splash-verm","cross","QDVerm","ret-tra","correct","splash-verd","cross","QDVerd"]
    override func viewDidLoad() {
        super.viewDidLoad()
        continuar.layer.cornerRadius = continuar.bounds.height / 2
        quadroTutorial.delegate = self
        quadroTutorial.dataSource = self
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "default-opaco")!)
        
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



