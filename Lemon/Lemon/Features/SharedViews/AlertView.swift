//
//  AlertView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 17/03/2026.
//

import SwiftUI

enum AlertType {
    case empty
    case error
    case warning
    case info
    
    var title: String {
        switch self {
        case .empty:
            return "Empty"
        case .error:
            return "Error!"
        case .warning:
            return "Warning"
        case .info:
            return "Info:"
        }
    }
    
    var image: Image {
        switch self {
            case .empty:
            return Images.empty
        case .error:
            return Images.error
        case .warning:
            return Images.warning
        case .info:
            return Images.info
        }
    }
}

struct AlertConfig {
    let title: String
    let message: String
    let type: AlertType
    let confirmTitle: String
    let cancelTitle: String?
    let confirmAction: (() -> Void)?
    let cancelAction: (() -> Void)?
    
    init(message: String,
         type: AlertType,
         confirmTitle: String,
         cancelTitle: String? = nil,
         confirmAction: (() -> Void)? = nil,
         cancelAction:  (() -> Void)? = nil) {
        self.title = type.title
        self.message = message
        self.type = type
        self.confirmTitle = confirmTitle
        self.cancelTitle = cancelTitle
        self.cancelAction = cancelAction
        self.confirmAction = confirmAction
    }
}

struct AlertView: View {
    let config: AlertConfig = AlertConfig(message: "Unexpected error occured while processing your request. Please try again later.",
                                          type: .error,
                                          confirmTitle: "Try Again",
                                          cancelTitle: "Cancel",
                                          confirmAction: {}, cancelAction: {})
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                config.type.image
                    .resizable()
                    .frame(width: 28, height: 28)
                Text(config.title)
                    .font(AppTypography.bold(size: 28))
                Spacer()
            }
            Text(config.message)
                .font(AppTypography.regularApp())
            HStack {
                Spacer()
                if let cancel = config.cancelTitle {
                    Button {
                        config.cancelAction?()
                    } label: {
                        Text(cancel)
                    }
                    .buttonStyle(GreenBorderButton())
                    .frame(width: 120)
                }
                Button {
                    config.confirmAction?()
                } label: {
                    Text(config.confirmTitle)
                }
                .buttonStyle(YellowAndBlackButton())
                .frame(width: 120)
            }
        }
        .padding()
        .foregroundStyle(Color(uiColor: .systemBackground))
        .frame(maxWidth: .infinity)
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0.0,
                                                      bottomLeading: Constants.alertCornerRadius,
                                                      bottomTrailing: 0.0, topTrailing: Constants.alertCornerRadius))
            .fill(Color.primary)
        )
        .padding(.horizontal)

    }
}

#Preview {
    AlertView()
}
