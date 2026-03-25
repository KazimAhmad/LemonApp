//
//  SignUpSecondView.swift
//  Lemon
//
//  Created by Kazim Ahmad on 25/03/2026.
//

import PhotosUI
import SwiftUI

struct SignUpSecondView: View {
    @StateObject var viewModel: SignUpSecondViewModel
    @State private var photosPickerPresented = false
    @State private var photoPickerItem: PhotosPickerItem? = nil

    var body: some View {
        ZStack {
            GradientBackgroundView()
            ScrollView(showsIndicators: false) {
                logoView()
                AppTextField(title: "Work", text: $viewModel.signUpObject.industry)
                AppTextView(title: "Bio", text: $viewModel.signUpObject.bio)
                PassionsView(selectedPassions: $viewModel.signUpObject.passions)
                Button {
                    
                } label: {
                    Text("Sign Up")
                }
                .disabled(!viewModel.isFormValid())
                .buttonStyle(YellowAndBlackButton())
                .padding(.vertical, 32)
            }
            .padding()
        }
    }
    
    private func logoView() -> some View {
        HStack(alignment: .bottom) {
            let selectedImage = viewModel.signUpObject.image
            Button {
                if selectedImage != nil {
                    viewModel.signUpObject.image = nil
                    photoPickerItem = nil
                }
                photosPickerPresented.toggle()
            } label: {
                VStack {
                    if selectedImage != nil {
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width: Constants.userPicSizeExtraLarge,
                                   height: Constants.userPicSizeExtraLarge)
                            .clipShape(Circle())
                    } else {
                        DefaultUserPicture(size: Constants.userPicSizeExtraLarge)
                    }
                }
                .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                if selectedImage != nil {
                                    Images.delete
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(Color.red)
                                } else {
                                    Images.camera
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundStyle(Color.second)
                                }
                            }
                        }
                    }
            }
            VStack(alignment: .trailing, spacing: -8) {
                Text(viewModel.signUpObject.firstName)
                    .font(AppTypography.bold(size: Constants.logoFontSize))
                Text(viewModel.signUpObject.lastName)
                    .font(AppTypography.regularApp())
            }
        }
        .foregroundStyle(Color.primary)
        .padding(.vertical, 60)
        .photosPicker(isPresented: $photosPickerPresented, selection: $photoPickerItem)
        .onChange(of: photoPickerItem) { oldValue, newValue in
            guard let newValue else { return }
            Task {
                do {
                    if let imageData = try await newValue.loadTransferable(type: Data.self),
                       let inputImage = UIImage(data: imageData) {
                        viewModel.signUpObject.image = inputImage
                    }
                } catch {
                    print("Failed to load image data: \(error)")
                }
            }
        }
    }
}

#Preview {
    SignUpSecondView(viewModel: SignUpSecondViewModel(signUpObject: SignUpObject(firstName: "Kazim",
                                                                                 lastName: "Ahmad")))
}
