//
//  View2.swift
//  SideMenuInSwiftUI
//
//  Created by Сергей Лоскутников on 14.05.2021.
//  Copyright © 2021 Andreas Schultz. All rights reserved.
//

import SwiftUI

struct View2: View {
    
    @AppStorage("language")
    private var language = LocalizationService.shared.language
   
    @EnvironmentObject var ss2 : losObject
    
    var body: some View {
        ZStack{
            ScrollView {
                
            VStack{
                Spacer()
                
                // ss2.shar.valueLang ? "About app" : "О приложении"
                
                Text("hello".localized(language))
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .bold()
                    .multilineTextAlignment(.center)
                    
                Spacer()
                Spacer()
                
                
                
                if language == .farci {


                    Text("FarciBlago".localized(.english_us)).foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 16.0)

                }else {

                    Group {
                        
                       MainText1()
                          
                        
                            Text("a3".localized(language)) +
                            Text("a31".localized(language)).underline() +
                            Text("a30End".localized(language)) +
                            Text("a4".localized(language)).underline()
                           
                                
                            MainText3()
                        
                            Text("a11".localized(language)) +
                            Text("a12".localized(language)).bold() +
                            Text("a_azer".localized(language))
                         
                        
                    } .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16.0)
                    //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    
                }
                    
//                }else {
//
//
//
//                    Group {
//
//                        Text("  Приложение «Talysh Dictionary (by F. Aboszoda )» предлагает электронные словари с талышского языка сразу на 4 языка: русский, азербайджанский (тюркский), английский и персидский.\n  Талыши проживают на юго-западе Прикаспия – на границе Ирана и Азербайджана. Классифицируется талышкий следующим образом: ") +
//
//                           Text("индоевропейская языковая семья – арийская ветвь – иранская группа – северо-западная подгруппа – каспийские языки – талышский язык. ").underline() +
//
//                        Text("Проживающие во многих областях северо-западного Ирана население тати являются этнографической группой талышей и говорят на диалектах, схожих с одним из близлежащих талышских диалектов.\n   Автором всех 4-х словарей является ученый (философ, политолог, филолог), журналист и общественно-политический деятель Фахраддин Абосзода (Аббасов). Некоторые его словари неоднократно обновлялись и переиздавались. В данном приложении предоставлены: ") +
//
//                        Text("Русско-талышский словарь (60 000 слов; Мюнхен, 2012), Тюрко-талышский словарь (55 000 слов; Баку, 2015), Англо-талышский словарь (250 000 слов; Мюнхен, 2012), Персидско-талышский словарь (рукопись). \n").underline() +
//
//                             Text("  Приложение «Talysh Dictionary (by F. Aboszoda)» является продуктом научно-просветительского проекта «TOLYSHNOMA», созданного ") +
//                            Text("Союзом талышской молодежи (гор.Москва) ").underline() +
//                              Text("при содействии") +
//                            Text("Талышской Национальной Академии (гор.Минск). ").underline() +
//                            Text("Приложение создано при финансовой поддержке  ") +
//
//                            Text("Фонда Талышской культуры и науки (гор.Санкт-Петербург).").underline()
//
//
//                    }
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//                    .padding(.horizontal, 16.0)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
//
//
//
//
//
//                }
//
                
                
                
//
//                Text(ss2.shar.valueLang ? "  Talyshi Dictionary \n (by F. Aboszoda) application offers electronic dictionary from the Talyshi language to 4 different languages: Russian, Turkic (Azerbaijani), English and Persian.The Talysh live to the south-west of the Caspian Sea on the Iran-Azerbaijan border. The Talyshi language is classified as follows: Indo-European language family - Aryan branch - Iranian group - Northwestern subgroup - Caspian languages - Talyshi. The Talyshi language emerged in a consistent transformations of: Aryan - Avestan - Median - \n   Atropatenian (Azari) - Talyshi. The Tati population living in many areas of north-western Iran are an ethnographic group of the Talysh and speak dialects similar to one of the nearby Talyshi dialects.The author of all 4 dictionaries is a scholar (philosopher, political scientist, philologist), journalist, public and political figure Fakhraddin Aboszoda (Abbasov). Some of the dictionaries were republished in an updated version several times. In this application you will find: Russian-Talyshi dictionary (82,000 words;  Baku, 2006, 2008), Turkic-Talyshi dictionary (55,000 words; Baku, 2015), English-Talyshi dictionary (250,000 words; Munich, 2012), Persian-Talyshi dictionary (not published).The 'Talyshi Dictionary (by F. Aboszoda)' application was created as a part of scientific educational project \"TOLYSHNOMA\", created by the Union of Talysh Youth (Moscow, Russia) with the assistance of The National Academy of Talysh (Minsk, Belarus). The application was created with the financial support of the Government of Talysh-Mughan Autonomous Republic in Emigration (Hague, Netherlands)." : "  Приложение «Talysh Dictionary \n \n\n (by F. Aboszoda )» предлагает электронные словари с талышского языка сразу на 4 языка: русский, азербайджанский (тюркский), английский и персидский.Талыши проживают на юго-западе Прикаспия – на границе Ирана и Азербайджана. Классифицируется талышкий следующим образом: индоевропейская языковая семья – арийская ветвь – иранская группа – северо-западная подгруппа – каспийские языки – талышский язык. Талышский язык возник в последовательной трансформации в виде: арийский - авестийский - мидийский - атропатенский (азери) - талышский. Проживающие во многих областях северо-западного Ирана население тати являются этнографической группой талышей и говорят на диалектах, схожих с одним из близлежащих талышских диалектов.Автором всех 4-х словарей является ученый (философ, политолог, филолог), журналист и общественно-политический деятель Фахраддин Абосзода (Аббасов). Некоторые его словари неоднократно обновлялись и переиздавались. В данном приложении предоставлены: Русско-талышский словарь (60 000 слов; Мюнхен, 2012), Тюрко-талышский словарь (55 000 слов; Баку, 2015), Англо-талышский словарь (250 000 слов; Мюнхен, 2012), Персидско-талышский словарь (рукопись).Приложение «Talysh Dictionary (by F. Aboszoda)» является продуктом научно-просветительского проекта «TOLYSHNOMA», созданного Союзом талышской молодежи (гор.Москва) при содействии Талышской Национальной Академии (гор.Минск). Приложение создано при финансовой поддержке Правительства Талыш-Муганской Автономной Республики в эмиграции (гор.Гаага).")
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//                    .padding(.horizontal, 16.0)
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
             }
           }
        }
   
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
