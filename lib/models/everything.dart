import 'package:dio/dio.dart';

Response<Map<String, dynamic>> map = {
  "status": "ok",
  "totalResults": 3529,
  "articles": [
    {
      "source": {"id": null, "name": "New York Times"},
      "author":
          "Michael Barbaro, Clare Toeniskoetter, Annie Brown, Stella Tan, Paige Cowett and Marion Lozano",
      "title": "America’s Final Hours in Afghanistan",
      "description":
          "After a 20-year war, the United States has completed its withdrawal. How did it happen and what’s next?",
      "url":
          "https://www.nytimes.com/2021/08/31/podcasts/the-daily/afghanistan-withdrawal-us-taliban.html",
      "urlToImage":
          "https://static01.nyt.com/images/2021/08/31/world/31daily-sub/31daily-sub-facebookJumbo.jpg",
      "publishedAt": "2021-08-31T10:02:49Z",
      "content":
          "Eric Schmitt contributed reporting.\r\nThe Daily is made by Lisa Tobin, Rachel Quester, Lynsea Garrison, Annie Brown, Clare Toeniskoetter, Paige Cowett, Michael Simon Johnson, Brad Fisher, Larissa Ande… [+731 chars]"
    },
    {
      "source": {"id": null, "name": "New York Times"},
      "author": null,
      "title": "Transcript of Blinken’s Speech on ‘New Chapter’ in Afghanistan",
      "description":
          "Shortly after the last U.S. troops left Afghanistan, the secretary of state outlined a plan to use diplomacy to try to extract remaining Americans and Afghan allies.",
      "url":
          "https://www.nytimes.com/2021/08/31/us/politics/transcript-blinken-afghanistan-speech.html",
      "urlToImage":
          "https://static01.nyt.com/images/2021/08/30/us/politics/30dc-blinken-transcript/30dc-blinken-transcript-facebookJumbo.jpg",
      "publishedAt": "2021-08-31T01:08:01Z",
      "content":
          "Fifth, we will stay focused on counterterrorism. The Taliban has made a commitment to prevent terrorist groups from using Afghanistan as a base for external operations that could threaten the United … [+4093 chars]"
    },
    {
      "source": {"id": null, "name": "New York Times"},
      "author": "The New York Times",
      "title": "With U.S. Military Gone, Afghans Confront Their Future",
      "description":
          "Vital questions swirl about how the group, which has yet to form a government, will preside over a nation beleaguered by humanitarian and economic crises.",
      "url": "https://www.nytimes.com/live/2021/08/31/world/afghanistan-news",
      "urlToImage":
          "https://static01.nyt.com/images/2021/08/31/world/31afghanistan-briefing-ledeitem-02/31afghanistan-briefing-ledeitem-02-facebookJumbo.jpg",
      "publishedAt": "2021-08-31T10:05:47Z",
      "content":
          "LiveUpdated Aug. 31, 2021, 5:49 a.m. ET\r\nAug. 31, 2021, 5:49 a.m. ET\r\nVital questions swirl about how the group, which has yet to form a government, will preside over a nation beleaguered by humanita… [+11915 chars]"
    },
    {
      "source": {"id": null, "name": "New York Times"},
      "author": "Will Dudding",
      "title": "Afghanistan, Texas, Kanye West: Your Tuesday Evening Briefing",
      "description": "Here’s what you need to know at the end of the day.",
      "url":
          "https://www.nytimes.com/2021/08/31/briefing/afghanistan-texas-kanye-west.html",
      "urlToImage":
          "https://static01.nyt.com/images/2021/08/31/lens/31evening-briefing-01-promo/merlin_193943040_c8259549-2b55-4fb8-bb6f-5a3dc2fb8880-facebookJumbo.jpg",
      "publishedAt": "2021-08-31T22:15:03Z",
      "content":
          "8. After over a year of waiting, Broadways young dancers finally get to show their stuff.\r\nAtticus Ware, 13, has done a lot of worrying that he might physically outgrow his role in the new musical Fl… [+475 chars]"
    },
    {
      "source": {"id": null, "name": "New York Times"},
      "author": "Lara Jakes",
      "title": "Blinken Says American Diplomats Have Left Kabul",
      "description":
          "The disintegration of U.S. diplomacy came as efforts continued to work toward peace, however tenuous, with a government that would share power with the Taliban.",
      "url":
          "https://www.nytimes.com/2021/08/30/us/politics/blinken-us-evacuation-taliban-afghanistan.html",
      "urlToImage":
          "https://static01.nyt.com/images/2021/08/30/us/30afghan-brief-diplo/30afghan-brief-diplo-facebookJumbo.jpg",
      "publishedAt": "2021-08-31T00:46:11Z",
      "content":
          "American diplomats will remain engaged in Afghanistan, but from outside its borders. Mr. Blinken said the effort would now be led out of Qatar.\r\nOf paramount importance to the Biden administration ar… [+1030 chars]"
    },
    {
      "source": {"id": "bbc-news", "name": "BBC News"},
      "author": "https://www.facebook.com/bbcnews",
      "title":
          "Afghanistan: Joe Biden defends US pull-out as Taliban claim victory",
      "description":
          "Staying in Afghanistan was not an option, the US president says, as Taliban militants celebrate.",
      "url": "https://www.bbc.co.uk/news/world-asia-58403735",
      "urlToImage":
          "https://ichef.bbci.co.uk/news/1024/branded_news/10FD0/production/_120348596_hi069712049.jpg",
      "publishedAt": "2021-08-31T21:12:10Z",
      "content":
          "media captionBiden defends pull-out: \"I was not going to extend a forever exit\"\r\nUS President Joe Biden has defended his decision to withdraw US troops from Afghanistan - a move which led to Taliban … [+3396 chars]"
    },
    {
      "source": {"id": "bbc-news", "name": "BBC News"},
      "author": null,
      "title": "Female journalist who interviewed Taliban flees",
      "description":
          "Beheshta Arghand, who made headlines when she interviewed the Taliban, has spoken out after fleeing the country.",
      "url": "https://www.bbc.co.uk/news/av/world-58401364",
      "urlToImage":
          "https://ichef.bbci.co.uk/news/1024/branded_news/1882/production/_120347260_p09tpfpp.jpg",
      "publishedAt": "2021-08-31T18:10:41Z",
      "content":
          "Beheshta Arghand, an anchor for TOLO News, made headlines when she interviewed the Taliban just days after they took control of Afghanistan. \r\nTwo weeks later, she has fled the country amid fears for… [+105 chars]"
    },
    {
      "source": {"id": "bbc-news", "name": "BBC News"},
      "author": "https://www.facebook.com/bbcnews",
      "title":
          "Highly polluting leaded petrol now eradicated from the world, says UN",
      "description":
          "The highly polluting fuel has contaminated the atmosphere, water and crops for nearly a century.",
      "url": "https://www.bbc.co.uk/news/world-58388810",
      "urlToImage":
          "https://ichef.bbci.co.uk/news/1024/branded_news/106FB/production/_120332376_gettyimages-1177917147.jpg",
      "publishedAt": "2021-08-31T00:25:31Z",
      "content":
          "image captionAlgeria, the last country to still sell leaded petrol, ran out of its last supplies in July\r\nThere is now no country in the world that uses leaded petrol, the UN Environment Programme ha… [+2233 chars]"
    },
    {
      "source": {"id": "cnn", "name": "CNN"},
      "author": "Devan Cole, CNN",
      "title":
          "'I hope I'm wrong': GOP lawmaker explains mixed feelings over leaving Afghanistan in Taliban control",
      "description":
          "Republican Congressman and US military veteran Adam Kinzinger on Monday reflected on the closing of America's longest war, saying that while he's relieved, Afghanistan now being under Taliban control has left him with mixed emotions.",
      "url":
          "https://www.cnn.com/2021/08/30/politics/lawmakers-react-afghanistan-war-end-cnntv/index.html",
      "urlToImage":
          "https://cdn.cnn.com/cnnnext/dam/assets/210112182127-rep-adam-kinzinger-file-super-tease.jpg",
      "publishedAt": "2021-08-31T00:38:21Z",
      "content":
          "Washington (CNN)Republican Congressman and US military veteran Adam Kinzinger on Monday reflected on the closing of America's longest war, saying that while he's relieved, Afghanistan now being under… [+4667 chars]"
    },
    {
      "source": {"id": "cnn", "name": "CNN"},
      "author": "Opinion by Hao-Nhien Vu",
      "title": "A lesson for America from the fall of Saigon in 1975",
      "description":
          "After the fall of Saigon and in the years following, American presidents of both parties worked to admit hundreds of thousands of Vietnamese refugees into the US, including Hao-Nhien Vu and his family. He argues that we should now do the same for the people o…",
      "url":
          "https://www.cnn.com/2021/08/31/opinions/afghanistan-vietnam-lesson-from-fall-of-saigon-vu/index.html",
      "urlToImage":
          "https://cdn.cnn.com/cnnnext/dam/assets/210831151957-02-afghanistan-saigon-opinion-super-tease.jpg",
      "publishedAt": "2021-08-31T20:12:36Z",
      "content":
          "Hao-Nhien Vu is a former managing editor of Nguoi Viet, a Vietnamese-language newspaper. He is a professor of mathematics at Coastline College in Orange County, California. The views expressed here a… [+5525 chars]"
    },
    {
      "source": {"id": "bbc-news", "name": "BBC News"},
      "author": null,
      "title": "Afghans 'will struggle to survive or race to escape'",
      "description":
          "The BBC's Lyse Doucet reports from the Afghan capital, a day after the last US troops left.",
      "url": "https://www.bbc.co.uk/news/av/world-asia-58393245",
      "urlToImage":
          "https://ichef.bbci.co.uk/news/1024/branded_news/9884/production/_120344093_p09tnqjc.jpg",
      "publishedAt": "2021-08-31T13:49:36Z",
      "content":
          "Large crowds are jostling outside the banks in Kabul and queues have formed near foreign embassies, a day after the last US troops left Afghanistan.\r\nBut the BBC's Lyse Doucet says that for the major… [+159 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "UK nationals still in Afghanistan in \"low hundreds\" - Raab - Reuters",
      "description":
          "The number of British nationals still in Afghanistan is in the low hundreds, Foreign Secretary Dominic Raab said on Tuesday.",
      "url":
          "https://www.reuters.com/world/asia-pacific/uk-nationals-still-afghanistan-low-hundreds-raab-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/MJxTSIiDkKVAalyVM4HzK9WhC-Y=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/FPDEXP3AMJMITKZ7XQ7Y2ZLCAA.jpg",
      "publishedAt": "2021-08-31T06:25:00Z",
      "content":
          "Britain's Foreign Secretary Dominic Raab looks on during a visit of Prime Minister Boris Johnson at the The Foreign, Commonwealth and Development Office (FCDO) Crisis Centre in London, Britain August… [+715 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "As Afghanistan adjusts to Taliban rule, music goes silent - Reuters",
      "description":
          "Even before the last U.S. flight left Kabul at midnight on Monday, many of the bright and garish sights and sounds of city life in Afghanistan were changing as those left behind tried to fit in with the austere tone of their new Taliban rulers.",
      "url":
          "https://www.reuters.com/world/asia-pacific/afghanistan-adjusts-taliban-rule-music-goes-silent-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/GkRfS8cElKrGEHfcWGSA1kLCQAw=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/QLO6KI3DDJJ4PHIGFYHIWZYYHM.jpg",
      "publishedAt": "2021-08-31T06:06:00Z",
      "content":
          "Afghan music students participate in a music training session at a cultural and educational centre in Kabul March 7, 2014. . REUTERS/Morteza Nikoubazl/File PhotoAug 31 (Reuters) - Even before the las… [+3707 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Eman Kamel,Andreas Rinke",
      "title":
          "Qatar warns isolating Taliban could further destabilize Afghanistan - Reuters",
      "description":
          "Qatar's foreign minister on Tuesday warned that isolating the Taliban could lead to further instability and urged countries to engage with the hardline Islamist movement to address security and socioeconomic concerns in Afghanistan.",
      "url":
          "https://www.reuters.com/world/middle-east/qatar-foreign-minister-says-taliban-should-cooperate-fight-terrorism-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/ltSVvOJG9rrjGl19lvBWl42Jl_Y=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/EGEEKVWZWVPRXBJMN2PLV3KA3A.jpg",
      "publishedAt": "2021-08-31T19:23:00Z",
      "content":
          "Taliban forces patrol near the entrance gate of Hamid Karzai International Airport, a day after U.S troops withdrawal, in Kabul, Afghanistan August 31, 2021. REUTERS/StringerDOHA, Aug 31 (Reuters) - … [+2485 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "Afghan government to be formed in days, says Pakistan foreign minister - Reuters India",
      "description":
          "Afghanistan will form a government within days, Pakistan's foreign minister said on Tuesday, after weeks of uncertainty following the Taliban's conquest of the country.",
      "url":
          "https://www.reuters.com/world/india/afghan-government-be-formed-days-says-pakistan-foreign-minister-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/qzLIWytj93RA9PtmWs2JUx1RPJs=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/ZP6DYPHQHBPDLGMBRW7XWGJFC4.jpg",
      "publishedAt": "2021-08-31T09:03:00Z",
      "content":
          "Pakistan's Foreign Minister Shah Mehmood Qureshi gestures as he speaks during an interview with Reuters at the Ministry of Foreign Affairs (MOFA) office in Islamabad, Pakistan June 25, 2020. Picture … [+539 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Stephane Mahe",
      "title":
          "No future for women like me, says exiled Afghan soccer player - Reuters",
      "description":
          "As a former player in the Afghanistan women's national soccer team, Fanoos Basir saw no future for herself under Taliban rule.",
      "url":
          "https://www.reuters.com/world/asia-pacific/no-future-women-like-me-says-exiled-afghan-soccer-player-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/qS2PMzD1JKL5TFb7AN2s6UbP7KE=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/XK2ASAP3MNLMBHQOAJMPBYMSHQ.jpg",
      "publishedAt": "2021-08-31T09:49:00Z",
      "content":
          "Three young Afghan female university students who have fled their country pose for a photo, hiding their identity over safety concerns for family in Afghanistan, at a residential compound in Doha, Qa… [+3667 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "Taliban government will decide on Kabul airport charter flights - Germany - Reuters",
      "description":
          "Germany will wait for the Taliban to install a new government to see if the Islamists will honour their pledge to allow civilians to leave Afghanistan on flights from Kabul airport, Foreign Minister Heiko Maas said on Tuesday.",
      "url":
          "https://www.reuters.com/world/asia-pacific/taliban-government-will-decide-kabul-airport-charter-flights-germany-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/hH0GT-wespLKNyRLJttEec5ghuw=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/QLIOANQA6NMJNJ55X4LDDK7I2Q.jpg",
      "publishedAt": "2021-08-31T07:59:00Z",
      "content":
          "German Foreign Minister Heiko Maas speaks to reporters on developments in Afghanistan, in Berlin, Germany, August 26, 2021. REUTERS/Annegret Hilse/PoolISLAMABAD, Aug 31 (Reuters) - Germany will wait … [+666 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "Check terrorism finance controls linked to Afghanistan, UK watchdog tells firms - Reuters UK",
      "description":
          "Financial firms should have appropriate controls to counter the risk of money laundering and terrorist financing following the change of power in Afghanistan, Britain's Financial Conduct Authority (FCA) said on Tuesday.",
      "url":
          "https://www.reuters.com/world/uk/check-terrorism-finance-controls-linked-afghanistan-uk-watchdog-tells-firms-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/YW13flGrxNF_1VhB3eaSSH7y-po=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/5TALUZU4HFP5XAIUCRKI7KHCVA.jpg",
      "publishedAt": "2021-08-31T08:48:00Z",
      "content":
          "The Bank of England and the City of London financial district in London, Britain, November 5, 2020. REUTERS/John Sibley/File PhotoLONDON, Aug 31 (Reuters) - Financial firms should have appropriate co… [+1167 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Reuters",
      "title":
          "UK says it is too early to decide how to work with the Taliban - Reuters",
      "description":
          "A spokesman for British Prime Minister Boris Johnson said on Tuesday it is too early to decide if, and how, the government will work with the Taliban on tackling the Islamic State in Afghanistan.",
      "url":
          "https://www.reuters.com/business/aerospace-defense/uk-says-it-is-too-early-decide-how-work-with-taliban-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/c8mlsGbgUigr5-IiHKGw6Zhmsqc=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/AYI7DEYJH5JDZCCJULVIOILOCM.jpg",
      "publishedAt": "2021-08-31T11:45:00Z",
      "content":
          "Britain's Prime Minister Boris Johnson leaves following a visit at Northwood Headquarters, the British Armed Forces Permanent Joint Headquarters, in Eastbury, northwest of London, Britain August 26, … [+760 chars]"
    },
    {
      "source": {"id": "reuters", "name": "Reuters"},
      "author": "Gabriela Baczynska",
      "title":
          "Echoes of 2015 as EU grapples with Afghan migration challenge - Reuters",
      "description":
          "European Union countries on Tuesday proposed to step up aid to Afghanistan and its neighbours but could not agree a common policy on accepting asylum-seekers fleeing Taliban rule.",
      "url":
          "https://www.reuters.com/world/europe/echoes-2015-eu-grapples-with-afghan-migration-challenge-2021-08-31/",
      "urlToImage":
          "https://www.reuters.com/resizer/fXzu4txWkoMo2f0YxKk-Uuy36-c=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/RDUX5H5VHFJV7DYQ7AGDQQY57I.jpg",
      "publishedAt": "2021-08-31T15:22:00Z",
      "content":
          "An Afghan woman and her month-old son are seen outside the new temporary camp for migrants and refugees, on the island of Lesbos, Greece, September 21, 2020. REUTERS/Yara NardiBRUSSELS, Aug 31 (Reute… [+3584 chars]"
    }
  ]
} as Response<Map<String, Object>>;
