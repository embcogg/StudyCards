//
//  CardRepository.swift
//  StudyCards
//
//  Created by Emily Coggins on 4/16/24.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class CardRepository: ObservableObject {
    private let path = "studyCards"
    private let store = Firestore.firestore()
    @Published var studyCards: [StudyCard] = []
    
    init() {
        get()
    }
    
    func get() {
        store.collection(path).addSnapshotListener { (snapshot, error) in
            if let error = error {
                print(error)
                return
            }
            self.studyCards = snapshot?.documents.compactMap {
                try? $0.data(as: StudyCard.self)
            } ?? []
        }
    }
    
    func add(_ studyCard: StudyCard) {
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch {
            fatalError("Adding study card failed")
        }
    }
    
    func remove(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        store.collection(path).document(documentId).delete {  error in
            if let error = error {
                print("Unable to remove the card: \(error.localizedDescription)")
            }
        }
    }
    
    func update(_ studyCard: StudyCard) {
        guard let documentId = studyCard.id else { return }
        do {
            _ = try store.collection(path).document(documentId).setData(from: studyCard)
        } catch {
            fatalError("Updating study card failed")
        }
    }
}
