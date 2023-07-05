import SwiftUI

struct GrayCapsuleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption)
            .fontWeight(.bold)
            .padding(12)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85))
            .foregroundStyle(.gray)
            .clipShape(Capsule())
    }
}

struct BorderedCapsuleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.caption)
            .fontWeight(.bold)
            .padding(12)
            .background(Color.white)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(.black, lineWidth: 2)
            )
    }
}
