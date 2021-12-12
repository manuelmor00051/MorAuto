//
//  DescriptionViewController.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 6/12/21.
//

import UIKit

enum DescriptionType {
    case car
    case moto
}

class DescriptionViewController: UIViewController {
    var image: String?
    var description2: String?
    var type: DescriptionType = .car
    @IBOutlet weak var vehicleImage: UIImageView?
    @IBOutlet weak var descriptionText: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch type {
            case .car:
                self.title = "Coche"
            case .moto:
                self.title = "Moto"
        }
        
        vehicleImage?.image = UIImage(named: image ?? "")
        descriptionText?.text = description2
    }
    
    func insertDates(image: String? = nil, description: String? = nil, type: DescriptionType) {
        self.image = image
        description2 = description
        self.type = type
    }
}
