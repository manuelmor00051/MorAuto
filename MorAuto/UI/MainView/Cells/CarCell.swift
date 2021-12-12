//
//  CarCell.swift
//  MorAuto
//
//  Created by Manuel Moreno Cámara on 4/12/21.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var carImage: UIImageView?
    @IBOutlet weak var carMarca: UILabel?
    @IBOutlet weak var carModel: UILabel?
    @IBOutlet weak var price: UILabel?
    @IBOutlet weak var priceValue: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell?.layer.cornerRadius = 4.0
        viewCell?.layer.shadowColor = UIColor.black.cgColor
        viewCell?.layer.shadowOffset = CGSize.zero
        viewCell?.layer.shadowOpacity = 0.6
        carImage?.layer.cornerRadius = 8.0
        carImage?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        carImage?.image = nil
        carMarca?.text = nil
        carModel?.text = nil
        price?.text = nil
        priceValue?.text = nil
        
    }
    
    func datesViews(image: String? = nil, marca: String? = nil, model: String? = nil, value: String? = nil) {
        carImage?.image = UIImage(named: image ?? "")
        carMarca?.text = marca
        carModel?.text = model
        priceValue?.text = value
        price?.text = "Precio:"
    }
 }
