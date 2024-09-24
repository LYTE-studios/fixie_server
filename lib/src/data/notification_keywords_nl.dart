List<String> fallbackNl = [
  "Elke kleine stap telt. Blijf vooruitgaan!",
  "Geloof in jezelf—je bent in staat tot geweldige dingen.",
  "Uitdagingen maken het leven interessant; ze overwinnen maakt het leven betekenisvol.",
  "Succes is niet definitief, falen is niet fataal: het is de moed om door te gaan die telt.",
  "Je bent sterker dan je denkt. Blijf doorgaan!",
  "Je reis naar succes begint met één stap. Zet hem vandaag!",
  "Vooruitgang, hoe klein ook, is nog steeds vooruitgang. Blijf duwen!",
  "De beste tijd om te beginnen was gisteren. De op één na beste tijd is nu!",
  "Droom groot, werk hard en blijf consistent—je kunt dit!",
  "Vertrouw op het proces. Elke dag kom je dichter bij je doelen.",
];

Map<String, Map<String, List<String>>> notificationKeywordsNl = {
  "1": {
    "keywords": ["hardlopen", "joggen", "pad", "sprinten"],
    "sentences": [
      "Klaar voor de start, sprint! Trek je hardloopschoenen aan voor het avontuur van vandaag!",
      "Betreed het pad en voel de opwinding—je beste hardloopsessie staat voor de deur!",
      "Elke jog brengt je dichter bij je doelen. Kom in beweging en blijf lachen!",
      "Het is een geweldige dag om te rennen. Het pad naar vooruitgang ligt aan je voeten!",
      "Zet je 'kan-niets' om in 'kan-ik-wel' bij elke stap vooruit die je vandaag zet!",
      "Voeten op het pad, hart in de lucht—laten we deze run onvergetelijk maken!"
    ]
  },
  "2": {
    "keywords": ["yoga", "rekken", "meditatie", "poses"],
    "sentences": [
      "Rol je mat uit en omarm de rust. Het is tijd voor yoga!",
      "Adem rust in, adem stress uit. Je yogasessie wacht op je.",
      "Laat je lichaam meegaan met de poses—voel je sterker en meer gecentreerd bij elke rek.",
      "Yoga is niet alleen buigen, het gaat om transcenderen. Klaar om te stijgen?",
      "Verbind met je innerlijke kracht in de yogapraktijk van vandaag. Namaste!",
      "Rek je weg naar sereniteit. Je mat, je heiligdom."
    ]
  },
  "3": {
    "keywords": ["studeren", "leren", "examen", "concentratie"],
    "sentences": [
      "Bereid je geest voor, het is studietijd! Laten we die boeken overwinnen.",
      "Focus op de pagina, je bent slechts een paar stappen verwijderd van het halen van dat examen!",
      "Leren is een reis, en elke pagina die wordt omgeslagen is een nieuwe horizon.",
      "Richt je op succes—vandaag is de dag om nieuwe kennis te beheersen!",
      "Blijf kalm en studeer sterk. Je harde werk zal zich uitbetalen!",
      "Een examen is slechts een tussenstop op je educatieve reis. Je kunt dit!"
    ]
  },
  "4": {
    "keywords": ["budgetteren", "sparen", "financiën", "geld"],
    "sentences": [
      "Klaar om je spaardoel te bereiken? Elke cent telt!",
      "Zie je spaargeld groeien; stel een budget op en houd je eraan!",
      "Wijs met geld omgaan bevrijdt je. Laten we je financiële toekomst plannen!",
      "Beveilig je dromen één dollar per keer. Je portemonnee steunt je!",
      "Financiële vrijheid is binnen handbereik—begin met een solide budget!",
      "Geldbeheer is een kunst, en jij bent de kunstenaar. Schilder je toekomst helder!"
    ]
  },
  "5": {
    "keywords": ["netwerken", "verbinden", "ontmoeten", "interactie"],
    "sentences": [
      "Maak een nieuwe connectie, open een nieuwe deur! Netwerken is je sleutel tot kansen.",
      "Het gaat niet alleen om wie je kent, maar om wie je vandaag ontmoet. Breid je netwerk uit!",
      "Elke handdruk heeft een verhaal. Wie zal jij als volgende ontmoeten?",
      "Netwerken gaat over het creëren van banden. Ga ervoor, bouw je professionele familie!",
      "Connecties verlichten carrières—tijd om te schitteren met je netwerkvaardigheden!",
      "Interactie, betrokkenheid en groei. Je netwerk is je netto waarde!"
    ]
  },
  "6": {
    "keywords": ["dieet", "voeding", "gezondheid", "eten"],
    "sentences": [
      "Voed je lichaam goed en voel je geweldig—begin met gezonde keuzes!",
      "Goed eten is een vorm van zelfrespect. Trakteer jezelf op voeding!",
      "Gezondheid is rijkdom, en het begint op je bord. Eet smakelijk!",
      "Transformeer je dieet, transformeer je leven. Elke maaltijd is een nieuwe kans!",
      "Voed om te bloeien. Je lichaam verdient het beste!",
      "Maak je maaltijden waardevol. Goede voeding is de basis van goede gezondheid."
    ]
  },
  "7": {
    "keywords": ["meditatie", "mindfulness", "ontspannen", "focus"],
    "sentences": [
      "Maak je geest leeg, omarm de stilte. Meditatie is jouw pad naar vrede.",
      "Mindfulness is een reis, geen bestemming. Neem even de tijd om gewoon te zijn.",
      "Ontspan diep, adem langzaam en laat je zorgen los met meditatie.",
      "Focus van binnen, ontdek je innerlijke kracht door vandaag te mediteren.",
      "Laat elke ademhaling je leiden naar een kalmer, meer gecentreerd zelf.",
      "Omarm stilte, vind rust. Jouw moment voor meditatie is nu."
    ]
  },
  "8": {
    "keywords": ["schrijven", "creativiteit", "dagboek", "verhaal"],
    "sentences": [
      "Laat je creativiteit los, laat de woorden stromen. Je volgende grote verhaal wacht.",
      "Journaliseer je reis, elke pagina een pad naar zelfontdekking.",
      "Creëer je wereld met woorden, schrijf het verhaal dat je wilt lezen.",
      "Creativiteit bloeit op papier. Pak je pen en transformeer gedachten in verhalen.",
      "Jouw dagboek is jouw canvas—schilder het met de verhalen van je leven.",
      "Schrijven gaat niet alleen over het vertellen van verhalen, het gaat over het beleven ervan via jouw woorden."
    ]
  },
  "9": {
    "keywords": ["schilderen", "kunst", "canvas", "kwast"],
    "sentences": [
      "Breng je visies tot leven, streek voor streek. Het canvas wacht op jouw meesterwerk.",
      "Kunst is vrijheid—druk het vandaag uit op je canvas.",
      "Doop je kwast in je ziel en schilder je dromen.",
      "Elke streek vertelt een verhaal, maak die van jou levendig.",
      "Canvas en kleuren, jouw gereedschappen voor expressie—schilder je stemming vandaag.",
      "Kunst wordt niet alleen gezien, het wordt gevoeld. Laat je schilderij de zintuigen prikkelen."
    ]
  },
  "10": {
    "keywords": ["reizen", "verkennen", "avontuur", "ontdekken"],
    "sentences": [
      "Pak je tassen, avontuur roept! De wereld is groot en wacht op jouw stappen.",
      "Verken meer dan alleen plaatsen—ontdek jezelf met elke reis.",
      "Avontuur is slechts een beslissing verwijderd. Waar ga je hierna naartoe?",
      "Ontdek nieuwe horizonten, elke reis brengt een nieuw verhaal in je leven.",
      "Reis ver genoeg, je ontmoet jezelf. Begin vandaag aan jouw reis.",
      "Verkenning is de essentie van de menselijke geest. Omarm het op je reizen."
    ]
  },
  "11": {
    "keywords": ["tuinieren", "planten", "natuur", "groeien"],
    "sentences": [
      "Tuinieren is hoop planten. Bekijk je tuin, en optimisme, bloei.",
      "Omring jezelf met planten, kweek een tuin van vrede thuis.",
      "Het ritme van de natuur kalmeert de ziel—vind je ritme in de tuin.",
      "Laat je tuin groeien, laat je vrede groeien. Laat elke plant je kalmte leren.",
      "Planten is niet alleen over schoonheid, het gaat over het kweken van leven.",
      "Je tuin is een canvas—schilder het groen, kijk het gedijen."
    ]
  },
  "12": {
    "keywords": ["muziek", "melodie", "zingen", "instrument"],
    "sentences": [
      "Verlies jezelf in de melodie, laat muziek je ontsnapping zijn.",
      "Zing uit volle borst, elke noot een stukje van je verhaal.",
      "De juiste melodie kan je humeur herschrijven, speel verder!",
      "Muziek is de taal van de ziel—spreek het vloeiend vandaag.",
      "Pak je instrument en weef geluiden tot symfonieën.",
      "Laat muziek de lucht vullen, een melodie kan harten hoger tillen dan woorden."
    ]
  },
  "13": {
    "keywords": ["koken", "recept", "keuken", "maaltijd"],
    "sentences": [
      "Zet de hitte hoger en kruid je keukenavonturen vandaag!",
      "Een recept is slechts een blauwdruk. Wees de architect van je volgende maaltijd!",
      "Koken is liefde zichtbaar gemaakt. Serveer vanavond een bordje geluk.",
      "Elke maaltijd is een kans om een meesterwerk te creëren. Klaar om te koken?",
      "Stap je keuken binnen, waar magie gebeurt, één recept per keer.",
      "Creëer, kook, koester—elk gerecht vertelt een verhaal."
    ]
  },
  "14": {
    "keywords": ["oefening", "workout", "fitness", "gezondheid"],
    "sentences": [
      "Duw je grenzen, de workout van vandaag is een stap naar je gezondheidsdoelen!",
      "Fitness is geen bestemming, het is een manier van leven. Kom in beweging!",
      "Activeer je lichaam, wek je potentieel. Je beste zelf begint met een workout.",
      "Gezondheid wordt opgebouwd met elke oefening, blijf sterk en ga door!",
      "Daag jezelf uit, je lichaam zal je bedanken met energie en kracht.",
      "Workout omdat je van je lichaam houdt, niet omdat je het haat."
    ]
  },
  "15": {
    "keywords": ["lezen", "boeken", "literatuur", "kennis"],
    "sentences": [
      "Verlies jezelf in een boek, vind jezelf in een avontuur.",
      "Boeken zijn de sleutel tot nieuwe werelden—open de jouwe vandaag.",
      "Duik in de literatuur, waar elke pagina uitmondt in een nieuwe reis.",
      "Vergroot je geest, één boek tegelijk. Wat ga je hierna lezen?",
      "Kennis is macht, en boeken staan er vol mee. Laad op!",
      "Lezen is dromen met open ogen—droom groot, lees meer."
    ]
  },
  "16": {
    "keywords": ["zwemmen", "zwembad", "baantjes", "water"],
    "sentences": [
      "Duik in je doelen, één baantje tegelijk. Het zwembad roept!",
      "Zwemmen is de enige workout waarbij je nooit zweet. Verfris jezelf!",
      "Water is therapeutisch—dompel jezelf vandaag onder in je zwemsessie.",
      "Maak een plons met elke slag, zwem je weg naar fitness!",
      "Laat het water je trainer zijn en de baantjes je mijlpalen.",
      "Zwemmen—het ritme van het lichaam, de melodie van de geest, en de harmonie van de ziel."
    ]
  },
  "17": {
    "keywords": ["fietsen", "biken", "rit", "fiets"],
    "sentences": [
      "Trap je weg naar een betere gezondheid—één rit tegelijk.",
      "Fietsen is vrijheid, voel de wind en verover de paden.",
      "Fietsen is niet alleen goed voor de benen, het is een reis voor de ziel.",
      "Bereid je voor op een rit, elke kilometer brengt een glimlach.",
      "Rijd met je fiets, rijd je avontuur—elke route is een nieuwe ontdekking.",
      "Laat je fiets je gids zijn door onbekende paden."
    ]
  },
  "18": {
    "keywords": ["wandelen", "pad", "natuur", "avontuur"],
    "sentences": [
      "Trek de paden op en laat de natuur je gids zijn naar avontuur.",
      "Wandelen is het antwoord, wie maalt erom wat de vraag is!",
      "Ga wandelen en laat de schoonheid van de natuur je ziel vullen.",
      "Paden zijn de manier van de natuur om ons geweldige uitzichten te laten zien. Begin met lopen!",
      "Pak je spullen, richt je op de toppen, avontuur wacht!",
      "Ontdek de vreugden van wandelen—waar elke stap tot de ziel spreekt."
    ]
  },
  "19": {
    "keywords": ["dansen", "muziek", "ritme", "optreden"],
    "sentences": [
      "Dans op het ritme van je dromen, laat muziek je stappen leiden.",
      "Zet het volume harder en laat je lichaam bewegen op de muziek!",
      "Dansen is als dromen met je voeten—creëer je droom vanavond.",
      "Voel het ritme, laat de muziek je leiden en dans vol passie.",
      "Elk optreden vertelt een verhaal door dans. Wat is jouw verhaal?",
      "Laat dans jouw uitdrukking zijn, waar woorden stoppen, begint de muziek."
    ]
  },
  "20": {
    "keywords": ["fotografie", "camera", "foto", "afbeeldingen"],
    "sentences": [
      "Leg het moment vast, het is nu of nooit. Jouw camera is jouw canvas.",
      "Fotografie is het verhaal dat ik niet met woorden kan uitdrukken—begin met vertellen.",
      "Het leven door een lens—maak foto's van de scènes die je wilt onthouden.",
      "Maak van elke foto een herinnering, je camera is de bewaarder van momenten.",
      "Een foto zegt meer dan duizend woorden, start vandaag je dialoog.",
      "Leg je succes vast—één foto tegelijk."
    ]
  },
  "21": {
    "keywords": ["schilderen", "kleuren", "kunst", "kwasten"],
    "sentences": [
      "Spat je geest op het canvas—laat kleuren je verhaal vertellen.",
      "Schilder de wereld zoals jij het ziet—elke kleur is een penseelstreek van genialiteit.",
      "Kunst is niet het toevoegen van kleur aan canvas, maar het creëren van magie met kwasten.",
      "Laat je verbeelding de vrije loop met elke penseelstreek.",
      "Kleuren zijn de glimlach van de natuur—laat je schilderij helder lachen.",
      "Breng je visies tot leven, penseelstreek voor penseelstreek."
    ]
  },
  "22": {
    "keywords": ["vrijwilligerswerk", "helpen", "gemeenschap", "dienst"],
    "sentences": [
      "Maak vandaag het verschil—doe vrijwilligerswerk en wees de verandering die je wilt zien.",
      "Anderen helpen is niet alleen goed doen, het is voeding voor de ziel.",
      "Versterk je gemeenschap met het geschenk van je tijd en dienstbaarheid.",
      "Vrijwilligerswerk is de ultieme oefening in democratie. Je stemt elke dag over het soort gemeenschap waarin je wilt leven.",
      "Wees een baken van licht in je gemeenschap—geef je kracht als vrijwilliger.",
      "Dienstbaarheid aan anderen is de huur die je betaalt voor je plek hier op aarde."
    ]
  },
  "23": {
    "keywords": ["tuinieren", "groen", "planten", "natuur"],
    "sentences": [
      "Kweek je tuin van dromen—laat elke zaailing symbool staan voor een wens.",
      "Maak je omgeving groen, en je geest zal de rust volgen.",
      "Planten spreken wel degelijk als je de tijd neemt om te luisteren—kweek je tuinwijsheid.",
      "De natuur is de beste kunstenaar—doe mee met je tuinierskwast.",
      "Een groene duim leidt tot een weelderig leven—verzorg je planten, verzorg je ziel.",
      "Laat je tuin een toevluchtsoord zijn voor de drukte van de buitenwereld."
    ]
  },
  "24": {
    "keywords": ["knutselen", "maken", "diy", "hands-on"],
    "sentences": [
      "Knutsel je weg naar creativiteit—elke creatie is een weerspiegeling van je geest.",
      "Iets met de hand maken is de essentie van creativiteit. Begin vandaag je DIY-project!",
      "DIY gaat niet alleen over geld besparen, het gaat over het creëren van herinneringen.",
      "Hands-on plezier is slechts een project verwijderd—wat ga je vandaag maken?",
      "Ontketen je creativiteit met materialen en gereedschap—maak iets unieks!",
      "Creëer een wereld van jezelf—elke knutsel is een nieuw avontuur."
    ]
  },
  "25": {
    "keywords": ["schetsen", "tekenen", "kunst", "potlood"],
    "sentences": [
      "Breng je ideeën tot leven met een potlood—schets je dromen.",
      "Tekenen is de eerlijkheid van de kunst; er is geen mogelijkheid tot bedrog. Het is of goed of slecht.",
      "Schets je wereld, lijn voor lijn.",
      "Elke potloodstreek vertelt een verhaal—maak het boeiend.",
      "Kunst is niet wat je ziet, maar wat je anderen laat zien—begin met schetsen.",
      "Teken je hart uit, laat je potlood je innerlijke visies uitdrukken."
    ]
  },
  "26": {
    "keywords": ["zingen", "muziek", "stem", "optreden"],
    "sentences": [
      "Verhef je stem in zang, en laat je muziek de lucht vullen.",
      "Zingen is als een viering van zuurstof.",
      "Je stem is je instrument—stem het af en zing uit volle borst.",
      "Elk optreden is een kans om zielen te raken—zing met passie.",
      "Laat je muziek de lucht vullen; zing alsof niemand luistert.",
      "Een lied kan een moment veranderen, een stem kan een dag veranderen. Blijf zingen."
    ]
  },
  "27": {
    "keywords": ["coderen", "programmeren", "software", "ontwikkeling"],
    "sentences": [
      "Codeer je weg naar nieuwe oplossingen—elke regel code voedt innovatie.",
      "Programmeren gaat niet alleen over algoritmes en syntaxis; het gaat over probleemoplossing.",
      "Ontwikkel je wereld, regel voor regel code.",
      "Software verandert de wereld, maar het heeft ontwikkelaars nodig om het te bouwen. Begin met coderen!",
      "Verander problemen in programma's en bugs in functies.",
      "Coderen is de taal van creativiteit van vandaag. Alles wat je nodig hebt is de juiste code."
    ]
  },
  "28": {
    "keywords": ["bakken", "koken", "oven", "taarten"],
    "sentences": [
      "Bak je weg naar geluk—de heerlijke geur leidt naar zoete momenten.",
      "Koken is zowel kinderspel als volwassen vreugde. En koken met zorg gedaan is een daad van liefde.",
      "Laat de oven het werk doen—onthul een meesterwerk uit zijn warmte.",
      "Bakken is zowel een kunst als een wetenschap—vind de perfecte balans en geniet van de lekkernijen.",
      "Verander bloem en suiker in taarten en herinneringen—bak met passie.",
      "Laat je keuken een plaats van culinaire triomfen zijn—begin met bakken."
    ]
  },
  "29": {
    "keywords": ["breien", "haken", "garen", "ambacht"],
    "sentences": [
      "Breid je weg naar rust en kalmte, steek voor steek.",
      "Haken is niet alleen een ambacht, het is een levensredder.",
      "Laat garen je verf zijn en naalden je penseel—creëer prachtig.",
      "Elke lus en steek bevat een verhaal—wat zal dat van jou zeggen?",
      "Breien is de perfecte combinatie van creativiteit en therapie.",
      "Creëer een tapijt van texturen met garen—brei, steek, creëer."
    ]
  },
  "30": {
    "keywords": ["leren", "educatie", "kennis", "studie"],
    "sentences": [
      "Blijf leren, want het leven blijft je altijd iets leren.",
      "Onderwijs is het paspoort naar de toekomst, want morgen is van degenen die zich er vandaag op voorbereiden.",
      "Kennis is een schat, maar oefening is de sleutel ertoe.",
      "Verhoog je begrip, verruim je geest—blijf leren.",
      "Elke dag is een kans om iets nieuws te leren—grijp die kans.",
      "Investeer in je opleiding—het levert het beste rendement op."
    ]
  },
  "31": {
    "keywords": ["huisdieren", "dieren", "verzorging", "gezelschap"],
    "sentences": [
      "Koester je huisdieren, ze vullen je leven met vreugde en gezelschap.",
      "Het zorgen voor dieren is geen plicht, het is een voorrecht. Houd van ze met heel je hart.",
      "Huisdieren vullen plekken in je hart waarvan je niet wist dat ze leeg waren.",
      "Gezelschap met een huisdier is onbetaalbaar—verzorg het met zorg en affectie.",
      "Dieren zijn niet zomaar levende wezens; ze brengen comfort en liefde.",
      "Je huisdier vertrouwt op jou, net zoals jij vertrouwt op hun onvoorwaardelijke liefde."
    ]
  },
  "32": {
    "keywords": ["reizen", "verkennen", "avonturen", "bestemmingen"],
    "sentences": [
      "Pak je tassen en ontsteek je ziel met nieuwe avonturen.",
      "Verkenning verandert het alledaagse in adembenemend. Begin vandaag aan je reis.",
      "Elke bestemming biedt een nieuw hoofdstuk in het verhaal van je leven. Begin met schrijven!",
      "Reizen verruimt de geest en vult de leegte met onvergetelijke ervaringen.",
      "Zoek avonturen die je geest openen en je ziel uitdagen.",
      "Laat elke reis je geest verfijnen en je perspectieven verruimen."
    ]
  },
  "33": {
    "keywords": ["fitness", "gezondheid", "sportschool", "kracht"],
    "sentences": [
      "Duw door je grenzen, fitness gaat niet alleen over het lichaam, maar over de kracht van de geest.",
      "Omarm gezondheid als een levensstijl, niet als een plicht. Voel de verandering in je geest.",
      "Bezoek de sportschool, transformeer je lichaam en versterk je hart en geest.",
      "Kracht komt niet uit wat je kunt doen. Het komt voort uit het overwinnen van de dingen waarvan je ooit dacht dat je ze niet kon.",
      "Bouw een sterkere jij met elke workout. Vooruitgang is slechts één oefening weg!",
      "Fitness is de beste uitdrukking van liefde voor je lichaam en je geest."
    ]
  },
  "34": {
    "keywords": ["mindfulness", "vrede", "kalmte", "stressvrij"],
    "sentences": [
      "Kweek mindfulness, de vrede die je zoekt zit al in je.",
      "Omarm een kalme benadering van het leven; laat stress los en verwelkom vrede.",
      "Mindfulness is een kunst—oefen het, en je zult je leven verven met rust.",
      "Zoek kalmte in een chaotische wereld door mindfulness in je dagelijkse routine op te nemen.",
      "Stressvrij leven gaat niet over geen stress hebben; het gaat over het beheersen ervan met vrede en gratie.",
      "Gemoedsrust komt stukje bij beetje—oefen mindfulness om het samen te stellen."
    ]
  },
  "35": {
    "keywords": ["carrière", "doelen", "succes", "professioneel"],
    "sentences": [
      "Richt hoog in je carrière, stel doelen die je uitdagen en inspireren.",
      "Succes is een ladder die je niet kunt beklimmen met je handen in je zakken. Strek je uit en zet de volgende stap.",
      "Definieer je professionele reis met duidelijke doelen en een solide plan.",
      "Carrièregroei is een marathon, geen sprint. Bereid je voor op de lange termijn met doorzettingsvermogen en visie.",
      "Jouw professionele pad is een weerspiegeling van je inspanningen en ambities—vorm het wijs.",
      "Succes in je carrière komt voort uit voorbereiding, hard werken en leren van mislukkingen."
    ]
  },
  "36": {
    "keywords": ["kunst", "creativiteit", "inspiratie", "muze"],
    "sentences": [
      "Kunst is een lijn om je gedachten. Omarm je creativiteit en inspireer de wereld.",
      "Laat creativiteit stromen als een rivier—onbelemmerd en constant. Vind je muze.",
      "Inspiratie is de beloning van hard werken en focus. Blijf creëren, blijf inspireren.",
      "Mijmer over je gedachten en laat ze je artistieke reis leiden.",
      "Creativiteit is niet het vinden van iets, maar er iets van maken nadat het is gevonden.",
      "Verander inspiratie in kunst en laat je muze je gids zijn."
    ]
  },
  "37": {
    "keywords": ["teamwerk", "samenwerking", "groep", "inspanning"],
    "sentences": [
      "Grote dingen in het bedrijfsleven worden nooit door één persoon gedaan; ze worden gedaan door een team van mensen.",
      "Teamwerk maakt de droom waar—werk samen en groei samen.",
      "Gebruik de kracht van gezamenlijke inspanning; samen is elk doel binnen bereik.",
      "Samenwerking is het geheime ingrediënt voor innovatie. Meng het goed en zie de magie.",
      "Inspanning vermenigvuldigd—wanneer teams samenwerken, kunnen bergen verzet worden.",
      "Bouw bruggen, geen muren. Samenwerking is de sleutel tot het ontsluiten van potentieel."
    ]
  },
  "38": {
    "keywords": ["motivatie", "drive", "ambitie", "doelen stellen"],
    "sentences": [
      "Geef je motivatie brandstof, het is het voertuig dat je naar succes leidt.",
      "Ambitie is het pad naar succes. Volharding is het voertuig waarin je arriveert.",
      "Stel je doelen hoog en stop niet totdat je er bent.",
      "Richt je leven met vastberadenheid, stuur het met ambitie.",
      "Motivatie is wat je aan het werk zet. Gewoonte is wat je voortdrijft.",
      "Houd de ambitie fel brandend. Doelen stellen is de eerste stap naar succes."
    ]
  },
  "39": {
    "keywords": ["innovatie", "creativiteit", "uitvinding", "ideeën"],
    "sentences": [
      "Innoveren om te leiden, creëren om te slagen. Nieuwe ideeën zijn de zaadjes van groei.",
      "Creativiteit is nieuwe dingen bedenken. Innovatie is nieuwe dingen doen.",
      "Uitvinding begint met verbeelding. Laat je ideeën hoogvliegen.",
      "Transformeer ideeën in realiteit. Innoveer elke dag.",
      "Ideeën zijn de blauwdrukken; innovatie is de bouw. Bouw je dromen.",
      "Innoveer niet omdat je kunt, maar omdat je moet. Het is de geest van vooruitgang."
    ]
  },
  "40": {
    "keywords": ["schrijven", "uitdrukken", "communicatie", "literatuur"],
    "sentences": [
      "Schrijven gaat niet alleen om communiceren, het gaat om verbinding maken met anderen.",
      "Druk je gedachten duidelijk uit; laat je woorden dansen op de pagina.",
      "Goede communicatie is de brug tussen verwarring en duidelijkheid.",
      "Literatuur opent deuren naar nieuwe werelden; schrijf je weg erdoorheen.",
      "Jezelf uitdrukken via schrijven is je ziel delen met de wereld.",
      "Verander je woorden in je nalatenschap. Schrijf met een doel, communiceer met hart."
    ]
  },
  "41": {
    "keywords": ["leiderschap", "leiding", "invloed", "mentorschap"],
    "sentences": [
      "Leiderschap is actie, geen positie. Beïnvloed positief, leid wijs.",
      "De moed van een groot leider om zijn visie te vervullen komt voort uit passie, niet uit positie.",
      "Beïnvloed met integriteit en leid met een goed voorbeeld.",
      "Leiding geven is een geschenk—mentor met aandacht en respect.",
      "Leiderschap gaat niet over het uitoefenen van macht—het gaat over het versterken van anderen.",
      "Wees de mentor die je ooit nodig had. Leiderschap gaat over het laten groeien van anderen."
    ]
  },
  "42": {
    "keywords": ["gezondheid", "welzijn", "fitness", "levensstijl"],
    "sentences": [
      "Gezondheid is een staat van het lichaam. Welzijn is een staat van zijn.",
      "Investeer in je gezondheid; het levert het beste rendement: welzijn.",
      "Fitness gaat niet over beter zijn dan iemand anders. Het gaat erom beter te zijn dan je vroeger was.",
      "Transformeer je levensstijl om welzijn te bevorderen. Het is rijkdom die niet meetbaar is.",
      "Stel je gezondheid voorop en de rest zal vanzelf op zijn plaats vallen.",
      "Omarm een levensstijl die fitness bevordert. Je toekomstige zelf zal je dankbaar zijn."
    ]
  },
  "43": {
    "keywords": ["onderwijs", "leren", "doceren", "kennis"],
    "sentences": [
      "Onderwijs is het krachtigste wapen dat je kunt gebruiken om de wereld te veranderen.",
      "Blijf leren; onderwijs is een schat die zijn eigenaar overal volgt.",
      "Onderwijzen gaat niet over het beantwoorden van vragen, maar over het stellen ervan—deuren openen die zij zich niet konden voorstellen.",
      "Kennis is geen kop die gevuld moet worden, maar een vuur dat moet worden aangestoken.",
      "Vergroot je geest, voed je ziel, onderwijzen is nooit te laat.",
      "Lesgeven is het enige beroep dat alle andere beroepen creëert."
    ]
  },
  "44": {
    "keywords": ["zelfzorg", "welzijn", "ontspanning", "gezondheid"],
    "sentences": [
      "Zelfzorg is niet egoïstisch; je kunt niet schenken uit een lege beker.",
      "Welzijn omvat een gezond lichaam, een gezonde geest en een rustige geest.",
      "Ontspanning betekent niet niets doen; het gaat om vrede hebben terwijl je op je best functioneert.",
      "Zorg goed voor je lichaam; het is de enige plek waar je moet leven.",
      "Omarm welzijn als een levensstijl—het gaat om het maken van gezonde keuzes in het dagelijks leven.",
      "Gezondheid en welzijn gaan niet alleen over wat je eet of hoe je beweegt, maar ook over wat je denkt en zegt."
    ]
  },
  "45": {
    "keywords": ["duurzaamheid", "milieu", "natuurbehoud", "groen"],
    "sentences": [
      "Duurzaamheid gaat over ecologie, economie en gelijkheid.",
      "Zorg voor het milieu zoals je voor jezelf zou zorgen.",
      "Natuurbehoud is een toestand van harmonie tussen mens en land.",
      "Wees de verandering die je in de wereld wilt zien—leef groen.",
      "Duurzaamheid begint met bewustzijn en eindigt met actie. Zet vandaag stappen.",
      "Elke kleine groene actie draagt bij aan grote milieuveranderingen."
    ]
  },
  "46": {
    "keywords": ["ondernemerschap", "startup", "zaken", "innovatie"],
    "sentences": [
      "Ondernemerschap is noch een wetenschap noch een kunst. Het is een praktijk.",
      "In de wereld van startups ben je of een verstorende kracht of word je verstoord.",
      "Zakelijke kansen zijn als bussen, er komt er altijd nog een aan.",
      "Innovatie is de onophoudelijke drang om de status quo te doorbreken en nieuw te ontwikkelen waar weinigen durfden te gaan.",
      "De echte ondernemer is een doener, geen dromer.",
      "Voed je bedrijf met innovatie, geef het water met toewijding en kweek groei."
    ]
  },
  "47": {
    "keywords": ["creativiteit", "verbeelding", "innovatie", "ideeën"],
    "sentences": [
      "Creativiteit is intelligentie die plezier heeft.",
      "Verbeelding zou niet gebruikt moeten worden om te ontsnappen aan de realiteit, maar om het te creëren.",
      "Innovatie onderscheidt een leider van een volger.",
      "Ideeën blijven niet bewaard; er moet iets mee worden gedaan.",
      "Creativiteit is de kracht om het schijnbaar ongerelateerde te verbinden.",
      "Breng je ideeën tot leven—laat ze ademen en vorm krijgen."
    ]
  },
  "48": {
    "keywords": ["muziek", "harmonie", "ritme", "melodie"],
    "sentences": [
      "Muziek is wat gevoelens laten horen. Speel verder.",
      "Harmonie is een mooie balans tussen melodie en ritme.",
      "Ritme zit niet alleen in de muziek; het zit in het hart van degenen die luisteren.",
      "Melodie is de essentie van muziek. Laat het je ziel raken.",
      "Laat muziek het voedsel van de liefde zijn. Speel verder, geef er een overvloed van.",
      "In de wereld van de muziek is elke noot een universum aan mogelijkheden."
    ]
  },
  "49": {
    "keywords": ["tuinieren", "tuinbouw", "planten", "natuur"],
    "sentences": [
      "Tuinieren is de kunst die bloemen en planten als verf gebruikt en de grond en lucht als canvas.",
      "Tuinbouw brengt vreugde en rust voor de ziel—verzorg je tuin om jezelf te voeden.",
      "Planten zijn de meesterwerken van de natuur. Kweek je tuin, kweek schoonheid.",
      "Verbind met de aarde door te tuinieren—het is zowel aarding als opheffing.",
      "De natuur is geen plek om te bezoeken. Het is thuis, en je kunt het creëren in je eigen achtertuin.",
      "Tuinieren is de langzaamste van de podiumkunsten, maar de meest blijvende."
    ]
  },
  "50": {
    "keywords": ["fitness", "oefening", "workout", "gezondheid"],
    "sentences": [
      "Verhoog je fitnessroutine—elke workout is een stap naar betere gezondheid.",
      "Oefen je recht om je goed te voelen. Je fitnessreis begint vandaag.",
      "Workout om wakker te worden, om sterk te zijn, om een gezond leven te leiden.",
      "Je gezondheid is een investering, geen uitgave—maak tijd voor fitness.",
      "Duw jezelf omdat niemand anders het voor je gaat doen.",
      "Blijf toegewijd aan je fitnessdoelen en zie hoe je leven vooruitgaat."
    ]
  }
};
