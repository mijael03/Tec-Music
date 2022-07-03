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

struct Song	: Identifiable,Hashable {
    let id:String
    let name: String
    let artist:String
    let artwork: String
    let category: Category.RawValue
    let albumName: String
    let source: String
}
extension Song {
    static let all: [Song] = [
        Song(
            id: "1",
            name: "THE WEEKND & DAFT PUNK – STARBOY",
            artist: "The weeknd",
            artwork: "https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452",
            category: "Electronica",
            albumName: "aksmlaks",
            source: "kajajs"
        ),
        Song(
            id: "12",
            name: "THE WEEKND & DAFT PUNK – STARBOY",
            artist: "The weeknd",
            artwork: "https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452",
            category: "Electronica",
            albumName: "aksmlaks",
            source: "kajajs"
        ),
        Song(
            id: "123",
            name: "THE WEEKND & DAFT PUNK – STARBOY",
            artist: "The weeknd",
            artwork: "https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452",
            category: "Electronica",
            albumName: "aksmlaks",
            source: "kajajs"
        ),
    ]
}
