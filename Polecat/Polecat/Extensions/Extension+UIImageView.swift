//
//  Extension+UIImageView.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import UIKit

extension UIImageView {
    func loadImage(defaultImage: UIImage? = nil)  {
        self.image = nil
        guard let url = URL(string: "https://cataas.com/cat") else { return self.image = defaultImage }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard
                let data = data,
                error == nil
            else { return self.image = defaultImage }
            DispatchQueue.main.async {
                if let downloadImage = UIImage(data: data) {
                    self.image = downloadImage
                }
            }
        }.resume()
    }
}
