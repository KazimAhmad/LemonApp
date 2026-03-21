//
//  HomeView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 21/03/2026.
//
import Combine
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView()
            ZStack {
                backgroundSheetsView()
                storiesView()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    private func headerView() -> some View {
        VStack {
            Spacer()
                .frame(height: 48)
            HStack(alignment: .bottom) {
                Image(Images.icon)
                    .resizable()
                    .frame(width: 60, height: 60)
                Text("Lemon")
                    .font(AppTypography.bold(size: 32))
                    .foregroundStyle(Color(uiColor: .systemBackground))
                Spacer()
            }
        }
        .padding()
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                      bottomLeading: 60.0,
                                                      bottomTrailing: 0.0,
                                                      topTrailing: 0.0))
            .fill(Color.second)
        )
    }
    
    private func storiesView() -> some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.stories, id: \.self) { story in
                    Text(story)
                        .containerRelativeFrame(.vertical, count: 1, span: 1, spacing: 0, alignment: .center)
                }
            }
            .scrollTargetLayout()
            .background(GeometryReader {
                Color.clear.preference(key: ViewOffsetKey.self,
                    value: -$0.frame(in: .named("scroll")).origin.y)
            })
            .onPreferenceChange(ViewOffsetKey.self) { viewModel.detector.send($0) }
        }
        .scrollTargetBehavior(.paging)
        .coordinateSpace(name: "scroll")
        .onReceive(viewModel.publisher) { _ in
            viewModel.animateSheets()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1,
                                          execute: {
                viewModel.unAnimateSheets()
            })
        }
    }
    
    private func backgroundSheetsView() -> some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(1...5, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.accent.opacity(Double(index) * 0.2))
                        .rotationEffect(Angle(degrees: Double(index) * -6))
                        .frame(width: geometry.size.width * 1.8,
                               height: geometry.size.height / 1.2)
                        .offset(y: viewModel.sheetsToAnimate[index] ? -16 : 0)
                        .animation(.easeInOut, value: viewModel.sheetsToAnimate[index])
                }
            }
            .offset(x: geometry.size.width / 3)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
