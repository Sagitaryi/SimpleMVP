//
//  DataStorageService.swift
//  SimpleMVP
//
//  Created by Алексей Чумаков on 22.05.2024.
//

import Foundation

protocol DataStorageServiceProtocol {
    func storeDefaultData(value: String, key: String)
}

final class DataStorageService: DataStorageServiceProtocol {
    func storeDefaultData(value: String, key: String) {
        UserDefaults.standard.set(value, forKey: key )
    }
}
