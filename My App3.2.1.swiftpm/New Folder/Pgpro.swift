import SwiftUI


struct Pgpro: View {
    init() {
        registerFont(withName: "ByteBounce", fileExtension: "ttf")
    }
    @EnvironmentObject var appState: AppState
    
    
    
    @State private var word: [[String]] = [["your"]]
    
    @State private var nu: [[Int]] = [[1]]
    
    @State private var myImage: UIImage?
    
    private func fetchAndUpdateImage() {
        arr { dataArray in
            if let dataArray = dataArray {
                print("Returned 2D Array: \(dataArray)")
                word = dataArray
                if let imageUrl = URL(string: safeWord(at: accnum(), element: 6, in: word)),
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
    
    func safeNum(at index: Int, element: Int, in words: [[Int]]) -> Int {
        if index >= 0 && index < words.count, 
            element >= 0 && element < words[index].count {
            return words[index][element]
        } else {
            return 1 // Fallback text
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
    
    
    
    
    
    
    var body: some View {
        ZStack {
            // Background color
            Color.green
                .ignoresSafeArea() // Fill the entire screen
            
            // Image layer
            VStack {
                Image("Pro-1") // Replace with your image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 800, height: 800)
                    .padding(.top, 50)
            }
            
            VStack {
                if let myImage = myImage {
                    Image(uiImage: myImage) // Displaying the image if available
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 230)
                        .padding(.top, 50)

                }
            }.offset(x: 90, y: -115)
            
            
            
            
            // name
            Text(safeWord(at: accnum(), element: 1, in: word))
                .font(.custom("ByteBounce", size: 95)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                 .offset(x: 0, y: -269)
            
            
            
            // stats
            Text(safeWord(at: accnum(), element: 2, in: word))
                .font(.custom("ByteBounce", size: 50)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x: -110, y: -110)
            
            //des
            Text("Des--")
                .font(.custom("ByteBounce", size: 55)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:-115 , y: 30)
            
            
            
            
            //des text
            Text(safeWord(at: accnum(), element: 5, in: word))
                .font(.custom("ByteBounce", size: 28)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:-65 , y: 110)
            
            
            //consistent
            Text("consistent")
                .font(.custom("ByteBounce", size: 28)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:-125 , y: 400)
            
            
            
            
            //accurate
            Text("accurate")
                .font(.custom("ByteBounce", size: 28)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:140 , y: 400)
            
            
            
            
            //activity
            Text("activity")
                .font(.custom("ByteBounce", size: 28)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:5, y: 190)
            
            
            
            
            //Min
            Text(safeWord(at: accnum(), element: 3, in: word))
                .font(.custom("ByteBounce", size: 50)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:130 , y: 65)
            
            
            //Meal
            Text(safeWord(at: accnum(), element: 4, in: word))
                .font(.custom("ByteBounce", size: 45)) // Use custom font
                .foregroundColor(.white) // Ensure it contrasts with the background
                .padding() // Add padding for spacing
                .frame(maxWidth: .infinity, alignment: .top) // Align text at the top
                .offset(x:145 , y: 145)
            
            
            
            
            
            Triangle(
                point1: CGPoint(x: safeNum(at: accnum(), element: 0, in: nu), y: safeNum(at: accnum(), element: 1, in: nu)),  // Top point
                point2: CGPoint(x: safeNum(at: accnum(), element: 2, in: nu), y: safeNum(at: accnum(), element: 3, in: nu)), // Bottom-left point
                point3: CGPoint(x: safeNum(at: accnum(), element: 4, in: nu), y:safeNum(at: accnum(), element: 5, in: nu)) // Bottom-right point
            )
            .fill(Color.green.opacity(0.5)) // Semi-transparent fill
            .frame(width: 200, height: 200) // Adjust size
            .offset(x: 5, y: 293)
            
            
            
            
            // to be countuned button 
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

struct Pgpro_Previews: PreviewProvider {
    static var previews: some View {
        Pgpro()
    }
}

