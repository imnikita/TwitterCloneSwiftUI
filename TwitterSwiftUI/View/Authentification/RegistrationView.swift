//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by Nikita Popov on 19.07.2021.
//

import SwiftUI

struct RegistrationView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: AuthViewModel
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var userName = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    // MARK: - Methods
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        self.image = Image(uiImage: selectedImage)
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                
                Button(action: {
                    self.showImagePicker.toggle()
                }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .imagePickerModifier()
                        }
                        
                    }
                }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
                
                VStack(spacing: 20) {
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $userName, placeholder: Text("username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecuredField(text: $password, placeholder: Text("password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                Button(action: {
                    guard let image = selectedUIImage else { return }
                    viewModel.registerUser(email: email, password: password,
                                           userName: userName,
                                           fullName: fullName,
                                           profileImage: image)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 320, height: 50, alignment: .center)
                        .background(Color.white)
                        .clipShape(Capsule())
                })
                .padding()
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Text("Sign In")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.bottom, 40)
                .onTapGesture {
                    mode.wrappedValue.dismiss()
                }
            }
        } // ZStack
        .background(Color(#colorLiteral(red: 0.2203325033, green: 0.6315936446, blue: 0.955042541, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
