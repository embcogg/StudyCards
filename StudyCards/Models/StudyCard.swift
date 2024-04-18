//
//  StudyCard.swift
//  StudyCards
//
//  Created by Emily Coggins on 4/16/24.
//

import FirebaseFirestoreSwift

struct StudyCard: Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
}
