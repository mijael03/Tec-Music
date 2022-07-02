//
//  Song.swift
//  SoundProject
//
//  Created by Mijael Cama on 25/06/22.
//

import Foundation
enum Category: String {
    case electronica = "Electronica"
    case trap = "Trap"
    case pop = "Pop"
    case rock = "Rock"
    case metal = "Metal"
    case punk = "Punk"
    case jazz = "Jazz"
    case romance = "Romance"
    case hip_hop = "Hip Hop"
    case latina = "Latina"
    case clasica = "Clásica"
    case regueton = "Regueton"
}

struct Song	: Identifiable {
    let id:String
    let name: String 
    let artwork: String
    let category: Category.RawValue
    let albumName: String
}

extension Song {
    static let all: [Song] = [
        Song(
            id: "12",
            name: "THE WEEKND & DAFT PUNK – STARBOY",
            artwork: "https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452",
            category: "Electronica",
            albumName: "Sacrifice"
            
        ),
        Song(
            id: "123",
            name: "WOS - CANGURO",
            artwork: "https://i.scdn.co/image/ab67616d0000b2735d9aed5c0f5f7ce3a0ea1e01",
            category: "Trap",
            albumName: "Sacrifice"
        ),
        Song(
            id: "1234",
            name: "THE WEEKND - Blinding Lights",
            artwork: "https://i.scdn.co/image/ab67616d0000b273a3eff72f62782fb589a492f9",
            category: "Pop",
            albumName: "Sacrifice"
        ),
    ]
}
