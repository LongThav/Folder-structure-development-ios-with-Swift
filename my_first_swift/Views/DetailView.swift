import SwiftUI

struct DetailView: View {
    var body: some View {
        VStack {
            Text("This is the Detail Screen")
                .font(.title)
                .padding()
            
            Button("Back to Home") {
                // Handle the logic to go back, possibly by changing the route
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .navigationTitle("Detail")
    }
}
