//
//  ContentView.swift
//  DragGestruePoint
//
//  Created by sako0602 on 2023/02/04.
//

import SwiftUI
//課題：中心に持ってきたい
struct ContentView: View {
    @State var position:CGSize = CGSize(width: 0, height: 0)
     
    var body: some View {
        
        GeometryReader { geometry in
            let drag = DragGesture()
                    .onChanged{ value in
                        print("***1posi", position)
                        self.position = value.translation
                        print("***2posi", position)
                    }
                    .onEnded{ value in
                        print(">>>1posi", position)
                        self.position = CGSize(width: 0, height: 0)
//                        self.position = CGSize(//現在地をプロパティに渡す
//                            width: value.startLocation.x + value.translation.width,
//                            height: value.startLocation.y + value.translation.height
//                        )//初期の値に追加されていく。
                        print(">>>2posi", position)
                    }
            
            VStack {
                Text("x: \(position.width)")
                Text("y:\(position.height)")

                    Image(systemName: "cross.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .position( //Viewの中央に画像を配置。移動分の座標は + position.[w]or[hight]
                                   //geometryで
                            x: geometry.size.width / 2 + position.width,
                            y: geometry.size.height / 2 + position.height
                        )
                        .gesture(drag)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
