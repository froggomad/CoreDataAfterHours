//
//  CastMember+Convenience.swift
//  MyFavoriteShadows
//
//  Created by Kenny on 4/19/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import Foundation
import CoreData

extension CastMember {
    @discardableResult convenience init(character: String,
                                        actor: String,
                                        gender: Int,
                                        id: Int,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.character = character
        self.actor = actor
        self.gender = Int16(gender)
        self.id = Int32(id)
    }
}
