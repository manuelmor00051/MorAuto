//
//  MotoCell.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 5/12/21.
//

import UIKit

class MotoCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var motoImage: UIImageView?
    @IBOutlet weak var motoMarca: UILabel?
    @IBOutlet weak var motoModel: UILabel?
    @IBOutlet weak var price: UILabel?
    @IBOutlet weak var motoValue: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        motoImage?.image = nil
        motoMarca?.text = nil
        motoModel?.text = nil
        price?.text = nil
        motoValue?.text = nil
        
    }
    
    func motoViews(image: String? = nil, marca: String? = nil, model: String? = nil, value: String? = nil) {
        motoImage?.image = UIImage(named: image ?? "")
        motoMarca?.text = marca
        motoModel?.text = model
        price?.text = "Precio:"
        motoValue?.text = value
    }
}
