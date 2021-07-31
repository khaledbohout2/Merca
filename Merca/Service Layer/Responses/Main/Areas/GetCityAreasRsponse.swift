//
//  GetCityAreasRsponse.swift
//  Merca
//
//  Created by Khaled Bohout on 10/07/2021.
//

import Foundation

// MARK: - GetCityAreasResponse
struct GetCityAreasResponse: Codable {
    let success: Bool
    let message: String
    let data: [Area]
}

// MARK: - Datum
struct Area: Codable {
    let id: Int
    let value: String
}
