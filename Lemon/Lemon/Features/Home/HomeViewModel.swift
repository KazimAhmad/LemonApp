//
//  HomeViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Combine
import SwiftUI

enum StoryViewType {
    case page(Bool)
    case list(Bool)
    
    var image: Image {
        switch self {
        case .page(let selected):
            return selected ? Images.pageSelected : Images.page
        case .list(let selected):
            return selected ? Images.gridSelected : Images.grid
        }
    }
    
    var size: CGSize {
        switch self {
        case .page(let selected), .list(let selected):
            return selected ? CGSize(width: 16,
                                     height: 18) : CGSize(width: 8,
                                                          height: 10)
        }
    }
}

extension StoryViewType: Identifiable, Hashable {
    var id: Int {
        switch self {
        case .page: return 0
        case .list: return 1
        }
    }
}

class HomeViewModel: ObservableObject {
    var stories: [Story] = []
    
    @Published var storyViewTypes: [StoryViewType] = [.page(true), .list(false)]
    
    @Published var sheetsToAnimate: [Bool] = [false, false, false, false, false, false]
    
    @Published var detector: CurrentValueSubject<CGFloat, Never>
    @Published var publisher: AnyPublisher<CGFloat, Never>
    
    @Published var viewState: ViewState = .loading
    
    init() {
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
    }
    
    func toggleStoryType() {
        let firstType = self.storyViewTypes.removeFirst()
        if firstType == .page(true) {
            self.storyViewTypes.append(.page(false))
            self.storyViewTypes.remove(at: 0)
            self.storyViewTypes.insert(.list(true), at: 0)
        } else {
            self.storyViewTypes.append(.list(false))
            self.storyViewTypes.remove(at: 0)
            self.storyViewTypes.insert(.page(true), at: 0)
        }
    }
    
    func animateSheets() {
        for i in 0..<self.sheetsToAnimate.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 0.1),
                                          execute: { [weak self] in
                self?.sheetsToAnimate[i] = true
            })
        }
    }
    
    func unAnimateSheets() {
        for i in 0..<self.sheetsToAnimate.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 0.1),
                                          execute: { [weak self] in
                self?.sheetsToAnimate[i] = false
            })
        }
    }
}

//MARK: Services
extension HomeViewModel {
    func getStories() {
        guard stories.count == 0 else { return }
        let repo = StoryRepo()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.stories = repo.getStories()
            self.viewState = .info
        }
    }
}
