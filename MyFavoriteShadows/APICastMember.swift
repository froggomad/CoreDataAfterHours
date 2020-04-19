//
//  APICastMember.swift
//  MyFavoriteShadows
//
//  Created by Kenny on 4/18/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//


enum Gender: Int, Decodable {
    case neutral
    case female
    case male
}

struct APICastResult: Decodable {
    let cast: [APICastMember]
}

struct APICastMember: Decodable {
    let character: String
    let actor: String
    let gender: Gender
    let id: Int

    enum CodingKeys: String, CodingKey {
        case character
        case actor = "name"
        case gender
        case id
    }
}
