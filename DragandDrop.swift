import SwiftUI

struct DraggableView: View {
    @State private var position = CGSize.zero

    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 100, height: 100)
            .offset(x: position.width, y: position.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        position = value.translation
                    }
                    .onEnded { _ in
                        withAnimation(.spring()) {
                            position = .zero
                        }
                    }
            )
    }
}
