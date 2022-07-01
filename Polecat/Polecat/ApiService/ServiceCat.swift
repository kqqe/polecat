//
//  ServiceCat.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import Foundation
import UIKit

enum ServiceError: Error {
    case requestError
    case invalidateUrl
}

protocol ServiceCatInput{
    func requestUrlCat() async throws -> Data

}

final class ServiceCat: ServiceCatInput{
    
    func requestUrlCat() async throws -> Data {
        let session = URLSession.shared
        guard let url = URL(string: "https://cataas.com/cat") else {
            throw ServiceError.invalidateUrl
        }
        do {
            let (data, _) = try await session.data(from: url)
            return data
        } catch {
            throw ServiceError.requestError
        }
    }
}
