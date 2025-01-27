import SwiftUI

struct Pgacc: View {
    init() {
        registerFont(withName: "ByteBounce", fileExtension: "ttf")
    }
    @State private var userInput: String = ""
    @State private var displayText: String = ""
    @EnvironmentObject var appState: AppState
    @State private var word: [[String]] = [["your"]]
    
    private func fetchAndUpdateImage() {
        arr { dataArray in
            if let dataArray = dataArray {
                print("Returned 2D Array: \(dataArray)")
                word = dataArray
            } else {
                print("Failed to get the array.")
            }
        }
    }
    
    var body: some View {
        
        ZStack{
            Color(UIColor(red: 230/255, green: 177/255, blue: 107/255, alpha: 1.0))
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TextField("Enter text here", text: $userInput)
                    .font(.custom("ByteBounce", size: 40))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    searchForItem(in: word, userInput)
                    if(vad() == 99){
                        displayText = "invaild"
                        print(accnum())
                    }else{
                        displayText = "User \(userInput)"
                        print(accnum())
                        appState.PgVariable = 0
                    }
                    
                   


                }) {
                    Text("Submit")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .font(.custom("ByteBounce", size: 40))
                }
                Text(displayText)
                    .font(.custom("ByteBounce", size: 40))
                    .foregroundColor(.black)
                    .padding()
            }
            .padding()
        }.onAppear {
            print("go")
            fetchAndUpdateImage()
        }
            
        }
        
}

struct Pgacc_Previews: PreviewProvider {
    static var previews: some View {
        Pgacc()
    }
}

