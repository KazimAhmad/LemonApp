//
//  PassionsView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import Combine
import SwiftUI

class PassionsViewModel: ObservableObject {
    @Published var categories: [PassionCategory] = []
    @Published var selectedPassions: [Passion] = []
    
    init(selectedPassions: [Passion]) {
        self.selectedPassions = selectedPassions
    }
    
    func isSelected(passion: Passion) -> Bool {
        selectedPassions.contains(where: { $0.id == passion.id })
    }
    
    func toggleSelect(passion: Passion) {
        if let index = selectedPassions.firstIndex(where: { $0.id == passion.id }) {
            selectedPassions.remove(at: index)
        } else {
            if selectedPassions.count >= 3 { return }
            selectedPassions.append(passion)
        }
    }
    
    func get() {
        Task {
            do {
                let repo = PassionRepo()
                categories = try await repo.get()
            } catch {
                print(error)
            }
        }
    }
}

struct PassionsView: View {
    @StateObject var viewModel: PassionsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select things that keep you going")
                .font(AppTypography.bold18())
            Text("\(viewModel.selectedPassions.count) of 3")
                .font(AppTypography.regularApp())
            ForEach(viewModel.categories, id: \.id) { category in
                Text(category.name)
                    .font(AppTypography.mediumApp())
                FlowLayout {
                    ForEach(category.passions, id: \.id) { passion in
                        let isSelected = viewModel.isSelected(passion: passion)
                        HStack {
                            if isSelected {
                                Images.checkMark
                            } else {
                                Images.plus
                            }
                            Text(passion.name)
                        }
                        .font(isSelected ? AppTypography.medium14() : AppTypography.regularApp())
                        .padding(8)
                        .background(
                            Capsule()
                                .fill(isSelected ? Color.second : Color.clear)
                                .stroke(Color.second, lineWidth: 1)
                        )
                        .padding(2)
                        .onTapGesture {
                            viewModel.toggleSelect(passion: passion)
                        }
                    }
                }
            }
        }
        .task {
            viewModel.get()
        }
    }
}

#Preview {
    PassionsView(viewModel: PassionsViewModel(selectedPassions: []))
}
