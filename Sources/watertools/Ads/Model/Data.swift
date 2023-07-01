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
        "de": "Bekommen",
        "fr": "Obtenir",
        "es": "Obtener",
    ],
    "skip_btn": [
        "en": "Skip Ad",
        "ru": "Пропустить",
        "kk": "Өткізіп жіберу",
        "de": "Überspringen",
        "fr": "Sauter",
        "es": "Sauter",
    ]
]

public let MyApps: [Ad] = [
    Ad(id: 1,
       name:[
        "en" : "MoneyGuard",
        "ru" : "MoneyGuard",
        "kk" : "MoneyGuard",
        "de" : "MoneyGuard",
        "fr" : "MoneyGuard",
        "es" : "MoneyGuard",
       ],
       subtitle: [
        "en":"Empower Your Finances",
        "ru":"Достигай финансовых вершин!",
        "kk":"Қаржылық шыңдарға жетіңіз!",
        "de":"Stärken Sie Ihre Finanzen",
        "fr":"Renforcez Vos Finances",
        "es":"Potencie Sus Finanzas",
       ],
       caption:
        [
         "en":"Empower Your Finances - Seamlessly Track, Budget, and Grow Your Money. Take control with our intuitive interface, insightful analytics, and powerful tools.",
         "ru":"Расширьте возможности своих финансов - легко отслеживайте, составляйте бюджет и приумножайте свои деньги. Возьмите все под свой контроль с помощью мощных инструментов.",
         "kk":"Қаржыңызды кеңейтіңіз-оңай қадағалаңыз, бюджет жасаңыз және ақшаңызды көбейтіңіз. Барлығын қуатты құралдармен бақылауға алыңыз.",
         "de":"Stärken Sie Ihre Finanzen - Verfolgen, budgetieren und steigern Sie Ihr Geld nahtlos. Übernehmen Sie die Kontrolle mit unserer intuitiven Benutzeroberfläche, aufschlussreichen Analysen und leistungsstarken Tools.",
         "fr":"Renforcez vos finances-Suivez, budgétisez et Développez Votre Argent de manière transparente. Prenez le contrôle avec notre interface intuitive, nos analyses perspicaces et nos outils puissants.",
         "es":"Potencie Sus Finanzas: Realice un Seguimiento, Presupueste y Aumente Su Dinero Sin Problemas. Tome el control con nuestra interfaz intuitiva, análisis perspicaces y potentes herramientas.",
        ],
       icon: "MoneyGuardApp",
       previews: [
        "en":["moneyguard1EN","moneyguard2EN","moneyguard3EN","moneyguard4EN"],
        "ru":["moneyguard1RU","moneyguard2RU","moneyguard3RU","moneyguard4RU"],
        "kk":["moneyguard1RU","moneyguard2RU","moneyguard3RU","moneyguard4RU"],
        "de":["moneyguard1EN","moneyguard2EN","moneyguard3EN","moneyguard4EN"],
        "fr":["moneyguard1EN","moneyguard2EN","moneyguard3EN","moneyguard4EN"],
        "es":["moneyguard1EN","moneyguard2EN","moneyguard3EN","moneyguard4EN"],
       ],
       description: [
        "en":"Discover the Ultimate Financial Management App that Puts You in Control. Our feature-rich application is designed to empower you with a comprehensive suite of tools and functionalities. Effortlessly track your income and expenses, set budgets, and gain valuable insights with our intuitive interface and powerful analytics. Stay on top of your financial goals by setting savings targets and monitoring your progress. Make informed investment decisions with real-time market data and personalized recommendations. Securely connect your accounts for automatic transaction syncing and receive smart notifications for bill payments and upcoming due dates. With our app, financial management has never been easier or more accessible. Take charge of your financial future today and experience the power of our app's capabilities. Download now and embark on a journey towards financial success!",
        "ru":"Откройте для себя идеальное приложение для управления финансами, которое позволяет вам контролировать ситуацию. Наше многофункциональное приложение разработано для того, чтобы предоставить вам полный набор инструментов и функциональных возможностей. Легко отслеживайте свои доходы и расходы, устанавливайте бюджеты и получайте ценную информацию с помощью нашего интуитивно понятного интерфейса и мощной аналитики. Следите за достижением своих финансовых целей, устанавливая целевые показатели сбережений и отслеживая свой прогресс. Принимайте обоснованные инвестиционные решения с использованием рыночных данных в режиме реального времени и персонализированных рекомендаций. Надежно подключайте свои учетные записи для автоматической синхронизации транзакций и получайте интеллектуальные уведомления об оплате счетов и предстоящих сроках оплаты. С помощью нашего приложения управление финансами еще никогда не было таким простым и доступным. Возьмите на себя ответственность за свое финансовое будущее уже сегодня и ощутите всю мощь возможностей нашего приложения. Скачивайте прямо сейчас и отправляйтесь в путешествие к финансовому успеху!",
        "kk":"Жағдайды бақылауға мүмкіндік беретін тамаша қаржылық басқару қолданбасын ашыңыз. Біздің көпфункционалды қосымшамыз сізге құралдар мен функционалдылықтың толық жиынтығын ұсынуға арналған. Кірістер мен шығыстарды оңай қадағалаңыз, бюджеттерді белгілеңіз және интуитивті интерфейс пен қуатты аналитика арқылы құнды ақпарат алыңыз. Жинақтау мақсаттарын белгілеу және үлгеріміңізді бақылау арқылы қаржылық мақсаттарыңызға жетуді қадағалаңыз. Нақты уақыттағы нарықтық деректерді және жеке ұсыныстарды қолдана отырып, негізделген инвестициялық шешімдер қабылдаңыз. Транзакцияларды автоматты түрде синхрондау үшін есептік жазбаларыңызды мықтап қосыңыз және шоттарды төлеу және алдағы төлем мерзімі туралы ақылды хабарламалар алыңыз. Біздің қосымшаның көмегімен қаржыны басқару ешқашан оңай және қол жетімді болған емес. Бүгін сіздің қаржылық болашағыңыз үшін жауапкершілікті алыңыз және біздің қосымшаның барлық мүмкіндіктерін сезініңіз. Дәл қазір жүктеп алыңыз және қаржылық табысқа жету үшін саяхатқа шығыңыз!",
        "de":"Entdecken Sie die ultimative Finanzmanagement-App, mit der Sie die Kontrolle behalten. Unsere funktionsreiche Anwendung wurde entwickelt, um Ihnen eine umfassende Suite von Tools und Funktionen zur Verfügung zu stellen. Verfolgen Sie mühelos Ihre Einnahmen und Ausgaben, legen Sie Budgets fest und gewinnen Sie wertvolle Einblicke mit unserer intuitiven Benutzeroberfläche und leistungsstarken Analysen. Behalten Sie Ihre finanziellen Ziele im Auge, indem Sie Sparziele festlegen und Ihre Fortschritte überwachen. Treffen Sie fundierte Anlageentscheidungen mit Echtzeit-Marktdaten und personalisierten Empfehlungen. Verbinden Sie Ihre Konten sicher für die automatische Transaktionssynchronisierung und erhalten Sie intelligente Benachrichtigungen über Rechnungszahlungen und bevorstehende Fälligkeitstermine. Mit unserer App war das Finanzmanagement noch nie einfacher und zugänglicher. Übernehmen Sie noch heute die Verantwortung für Ihre finanzielle Zukunft und erleben Sie die Leistungsfähigkeit unserer App. Laden Sie es jetzt herunter und begeben Sie sich auf eine Reise zum finanziellen Erfolg!",
        "fr":"Découvrez l'Application de Gestion Financière Ultime qui Vous donne le Contrôle. Notre application riche en fonctionnalités est conçue pour vous offrir une suite complète d'outils et de fonctionnalités. Suivez sans effort vos revenus et dépenses, définissez des budgets et obtenez des informations précieuses grâce à notre interface intuitive et à nos analyses puissantes. Restez au top de vos objectifs financiers en fixant des objectifs d'épargne et en surveillant vos progrès. Prenez des décisions d'investissement éclairées avec des données de marché en temps réel et des recommandations personnalisées. Connectez en toute sécurité vos comptes pour la synchronisation automatique des transactions et recevez des notifications intelligentes pour les paiements de factures et les dates d'échéance à venir. Avec notre application, la gestion financière n'a jamais été aussi simple et accessible. Prenez en charge votre avenir financier dès aujourd'hui et découvrez la puissance des capacités de notre application. Téléchargez maintenant et embarquez pour un voyage vers la réussite financière!",
        "es":"Descubra la Aplicación de Administración Financiera Definitiva que Lo Pone en Control. Nuestra aplicación rica en funciones está diseñada para brindarle un conjunto completo de herramientas y funcionalidades. Realice un seguimiento de sus ingresos y gastos sin esfuerzo, establezca presupuestos y obtenga información valiosa con nuestra interfaz intuitiva y potentes análisis. Manténgase al tanto de sus metas financieras estableciendo objetivos de ahorro y monitoreando su progreso. Tome decisiones de inversión informadas con datos de mercado en tiempo real y recomendaciones personalizadas. Conecte de forma segura sus cuentas para la sincronización automática de transacciones y reciba notificaciones inteligentes para pagos de facturas y próximas fechas de vencimiento. Con nuestra aplicación, la administración financiera nunca ha sido más fácil ni más accesible. Tome las riendas de su futuro financiero hoy y experimente el poder de las capacidades de nuestra aplicación. ¡Descárguelo ahora y embárquese en un viaje hacia el éxito financiero!",
       ],
       url: "https://apps.apple.com/us/app/moneyguard-money-manager/id6450608644"),
    
    Ad(id: 2,
       name: [
           "en" : "SpeedStory",
           "ru" : "SpeedStory",
           "kk" : "SpeedStory",
           "de" : "SpeedStory",
           "fr" : "SpeedStory",
           "es" : "SpeedStory",
       ],
       subtitle: [
        "en":"Realtime Speed & Route Logging",
        "ru":"Спидометр & История Поездки",
        "kk":"Спидометр & Саяхат Тарихы",
        "de":"Echtzeit-Geschwindigkeits- und Routenprotokollierung",
        "fr":"Journalisation de la Vitesse et des itinéraires en temps réel",
        "es":"Registro de Velocidad y Ruta en tiempo real",
       ],
       caption: [
        "en":"Take Your Driving Experience to the Next Level with SpeedStory - Speedometer&Route. Effortlessly track your speed, distance, and routes in real-time.",
        "ru":"Поднимите свой опыт вождения на новый уровень с SpeedStory - Speedometer & Routes. Легко отслеживайте свою скорость, расстояние и маршруты в режиме реального времени.",
        "kk":"Поднимите свой опыт вождения на новый уровень с SpeedStory - Speedometer & Routes. Легко отслеживайте свою скорость, расстояние и маршруты в режиме реального времени.",
        "de":"Bringen Sie Ihr Fahrerlebnis mit Speed Story - Tachometer und Route auf die nächste Stufe. Verfolgen Sie mühelos Ihre Geschwindigkeit, Distanz und Routen in Echtzeit.",
        "fr":"Faites passer votre expérience de conduite au niveau supérieur avec Speed Story - Compteur de vitesse et Itinéraire. Suivez sans effort votre vitesse, votre distance et vos itinéraires en temps réel.",
        "es":"Lleva tu experiencia de conducción al siguiente Nivel con Speed Story: Velocímetro y ruta. Rastrea sin esfuerzo tu velocidad, distancia y rutas en tiempo real.",
       ],
       icon: "SpeedStoryApp",
       previews: [
        "en":["speedstory1EN","speedstory2EN","speedstory3EN"],
        "ru":["speedstory1RU","speedstory2RU","speedstory3RU"],
        "kk":["speedstory1RU","speedstory2RU","speedstory3RU"],
        "de":["speedstory1EN","speedstory2EN","speedstory3EN"],
        "fr":["speedstory1EN","speedstory2EN","speedstory3EN"],
        "es":["speedstory1EN","speedstory2EN","speedstory3EN"],
       ],
       description: [
        "en":"Elevate your driving experience with SpeedStory - Speedometer&Route. Our powerful app combines accurate speed monitoring and detailed route tracking to provide you with valuable insights. Stay in control of your speed, record your routes, and analyze your driving patterns. With a sleek interface and user-friendly features, SpeedStory is your ultimate driving companion. Download now and embark on a journey of enhanced driving performance and safety!",
        "ru":"Повысьте свой опыт вождения с помощью SpeedStory - Speedometer & Routes. Наше приложение сочетает в себе точный мониторинг скорости и отслеживание маршрута, чтобы предоставить вам ценную информацию о поездке. Контролируйте свою скорость, записывайте маршруты и анализируйте свои привычки вождения. Благодаря понятному интерфейсу и удобным функциям SpeedStory станет вашим идеальным спутником за рулем. Скачивайте прямо сейчас и отправляйтесь в путешествие с комфортом и безопасностью!",
        "kk":"Speed Story-Speedometer & Routes көмегімен жүргізу тәжірибеңізді арттырыңыз. Біздің қолданба сізге сапар туралы құнды ақпарат беру үшін жылдамдықты дәл бақылауды және маршрутты бақылауды біріктіреді. Жылдамдықты бақылаңыз, маршруттарды жазыңыз және жүргізу әдеттеріңізді талдаңыз. Түсінікті интерфейс пен ыңғайлы мүмкіндіктердің арқасында SpeedStory сіздің тамаша рульдік серігіңіз болады. Дәл қазір жүктеп алыңыз және жайлылық пен қауіпсіздікпен саяхатқа шығыңыз!",
        "de":"Steigern Sie Ihr Fahrerlebnis mit Speed Story - Tachometer und Route. Unsere leistungsstarke App kombiniert genaue Geschwindigkeitsüberwachung und detaillierte Routenverfolgung, um Ihnen wertvolle Erkenntnisse zu liefern. Behalten Sie die Kontrolle über Ihre Geschwindigkeit, zeichnen Sie Ihre Routen auf und analysieren Sie Ihre Fahrmuster. Mit einer schlanken Benutzeroberfläche und benutzerfreundlichen Funktionen ist SpeedStory Ihr ultimativer Fahrbegleiter. Laden Sie es jetzt herunter und begeben Sie sich auf eine Reise mit verbesserter Fahrleistung und Sicherheit!",
        "fr":"Améliorez votre expérience de conduite avec Speed Story-Compteur de vitesse et itinéraire. Notre puissante application combine une surveillance précise de la vitesse et un suivi détaillé des itinéraires pour vous fournir des informations précieuses. Gardez le contrôle de votre vitesse, enregistrez vos itinéraires et analysez vos habitudes de conduite. Avec une interface élégante et des fonctionnalités conviviales, SpeedStory est votre compagnon de conduite ultime. Téléchargez maintenant et embarquez pour un voyage de performances de conduite et de sécurité améliorées!",
        "es":"Mejore su experiencia de conducción con Speed Story: Velocímetro y ruta. Nuestra potente aplicación combina un control preciso de la velocidad y un seguimiento detallado de la ruta para proporcionarle información valiosa. Mantenga el control de su velocidad, registre sus rutas y analice sus patrones de conducción. Con una interfaz elegante y funciones fáciles de usar, SpeedStory es tu mejor compañero de conducción. Descárguelo ahora y embárquese en un viaje de mayor rendimiento y seguridad en la conducción.",
       ],
       url: "https://apps.apple.com/us/app/speedstory-speedometer-route/id6450614203")

]
