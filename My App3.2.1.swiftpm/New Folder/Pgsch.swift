import SwiftUI

import SwiftUI

struct Pgsch: View {
    init() {
        registerFont(withName: "ByteBounce", fileExtension: "ttf")
    }
    
    
    @State private var word: [[String]] = [["your"]]
    
    @State private var nu: [[Int]] = [[1]]
    
    @State private var myImage: UIImage?
    
    
    private func fetchAndUpdateImage() {
        arrsch { dataArray in
            if let dataArray = dataArray {
                print("Returned 2D Array: \(dataArray)")
                word = dataArray
                if let imageUrl = URL(string: safeWord(at: safeNum(at:
                                                                    accnum() , element: 0, in: nu), element: 0, in: word)),
                   let data = try? Data(contentsOf: imageUrl) {
                    myImage = UIImage(data: data)
                }
            } else {
                print("Failed to get the array.")
            }
        }
    }
    
    
    private func fetchst() {
        arrst { dataArray in
            if let dataArray = dataArray {
                print("Returned 2D Array: \(dataArray)")
                nu = dataArray
            } else {
                print("Failed to get the array.")
            }
        }
    }
    
    
    
    
    func safeWord(at index: Int, element: Int, in words: [[String]]) -> String {
        if index >= 0 && index < words.count, 
            element >= 0 && element < words[index].count {
            return words[index][element]
        } else {
            return "Default" // Fallback text
        }
    }
    
    
    func safeNum(at index: Int, element: Int, in words: [[Int]]) -> Int {
        if index >= 0 && index < words.count, 
            element >= 0 && element < words[index].count {
            return words[index][element]
        } else {
            return 1 // Fallback text
        }
    }
    
    
    
    
    
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            // Background color
            Color.green
                .ignoresSafeArea() // Fill the entire screen
            
            
            Text("loading...")
                .font(.custom("ByteBounce", size: 95)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x: 0, y: -20)
            
            // Image layer
            VStack {
                if let myImage = myImage {
                    Image(uiImage: myImage) // Displaying the image if available
                        .resizable()
                        .scaledToFit()
                        .frame(width: 800, height: 800)
                        .padding(.top, 50)
                }
            }
            
            
            Button(action: {
                
                print("Semi-transparent square button tapped!")
                appState.PgVariable = 0
                print(appState.PgVariable)
                
            }) {
                Rectangle() // Use a Rectangle shape for the button's look
                    .fill(Color.blue.opacity(0)) // Semi-transparent blue background
                    .frame(width: 200, height: 30) // Square size
                
            }
            .offset(x: -80, y: -335)
            
            
        }.onAppear {
            print("go")
            fetchAndUpdateImage()
            fetchst()
        }
    }
}

struct Pgsch_Previews: PreviewProvider {
    static var previews: some View {
        Pgsch()
    }
}

