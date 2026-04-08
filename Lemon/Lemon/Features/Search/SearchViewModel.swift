//
//  SearchViewModel.swift
//  Lemon
//
//  Created by Kazim Ahmad on 08/04/2026.
//

import Combine
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var allCategories: [PassionCategory] = []
    
    func fetchCategories() {
        if allCategories.count > 0 { return }
        Task {
            do {
                let categories: [PassionCategory] = try await PassionRepo().get()
                self.allCategories = categories
            } catch {
                print(error)
            }
        }
    }
}
