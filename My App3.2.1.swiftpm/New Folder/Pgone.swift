import SwiftUI

struct Pgone: View {
    var body: some View {
        VStack {
            Image("Oak2.0") // Replace with your image name
                .resizable()
                .scaledToFit()
                .frame(width: 690, height: 690)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // Optional: Set background color
    }
   
}

struct Pgone_Previews: PreviewProvider {
    static var previews: some View {
        Pgone()
    }
}

