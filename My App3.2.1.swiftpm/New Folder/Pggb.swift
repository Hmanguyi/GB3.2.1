
import SwiftUI

struct Pggb: View {
    var body: some View {
        VStack {
            Image("GreenBaby") // Replace with your image name
                .resizable()
                .scaledToFit()
                .frame(width: 690, height: 690)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green) // Optional: Set background color
    }
    
}

struct Pggb_Previews: PreviewProvider {
    static var previews: some View {
        Pggb()
    }
}

