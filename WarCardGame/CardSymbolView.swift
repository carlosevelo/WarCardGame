//
//  CardSymbolView.swift
//  WarCardGame
//
//  Created by Carlos Evelo on 10/10/22.
//

import SwiftUI

struct CardSymbolView: View {
    var cardSuit: String
    var cardValue: Int
    
    var body: some View {
        switch cardValue {
        case 1:
            Text(cardSuit)
        case 2:
            VStack {
                Text(cardSuit)
                Spacer()
                Text(cardSuit)
            }
        case 3:
            VStack {
                Text(cardSuit)
                Spacer()
                Text(cardSuit)
                Spacer()
                Text(cardSuit)
            }
        case 4:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 5:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 6:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 7:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 8:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 9:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 10:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                        .font(.body)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
                VStack {
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                    Text(cardSuit)
                }
                Spacer()
            }
        case 11:
            HStack {
                Spacer()
                VStack {
                    Text(cardSuit)
                        .font(.largeTitle)
                }
                Spacer()
            }
        case 12:
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                }
                Spacer()
            }
        case 13:
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text(cardSuit)
                    Spacer()
                }
                Spacer()
            }
        default:
            Text(cardSuit)
        }
    }
}

struct CardSymbolView_Previews: PreviewProvider {
    static var previews: some View {
        CardSymbolView(cardSuit: "♥️", cardValue: 11)
    }
}
