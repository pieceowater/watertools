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

public let localizedButtons: [String: [String: String]] = [
    "download_btn": [
        "en": "Get App",
        "ru": "Скачать",
        "kk": "Жүктеу",
    ],
    "skip_btn": [
        "en": "Skip Ad",
        "ru": "Пропустить",
        "kk": "Өткізіп жіберу",
    ]
]

public let MyApps: [Ad] = [
    Ad(id: 1,
       name:[
        "en" : "MoneyGuard",
        "ru" : "MoneyGuard",
        "kk" : "MoneyGuard",
       ],
       subtitle: [
        "en":"Empower Your Finances",
        "ru":"Достигай финансовых вершин!",
        "kk": "Қаржылық шыңдарға жетіңіз!",
       ],
       caption:
        [
         "en":"Empower Your Finances - Seamlessly Track, Budget, and Grow Your Money. Take control with our intuitive interface, insightful analytics, and powerful tools.",
         "ru":"Расширьте возможности своих финансов - легко отслеживайте, составляйте бюджет и приумножайте свои деньги. Возьмите все под свой контроль с помощью мощных инструментов.",
         "kk": "Қаржыңызды кеңейтіңіз-оңай қадағалаңыз, бюджет жасаңыз және ақшаңызды көбейтіңіз. Барлығын қуатты құралдармен бақылауға алыңыз.",
        ],
       icon: "MoneyGuardApp",
       previews: [
        "en":["moneyguard1EN","moneyguard2EN","moneyguard3EN","moneyguard4EN"],
        "ru":["moneyguard1RU","moneyguard2RU","moneyguard3RU","moneyguard4RU"],
        "kk":["moneyguard1RU","moneyguard2RU","moneyguard3RU","moneyguard4RU"],
       ],
       description: [
        "en":"Discover the Ultimate Financial Management App that Puts You in Control. Our feature-rich application is designed to empower you with a comprehensive suite of tools and functionalities. Effortlessly track your income and expenses, set budgets, and gain valuable insights with our intuitive interface and powerful analytics. Stay on top of your financial goals by setting savings targets and monitoring your progress. Make informed investment decisions with real-time market data and personalized recommendations. Securely connect your accounts for automatic transaction syncing and receive smart notifications for bill payments and upcoming due dates. With our app, financial management has never been easier or more accessible. Take charge of your financial future today and experience the power of our app's capabilities. Download now and embark on a journey towards financial success!",
        "ru":"Откройте для себя идеальное приложение для управления финансами, которое позволяет вам контролировать ситуацию. Наше многофункциональное приложение разработано для того, чтобы предоставить вам полный набор инструментов и функциональных возможностей. Легко отслеживайте свои доходы и расходы, устанавливайте бюджеты и получайте ценную информацию с помощью нашего интуитивно понятного интерфейса и мощной аналитики. Следите за достижением своих финансовых целей, устанавливая целевые показатели сбережений и отслеживая свой прогресс. Принимайте обоснованные инвестиционные решения с использованием рыночных данных в режиме реального времени и персонализированных рекомендаций. Надежно подключайте свои учетные записи для автоматической синхронизации транзакций и получайте интеллектуальные уведомления об оплате счетов и предстоящих сроках оплаты. С помощью нашего приложения управление финансами еще никогда не было таким простым и доступным. Возьмите на себя ответственность за свое финансовое будущее уже сегодня и ощутите всю мощь возможностей нашего приложения. Скачивайте прямо сейчас и отправляйтесь в путешествие к финансовому успеху!",
        "kk": "Жағдайды бақылауға мүмкіндік беретін тамаша қаржылық басқару қолданбасын ашыңыз. Біздің көпфункционалды қосымшамыз сізге құралдар мен функционалдылықтың толық жиынтығын ұсынуға арналған. Кірістер мен шығыстарды оңай қадағалаңыз, бюджеттерді белгілеңіз және интуитивті интерфейс пен қуатты аналитика арқылы құнды ақпарат алыңыз. Жинақтау мақсаттарын белгілеу және үлгеріміңізді бақылау арқылы қаржылық мақсаттарыңызға жетуді қадағалаңыз. Нақты уақыттағы нарықтық деректерді және жеке ұсыныстарды қолдана отырып, негізделген инвестициялық шешімдер қабылдаңыз. Транзакцияларды автоматты түрде синхрондау үшін есептік жазбаларыңызды мықтап қосыңыз және шоттарды төлеу және алдағы төлем мерзімі туралы ақылды хабарламалар алыңыз. Біздің қосымшаның көмегімен қаржыны басқару ешқашан оңай және қол жетімді болған емес. Бүгін сіздің қаржылық болашағыңыз үшін жауапкершілікті алыңыз және біздің қосымшаның барлық мүмкіндіктерін сезініңіз. Дәл қазір жүктеп алыңыз және қаржылық табысқа жету үшін саяхатқа шығыңыз!",
       ],
       url: "https://apps.apple.com/us/app/moneyguard-money-manager/id6450608644"),
    
    Ad(id: 2,
       name: [
           "en" : "SpeedStory",
           "ru" : "SpeedStory",
           "kk" : "SpeedStory",
       ],
       subtitle: [
        "en":"Realtime Speed & Route Logging",
        "ru":"Спидометр & История Поездки",
        "kk":"Спидометр & Саяхат Тарихы",
       ],
       caption: [
        "en":"Take Your Driving Experience to the Next Level with SpeedStory - Speedometer&Route. Effortlessly track your speed, distance, and routes in real-time.",
        "ru":"Поднимите свой опыт вождения на новый уровень с SpeedStory - Speedometer & Routes. Легко отслеживайте свою скорость, расстояние и маршруты в режиме реального времени.",
        "kk":"Поднимите свой опыт вождения на новый уровень с SpeedStory - Speedometer & Routes. Легко отслеживайте свою скорость, расстояние и маршруты в режиме реального времени.",
       ],
       icon: "SpeedStoryApp",
       previews: [
        "en":["speedstory1EN","speedstory2EN","speedstory3EN"],
        "ru":["speedstory1RU","speedstory2RU","speedstory3RU"],
        "kk":["speedstory1RU","speedstory2RU","speedstory3RU"],
       ],
       description: [
        "en":"Elevate your driving experience with SpeedStory - Speedometer&Route. Our powerful app combines accurate speed monitoring and detailed route tracking to provide you with valuable insights. Stay in control of your speed, record your routes, and analyze your driving patterns. With a sleek interface and user-friendly features, SpeedStory is your ultimate driving companion. Download now and embark on a journey of enhanced driving performance and safety!",
        "ru":"Повысьте свой опыт вождения с помощью SpeedStory - Speedometer & Routes. Наше приложение сочетает в себе точный мониторинг скорости и отслеживание маршрута, чтобы предоставить вам ценную информацию о поездке. Контролируйте свою скорость, записывайте маршруты и анализируйте свои привычки вождения. Благодаря понятному интерфейсу и удобным функциям SpeedStory станет вашим идеальным спутником за рулем. Скачивайте прямо сейчас и отправляйтесь в путешествие с комфортом и безопасностью!",
        "kk":"Speed Story-Speedometer & Routes көмегімен жүргізу тәжірибеңізді арттырыңыз. Біздің қолданба сізге сапар туралы құнды ақпарат беру үшін жылдамдықты дәл бақылауды және маршрутты бақылауды біріктіреді. Жылдамдықты бақылаңыз, маршруттарды жазыңыз және жүргізу әдеттеріңізді талдаңыз. Түсінікті интерфейс пен ыңғайлы мүмкіндіктердің арқасында SpeedStory сіздің тамаша рульдік серігіңіз болады. Дәл қазір жүктеп алыңыз және жайлылық пен қауіпсіздікпен саяхатқа шығыңыз!",
       ],
       url: "https://apps.apple.com/us/app/speedstory-speedometer-route/id6450614203")

]
