//
//  PolecatViewModel.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import Foundation
import UIKit


class PolecatViewModel {
    var imageCat: UIImage? = nil
    var labelInfo: String? = ""
    var data: String? = ""
    var welcomeModel: Welcome?
    let serviceCat: ServiceCatInput
    let serviceFact: ServiceFactInput
    var arrayImage: [UIImage] = []
    
    init(serviceCat: ServiceCatInput, serviceFact: ServiceFactInput) {
        self.serviceCat = serviceCat
        self.serviceFact = serviceFact
    }
    
    func configureModel() async -> NewsModel {
        do {
            let dataImage = try! await serviceCat.requestUrlCat()
            let facts = try! await serviceFact.requestUrl()
            let icon = UIImage(data: dataImage)!
            let model = NewsModel(image: icon,
                                  facts: facts)
            return model
        } catch let error as ServiceError {
            print(error)
        }
    }
}

struct NewsModel {
    let image: UIImage
    let facts: Welcome
}
