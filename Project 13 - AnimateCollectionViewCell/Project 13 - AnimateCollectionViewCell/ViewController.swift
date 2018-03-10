//
//  ViewController.swift
//  Project 13 - AnimateCollectionViewCell
//
//  Created by Christophe Bugnon on 10/03/2018.
//  Copyright © 2018 Christophe Bugnon. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var darkBlue : UIColor { return UIColor(red: 9/255, green: 45/255, blue: 64/255, alpha: 1) }
    static var lightRed : UIColor { return UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)}
    static var tealColor : UIColor { return UIColor(red: 48/255, green: 164/255, blue: 182/255, alpha: 1)}
    static var lightBlue : UIColor { return UIColor(red: 218/255, green: 235/255, blue: 243/255, alpha: 1)}
}

struct CompanyModel {
    var name: String
    var description: String
    var image: UIImage
    
    static func getList() -> [CompanyModel] {
        
        return [
            CompanyModel(name: "Supreme", description: "Supreme is a skateboarding shop and clothing brand established in New York City in April 1994. The brand caters to the skateboarding, hip hop and rock cultures, as well as to the youth culture in general.", image: #imageLiteral(resourceName: "Supreme")),
            CompanyModel(name: "Carhartt", description: "Carhartt, Inc., is a U.S.-based apparel company founded in 1889. Carhartt is known for its work clothes, such as jackets, coats, overalls, coveralls, vests, shirts, jeans, dungarees and fire-resistant clothing.", image: #imageLiteral(resourceName: "carhartt")),
            CompanyModel(name: "DC Shoes", description: "DC Shoes is an American company that specializes in footwear for action sports, including skateboarding and snowboarding. The company also manufactures apparel, bags, accessories, hats, shirts, and posters.", image: #imageLiteral(resourceName: "DC Shoes")),
            CompanyModel(name: "Reebok", description: "Reebok is a global athletic footwear and apparel company, operating as a subsidiary of Adidas since 2005. Reebok produces and distributes fitness, running and CrossFit sportswear including clothing and footwear.", image: #imageLiteral(resourceName: "Reebok")),
            CompanyModel(name: "Nike", description: "Nike, Inc. is an American multinational corporation that is engaged in the design, development, manufacturing, and worldwide marketing and sales of footwear, apparel, equipment, accessories, and services.", image: #imageLiteral(resourceName: "Nike")),
            CompanyModel(name: "Adidas", description: "Adidas AG is a multinational corporation, founded and headquartered in Herzogenaurach, Germany, that designs and manufactures shoes, clothing and accessories.", image: #imageLiteral(resourceName: "Adidas")),
            CompanyModel(name: "Abercrombie", description: "Abercrombie & Fitch (A&F) is an American retailer that focuses on upscale casual wear for young consumers, its headquarters are in New Albany, Ohio. The company operates 1,049 stores across all three brands.", image: #imageLiteral(resourceName: "Abercombie")),
            CompanyModel(name: "Hollister", description: "Hollister Co., often advertised as Hollister or HCo., is an American lifestyle brand owned by Abercrombie & Fitch Co.", image: #imageLiteral(resourceName: "Hollister")),
            CompanyModel(name: "Vans", description: "Vans is an American manufacturer of skateboarding shoes, based in Costa Mesa, California, owned by VF Corporation. The company also produces apparel and other products such as T-shirts, hoodies, socks, hats, and backpacks.", image: #imageLiteral(resourceName: "Vans")),
            CompanyModel(name: "The North Face", description: "The North Face, Inc. is an American outdoor product company specializing in outerwear, fleece, coats, shirts, footwear, and equipment such as backpacks, tents, and sleeping bags.", image: #imageLiteral(resourceName: "The North Face")),
        ]
        
    }
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var isLoaded = false
    var companies = CompanyModel.getList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lifestyle"
        
        collectionView?.backgroundColor = .darkBlue
        
        collectionView?.register(CompanyCell.self, forCellWithReuseIdentifier: "cellId")
        
    }
    
    func animationForIndex(index: Int) -> TimeInterval {
    
        let itemCount = companies.count - 1
        let animationDelay = (CGFloat(index) / (CGFloat(itemCount)))  * 0.9
        let timeIntervalAnimationDelay = TimeInterval(animationDelay)

        return timeIntervalAnimationDelay
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CompanyCell
        
        let company = self.companies[indexPath.row]
        cell.company = company
        
        cell.transform = .init(translationX: 0, y: self.view.bounds.height)

        UIView.animate(withDuration: 2, delay: animationForIndex(index: indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            cell.transform = .identity
        }, completion: nil)
        
        return cell
    }

}

