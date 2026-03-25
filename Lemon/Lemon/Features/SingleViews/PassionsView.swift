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
    @StateObject var viewModel: PassionsViewModel = PassionsViewModel()
    @Binding var selectedPassions: [Passion]

    init(selectedPassions: Binding<[Passion]>) {
        _selectedPassions = selectedPassions
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select things that keep you going")
                .font(AppTypography.bold18())
            Text("\(selectedPassions.count) of 3")
                .font(AppTypography.regularApp())
            ForEach(viewModel.categories, id: \.id) { category in
                Text(category.name)
                    .font(AppTypography.mediumApp())
                FlowLayout {
                    ForEach(category.passions, id: \.id) { passion in
                        let isSelected = isSelected(passion: passion)
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
                            toggleSelect(passion: passion)
                        }
                    }
                }
            }
        }
        .task {
            viewModel.get()
        }
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
}

#Preview {
    PassionsView(selectedPassions: .constant([]))
}
