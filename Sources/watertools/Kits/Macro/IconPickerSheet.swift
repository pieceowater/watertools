//
//  IconPickerSheet.swift
//  
//
//  Created by yury mid on 02.07.2023.
//

import SwiftUI

public struct IconPickerSheet: View {
    @State var selectedIcon: String
    var submitBtnText: String = "OK"
    var submitAction: (String) -> Void = {_ in }
    @Environment(\.presentationMode) var presentationMode
    
    public init(_ selectedIcon: String, submitBtnText: String = "OK", submitAction: @escaping (String) -> Void) {
        self._selectedIcon = State(initialValue: selectedIcon)
        self.submitBtnText = submitBtnText
        self.submitAction = submitAction
    }
    
    public var body: some View {
        VStack{
            Rectangle()
                .frame(width: 100, height: 5)
                .foregroundColor(Color.gray)
                .cornerRadius(5)
                .padding(.top, 15)
                .padding(.bottom, 10)
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(Icons.allCases, id: \.self) { icon in
                        Button(action: {
                            selectedIcon = icon.rawValue
                        }) {
                            Image(icon.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .padding(8)
                                .background(selectedIcon == icon.rawValue ? Color.accentColor.opacity(0.2) : Color.clear)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            
            watertools.PrimaryButton(submitBtnText) {
                submitAction(selectedIcon)
                presentationMode.wrappedValue.dismiss()
            }.padding(.horizontal)

        }
    }
    
    public enum Icons: String, CaseIterable {
        // Category: Positive
        case award
        case winner
        case good
        case beauty
        case carebeauty
        case gym
        case heal
        case drugs
        case pethealth
        case internet
        case kitchen
        case home
        case map
        case nofood
        case rolls
        case salad
        case shopping
        case time
        case water
        case width
        case event
        case flag
        case glass
        
        // Category: Negative
        case bad
        case bigdebt
        case debt
        case bigpizza
        case burger
        case coffe
        case pizza
        case pasta
        case recipe
        case foodbox
        case vending
        case gaming
        case ball
        case tennis
        
        // Category: Miscellaneous
        case calendar
        case education
        case fire
        case funeral
        case gift
        case guitar
        case help
        case key
        case fuel
        case love
        case megaphone
        case nosmoking
        case grass
        case plant
        case rainbow
        case banknotes
        case bowling
        case box
        case cards
        case coin
        case house
        case moneybag
        case wallet
        
        // Default Icon
        case `default`
        case default2
        case default3
        case default4
        case default5
        case default6
        case default7
        case default8
        case default9
        case default10
        case default11
        case default12
        case default13
        
        public var icon: String {
            switch self {
            case .award:
                return "award"
            case .good:
                return "good"
            case .beauty:
                return "beauty"
            case .carebeauty:
                return "carebeauty"
            case .gym:
                return "gym"
            case .heal:
                return "heal"
            case .pethealth:
                return "pethealth"
            case .internet:
                return "internet"
            case .kitchen:
                return "kitchen"
            case .home:
                return "home"
            case .map:
                return "map"
            case .nofood:
                return "nofood"
            case .rolls:
                return "rolls"
            case .salad:
                return "salad"
            case .shopping:
                return "shopping"
            case .time:
                return "time"
            case .water:
                return "water"
            case .width:
                return "width"
                
            case .bad:
                return "bad"
            case .bigdebt:
                return "bigdebt"
            case .debt:
                return "debt"
            case .bigpizza:
                return "bigpizza"
            case .burger:
                return "burger"
            case .coffe:
                return "coffe"
            case .foodbox:
                return "foodbox"
            case .fuel:
                return "fuel"
            case .gaming:
                return "gaming"
            case .pizza:
                return "pizza"
            case .pasta:
                return "pasta"
            case .recipe:
                return "recipe"
            case .ball:
                return "ball"
            case .tennis:
                return "tennis"
            case .calendar:
                return "calendar"
            case .education:
                return "education"
            case .drugs:
                return "drugs"
            case .fire:
                return "fire"
            case .funeral:
                return "funeral"
            case .gift:
                return "gift"
            case .grass:
                return "grass"
            case .guitar:
                return "guitar"
            case .help:
                return "help"
            case .key:
                return "key"
            case .love:
                return "love"
            case .megaphone:
                return "megaphone"
            case .nosmoking:
                return "nosmoking"
            case .plant:
                return "plant"
            case .rainbow:
                return "rainbow"
            case .vending:
                return "vending"
                
            case .winner:
                return "winner"
            case .event:
                return "event"
            case .flag:
                return "flag"
            case .glass:
                return "glass"
            case .banknotes:
                return "banknotes"
            case .bowling:
                return "bowling"
            case .box:
                return "box"
            case .cards:
                return "cards"
            case .coin:
                return "coin"
            case .house:
                return "house"
            case .moneybag:
                return "moneybag"
            case .wallet:
                return "wallet"
                
            case .default:
                return "default"
            case .default2:
                return "default2"
            case .default3:
                return "default3"
            case .default4:
                return "default4"
            case .default5:
                return "default5"
            case .default6:
                return "default6"
            case .default7:
                return "default7"
            case .default8:
                return "default8"
            case .default9:
                return "default9"
            case .default10:
                return "default10"
            case .default11:
                return "default11"
            case .default12:
                return "default12"
            case .default13:
                return "default13"
                
            }
        }
    }
}
