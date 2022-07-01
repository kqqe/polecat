//
//  FactModel.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import Foundation

typealias Welcome = [WelcomeElement]

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let status: Status
    let id, user, text: String
    let v: Int
    let source, updatedAt, type, createdAt: String
    let deleted, used: Bool

    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user, text
        case v = "__v"
        case source, updatedAt, type, createdAt, deleted, used
    }
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool
    let sentCount: Int
}


