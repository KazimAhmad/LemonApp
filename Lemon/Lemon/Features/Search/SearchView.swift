//
//  SearchView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 08/04/2026.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel: SearchViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AppHeaderView()
            Text("Explore Categories")
                .font(AppTypography.bold18())
                .padding()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    ForEach(viewModel.allCategories, id: \.id) { category in
                        Text(category.name)
                            .font(AppTypography.regularApp())
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(alignment: .bottom) {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 8)
                                ForEach(category.passions, id: \.id) { passion in
                                    passionView(passion: passion)
                                }
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 8)
                            }
                        }
                        .padding(.bottom)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .task {
            viewModel.fetchCategories()
        }
    }
    
    func passionView(passion: Passion) -> some View {
        VStack(alignment: .trailing) {
            Spacer()
            Text(passion.name)
                .font(AppTypography.mediumApp())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .foregroundStyle(Color.white)
        .frame(width: 200, height: 100)
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .fill(Color.init(hex: passion.color))
        )
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel())
}
