//
//  HomeViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    var stories: [String] = ["Story 1", "Story 2", "Story 3"]
    @Published var sheetsToAnimate: [Bool] = [false, false, false, false, false, false]
    
    @Published var detector: CurrentValueSubject<CGFloat, Never>
    @Published var publisher: AnyPublisher<CGFloat, Never>

    init() {
        let detector = CurrentValueSubject<CGFloat, Never>(0)
        self.publisher = detector
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .dropFirst()
            .eraseToAnyPublisher()
        self.detector = detector
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
