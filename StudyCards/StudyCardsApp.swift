//
//  StudyCardsApp.swift
//  StudyCards
//
//  Created by Emily Coggins on 4/16/24.
//

import SwiftUI
import Firebase

@main
struct StudyCardsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            CardListView(cardListViewModel: CardListViewModel())
        }
    }
}
