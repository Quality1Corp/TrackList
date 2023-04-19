//
//  Track.swift
//  TrackList
//
//  Created by MikhaiL on 18.04.2023.
//

struct Track {
    let song: String
    let artist: String
    
    var title: String {
        "\(song) - \(artist)"
    }
    
    static func getTrack() -> [Track] {
        [
            Track(song: "Follow You", artist: "Imagine Dragons"),
            Track(song: "TheBeatles", artist: "Abbey Road"),
            Track(song: "Forever", artist: "haroinfather"),
            Track(song: "Drivers license", artist: "Olivia Rodrigo"),
            Track(song: "Down By The River", artist: "Milky Chance"),
            Track(song: "7 rings", artist: "Ariana Grande"),
            Track(song: "Know Yourself", artist: "Drake"),
            Track(song: "Flashbacks", artist: "INNA"),
            Track(song: "Save Your Tears", artist: "The Weeknd"),
            Track(song: "Rap God", artist: "Eminem")
        ]
    }
}
