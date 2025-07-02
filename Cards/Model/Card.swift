//
//  Card.swift
//  Cards
//
//  Created by AHMED on 02/07/2025.
//

import Foundation
import SwiftUI

struct Card: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var image: String
}
let cards: [Card] = (1...10).map { i in
     .init(image: "f\(i)")
}
