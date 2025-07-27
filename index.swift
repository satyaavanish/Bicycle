 
import SwiftUI

struct Intro: View {
    @State private var navigateToNextView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                Text("Renzy")
                    .fontWeight(.heavy)
                    .fontDesign(.serif)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.top, 260)
                
                Image(.image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .cornerRadius(4)
                
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(1.5)
                        .padding(.top, 380)
                    NavigationLink(destination: EmailValidationView(), isActive: $navigateToNextView) {
                        EmptyView()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // Change to 4 seconds
                        navigateToNextView = true
                    }
                }
            }
        }
    }
}
struct EmailValidationView: View {
    @State private var email: String = ""
    @State private var navigateToMidpage = false
    func didSet() {
                    email = email.lowercased() // Convert to lowercase
                }
    
    @State private var isValid: Bool? = nil
    var body: some View {
        VStack {
            
            Text("Welcome to the Renzy app!")
                .font(.title)
                .fontDesign(.serif)
                .multilineTextAlignment(.center)
                .padding()
            TextField("Enter the VIT Email id" , text: $email)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(40)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)
            Button(action: validateEmail) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                    .padding()
            }
            
        
            if let isValid = isValid {
                if isValid {
                    NavigationLink(destination: Midpage()){
                        Text("Click here ")
                    }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.green)
                        .navigationBarBackButtonHidden(true)
                    
                } else {
                    Text("Invalid email. Please enter properly")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        
    }

    private func validateEmail() {
        if email.hasSuffix("@vitstudent.ac.in") {
            isValid = true
            
        } else {
            isValid = false
        }
    }
}

#Preview{
 Intro()
}
