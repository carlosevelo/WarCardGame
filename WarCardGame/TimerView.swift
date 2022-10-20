//
//  TimerView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/11/22.
//

import SwiftUI

struct TimerView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise = true

    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: Double = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        var p = Path()

        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return p
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(startAngle: Angle(degrees: 360-90), endAngle: Angle(degrees: 25-90))
            .foregroundColor(.orange)
            .opacity(0.4)
            .padding(50)
    }
}
