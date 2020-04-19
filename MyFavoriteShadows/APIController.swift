//
//  APIController.swift
//  MyFavoriteShadows
//
//  Created by Kenny on 4/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation
class APIController {
    var allCharacters: [APICastMember] = []
    let characterJSON =
"""
{
    "cast": [{
        "character": "Nandor",
        "credit_id": "5bda6dc492514153f8005383",
        "id": 2959,
        "name": "Kayvan Novak",
        "gender": 2,
        "profile_path": null,
        "order": 0
    }, {
        "character": "Lazslo",
        "credit_id": "5bda6dd40e0a2603b4005957",
        "id": 1488236,
        "name": "Matt Berry",
        "gender": 2,
        "profile_path": null,
        "order": 1
    }, {
        "character": "Nadja",
        "credit_id": "5bda6dea0e0a2603b8005c70",
        "id": 1971031,
        "name": "Natasia Demetriou",
        "gender": 1,
        "profile_path": "/soieqJQw2ycipkuFj0KaHROM1VH.jpg",
        "order": 2
    }, {
        "character": "Guillermo",
        "credit_id": "5bda6dff92514154020056e4",
        "id": 210172,
        "name": "Harvey Guillén",
        "gender": 2,
        "profile_path": null,
        "order": 3
    }, {
        "character": "Colin Robinson",
        "credit_id": "5c77535a0e0a2607ee62067d",
        "id": 1198148,
        "name": "Mark Proksch",
        "gender": 0,
        "profile_path": null,
        "order": 4
    }],
    "crew": [],
    "id": 83631
}
""".data(using: .utf8)!

    func decodeCharacters() {
        let jsonDecoder = JSONDecoder()
        do {
            let characterResults = try jsonDecoder.decode(APICastResult.self, from: characterJSON)
            allCharacters = characterResults.cast
        } catch let decodeError {
            print("Error decoding: \(decodeError)")
        }
    }

    init() {
        decodeCharacters()
    }
}
