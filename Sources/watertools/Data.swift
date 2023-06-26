//
//  Data.swift
//  watertools
//
//  Created by yury mid on 25.06.2023.
//

import Foundation

public struct Ad {
    let id: Int
    let name: [String:String]
    let subtitle: [String:String]
    let caption: [String:String]
    let icon: String
    let previews: [String:[String]]
    let description: [String:String]
    let url: String
}

public let MyApps: [Ad] = [
    Ad(id: 1,
       name:[
        "en" : "MoneyGuard",
        "ru" : "MoneyGuard"
       ],
       subtitle: [
        "en":"Empower Your Finances",
        "ru":""
       ],
       caption:
        [
         "en":"Empower Your Finances - Seamlessly Track, Budget, and Grow Your Money. Take control with our intuitive interface, insightful analytics, and powerful tools.",
         "ru":""
        ],
       icon: "MoneyGuardApp",
       previews: [
        "en":["moneyguard1en","moneyguard2en","moneyguard3en","moneyguard4en"],
        "ru":["moneyguard1ru","moneyguard2ru","moneyguard3ru","moneyguard4ru"]
       ],
       description: [
        "en":"Discover the Ultimate Financial Management App that Puts You in Control. Our feature-rich application is designed to empower you with a comprehensive suite of tools and functionalities. Effortlessly track your income and expenses, set budgets, and gain valuable insights with our intuitive interface and powerful analytics. Stay on top of your financial goals by setting savings targets and monitoring your progress. Make informed investment decisions with real-time market data and personalized recommendations. Securely connect your accounts for automatic transaction syncing and receive smart notifications for bill payments and upcoming due dates. With our app, financial management has never been easier or more accessible. Take charge of your financial future today and experience the power of our app's capabilities. Download now and embark on a journey towards financial success!",
        "ru":""
       ],
       url: "https://apps.apple.com/us/app/moneyguard-money-manager/id6450608644"),
    Ad(id: 2,
       name: [
           "en" : "SpeedStory",
           "ru" : "SpeedStory"
       ],
       subtitle: [
        "en":"Realtime Speed & Route Logging",
        "ru":""
       ],
       caption: [
        "en":"Take Your Driving Experience to the Next Level with SpeedStory - Speedometer&Route. Effortlessly track your speed, distance, and routes in real-time.",
        "ru":""
       ],
       icon: "SpeedStoryApp",
       previews: [
        "en":["speedstory1en","speedstory2en","speedstory3en"],
        "ru":["speedstory1ru","speedstory2ru","speedstory3ru"],
       ],
       description: [
        "en":"Elevate your driving experience with SpeedStory - Speedometer&Route. Our powerful app combines accurate speed monitoring and detailed route tracking to provide you with valuable insights. Stay in control of your speed, record your routes, and analyze your driving patterns. With a sleek interface and user-friendly features, SpeedStory is your ultimate driving companion. Download now and embark on a journey of enhanced driving performance and safety!",
        "ru":""
       ],
       url: "https://apps.apple.com/us/app/speedstory-speedometer-route/id6450614203")

]
