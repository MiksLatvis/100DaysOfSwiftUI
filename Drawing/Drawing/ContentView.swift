//
//  ContentView.swift
//  Drawing
//
//  Created by Miks Latvis on 01/03/2022.
//

import SwiftUI

var frameWidth = 200.0
var frameHeight = 80.0
var dataLines = 24
var dataPoints = 26

var TrendWeight = [104.4, 104.8, 104.8, 106.3, 105.2, 104.8, 104.2, 104.6, 104.5, 104.4, 104.3, 103.4, 104.0, 103.6]
var TrendLine = [103.5, 103.6, 103.7, 104.0, 104.1, 104.2, 104.2, 104.2, 104.2, 104.3, 104.3, 104.2, 104.2, 104.1, 104.1]

let minValue = Int(floor(TrendWeight.min() ?? 86))
var maxValue = Int(ceil(TrendWeight.max() ?? 106))

var valueRange = Double(maxValue-minValue)

struct ContentView: View {
    struct Bars: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            for i in 0...dataLines-1 {
                path.move(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: rect.minY))
                if i > 0 && ( i % 5 == 0 || i % 6 == 0) {
                    path.addLine(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: rect.maxY))
                } else {
                    path.addLine(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: rect.maxY-8))
                }
                
            }
            
            return path
        }
    }
    
    struct Info: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            for i in 0...dataLines-1 {
                let weight: Double
                
                if i < TrendWeight.count {
                    weight = TrendWeight[i]
                } else {
                    weight = 1 // Jāizdomā, ko iesākt, ja nav vērtības
                }
                
                let point = (rect.maxY) * ((Double(maxValue) - weight ) / valueRange )
                
                path.move(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: point ))
                path.addLine(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: point))
                
            }

            return path
        }
    }
    
    struct Trendline: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            var weight: Double
            weight = TrendLine[0]
            
            var point = (rect.maxY) * ((Double(maxValue) - weight ) / valueRange )
            
           
            path.move(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(0))), y: point ))
            
            for i in 0...dataLines-1 {
    
                if i < TrendLine.count {
                    weight = TrendLine[i]
                } else {
                    weight = Double(maxValue) - valueRange/2 // Jāizdomā, ko iesākt, ja nav vērtības
                }
                point = (rect.maxY) * ((Double(maxValue) - weight ) / valueRange )
                path.addLine(to: CGPoint(x: ((rect.maxX/Double(dataLines)*Double(i))), y: point))
                
            }
            
            return path
        }
    }
    
    var body: some View {
       
        ZStack{
            Bars()
                .stroke(.gray, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
                .frame(width: frameWidth-35, height: frameHeight)
            Trendline()
                .stroke(.red, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .frame(width: frameWidth-35, height: frameHeight)
            Info()
                .stroke(.white, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .frame(width: frameWidth-35, height: frameHeight)
            Text("You are loosing 0.7 kg per week")
                .font(.system(.caption, design: .rounded).weight(.heavy))
                .foregroundColor(.secondary)
                .position(x: (frameWidth-30)/2, y: 0 - 10)
                .frame(width: frameWidth, height: frameHeight)
            Text("\(maxValue)")
                .font(.system(.caption, design: .rounded).weight(.heavy))
                .foregroundColor(.secondary)
                .position(x: 0, y: 0 + 5)
                .frame(width: frameWidth, height: frameHeight, alignment: .leading)
            Text("\(minValue)")
                .font(.system(.caption, design: .rounded).weight(.heavy))
                .foregroundColor(.secondary)
                .position(x: 0, y: frameHeight - 5)
                .frame(width: frameWidth, height: frameHeight, alignment: .leading)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
