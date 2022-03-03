//
//  File.swift
//  
//
//  Created by Masein Modi on 3/2/22.
//
import Foundation
import Vapor

struct SubmittedChatMessage: Decodable {
    let message: String
    let sender: String
    let senderID: UUID
    let receiver: String
}
struct ReceivingChatMessage: Encodable, Identifiable {
    let date = Date()
    let id = UUID()
    let message: String
    let sender: String
    let senderID: UUID
    let receiver: String
}
struct Notification: Encodable {
    let messssage: ReceivingChatMessage
}
struct SubmittedUser: Decodable {
    let id: UUID
    let userName: String
}
struct User: Encodable, Identifiable, Hashable {
    let id: UUID
    let userName: String
    let messages: [String: [ReceivingChatMessage]]
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
struct Client: Hashable {
    var username: String!
    var connection: WebSocket!
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.connection == rhs.connection
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(connection)
    }
}
