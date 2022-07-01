//
//  Extension+UIButton.swift
//  Polecat
//
//  Created by Anatoliy on 29.06.2022.
//

import UIKit
extension UIControl {
 func addAction(for controlEvent: Event = .touchUpInside, _ closure: @escaping () -> ()) {
  addAction( UIAction { (action: UIAction) in closure() }, for: controlEvent)
 }
}
