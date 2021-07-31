//
//  GetAllCitiesResponse.swift
//  Merca
//
//  Created by Khaled Bohout on 10/07/2021.
//

import Foundation

import Foundation

// MARK: - GetAllCitiesResponse
struct GetAllCitiesResponse: Codable {
    let success: Bool
    let message: String
    let data: [City]
}

// MARK: - Datum
struct City: Codable {
    let id: Int
    let value: String
}
