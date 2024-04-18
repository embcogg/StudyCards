//
//  CardListViewModel.swift
//  StudyCards
//
//  Created by Emily Coggins on 4/16/24.
//

import Combine

final class CardListViewModel: ObservableObject {
    @Published var cardRepository = CardRepository()
    @Published var cardViewModels: [CardViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        cardRepository.$studyCards
            .map { studyCards in
                studyCards.map(CardViewModel.init)
            }
            .assign(to: \.cardViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ studyCard: StudyCard) {
        cardRepository.add(studyCard)
    }
    
    func remove(_ studyCard: StudyCard) {
        cardRepository.remove(studyCard)
    }
    
    func update(_ studyCard: StudyCard) {
        cardRepository.update(studyCard)
    }
}
