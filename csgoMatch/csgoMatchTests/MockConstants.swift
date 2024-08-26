//
//  MockConstants.swift
//  csgoMatchTests
//
//  Created by Eduardo Leite on 26/08/24.
//

import Foundation

struct MockConstants {
    static let defaultCurrentMatchs = [
        Match(
            id: 0,
            scheduledAt: nil,
            status: "running",
            opponents: [
                Opponent(opponent: Team(
                    id: 1,
                    name: "team1",
                    imageUrl: nil,
                    players: [Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                ),
                Opponent(opponent: Team(
                    id: 1,
                    name: "team2",
                    imageUrl: nil,
                    players: [Player(name: "player2", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                )
            ],
            league: League(imageUrl: nil, name: "league1"),
            serie: Serie(name: "serie1")
        ),
        Match(
            id: 0,
            scheduledAt: nil,
            status: "running",
            opponents: [
                Opponent(opponent: Team(
                    id: 1,
                    name: "team1",
                    imageUrl: nil,
                    players: [Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                ),
                Opponent(opponent: Team(
                    id: 1,
                    name: "team2",
                    imageUrl: nil,
                    players: [Player(name: "player2", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                )
            ],
            league: League(imageUrl: nil, name: "league1"),
            serie: Serie(name: "serie1")
        )
    ]
    static let defaultUpcommingMatchs = [
        Match(
            id: 0,
            scheduledAt: nil,
            status: "upcomming",
            opponents: [
                Opponent(opponent: Team(
                    id: 1,
                    name: "team1",
                    imageUrl: nil,
                    players: [Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                ),
                Opponent(opponent: Team(
                    id: 1,
                    name: "team2",
                    imageUrl: nil,
                    players: [Player(name: "player2", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                )
            ],
            league: League(imageUrl: nil, name: "league1"),
            serie: Serie(name: "serie1")
        ),
        Match(
            id: 0,
            scheduledAt: nil,
            status: "upcomming",
            opponents: [
                Opponent(opponent: Team(
                    id: 1,
                    name: "team1",
                    imageUrl: nil,
                    players: [Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                ),
                Opponent(opponent: Team(
                    id: 1,
                    name: "team2",
                    imageUrl: nil,
                    players: [Player(name: "player2", firstName: "firstName", lastName: "lastName", imageUrl: nil)]
                    )
                )
            ],
            league: League(imageUrl: nil, name: "league1"),
            serie: Serie(name: "serie1")
        )
    ]
    static let defaultTeam = Team(
        id: 0,
        name: "team1",
        imageUrl: nil,
        players: [
            Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil),
            Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil),
            Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil),
            Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil),
            Player(name: "player1", firstName: "firstName", lastName: "lastName", imageUrl: nil)
        ]
    )
}
