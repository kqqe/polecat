//
//  ServiceFact.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import Foundation

protocol ServiceFactInput {
    func requestUrl() async throws -> Welcome
}

class ServiceFact: ServiceFactInput {
    
    func requestUrl() async throws -> Welcome {
    
    let session = URLSession.shared
        guard let url = URL(string: "https://cat-fact.herokuapp.com/facts")
        else { throw ServiceError.invalidateUrl }
        
        
        do {
            let (data, _) = try await session.data(from: url)
            let result = try JSONDecoder().decode(Welcome.self, from: data)
            return result
        } catch {
            throw ServiceError.requestError
        }
    }
}
