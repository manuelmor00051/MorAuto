//
//  CollectionViewViewController.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 4/12/21.
//

import UIKit

class CollectionViewViewController: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView?
    private var motos = Motos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Motos"
        
        motos.append(contentsOf: MotoRepository().motos)
        
        collectionview?.dataSource = self
        collectionview?.delegate = self
        
    }
}

extension CollectionViewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return motos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MotoCell", for: indexPath) as! MotoCell
        if motos.count > indexPath.row {
            let moto = motos[indexPath.row]
            cell.motoViews(image: moto.image, marca: moto.marca, model: moto.model, value: moto.value)
        }
        
        return cell
    }
}

extension CollectionViewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if motos.count > indexPath.row {
            let moto = motos[indexPath.row]
            let storyBoardDescription = UIStoryboard(name: "DescriptionView", bundle: nil)
            
            if let destination = storyBoardDescription.instantiateInitialViewController() as? DescriptionViewController {
                destination.insertDates(image: moto.image, description: moto.description, type: .moto)
                self.navigationController?.pushViewController(destination, animated: true)
            }
        }
    }
}
