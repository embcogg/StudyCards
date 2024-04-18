//
//  CardViewModel.swift
//  StudyCards
//
//  Created by Emily Coggins on 4/17/24.
//

import Combine

final class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository: CardRepository 
    
    @Published var studyCard: StudyCard
    
    var id = ""
    
    private var cancellables: Set<AnyCancellable> = []

    init(studyCard: StudyCard) {
        self.studyCard = studyCard
        self.cardRepository = CardRepository()
        
        $studyCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}

