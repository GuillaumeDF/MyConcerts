//
//  EventsHref.swift
//  MyConcerts
//
//  Created by Guillaume Djaider Fornari on 18/07/2019.
//  Copyright © 2019 Guillaume Djaider Fornari. All rights reserved.
//

import Foundation

struct Start: Codable {
    let date: String?
}

struct Events: DataJSON {
    let id: Int
    let displayName: String
    let type: String?
    let start: Start
}

struct Results: Codable {
    let event: [Events]
}

struct ResultsPage: Codable {
    let results: Results
}

struct InfoEvent: Codable {
    let resultsPage: ResultsPage
}

class EventsHref: ApiProtocol {
    var task: URLSessionDataTask?
    var url: String = ""
    var request: URLRequest!
    private var href: String
    var ecoMode: Bool = false
    
    init(href: String) {
        self.href = href
    }
    
    func createUrl() {
        self.url = self.href + "?apikey=JDyRTYDK3g9GUd3V"
        self.url = self.url.replacingOccurrences(of: "http", with: "https")
    }
    
    func getResponseJSON(data: Data, completionHandler: @escaping (Bool, [DataJSON]?) -> Void) {
        do {
            // Use the struct InfoEvent with the methode Decode
            let resultData: [DataJSON] = try JSONDecoder().decode(InfoEvent.self, from: data).resultsPage.results.event
            completionHandler(true, resultData)
            return
        } catch {
            NSLog("Class EventsHref - Error Decoder: \(error)")
            completionHandler(false, nil)
            return NotificationCenter.default.post(name: .error, object: ["Error Event", "No events found"])
        }
    }
    
}
