; ####################
; #### SAMP UDF R15.1 ####
; SAMP Version: 0.3.7
; Written by Chuck_Floyd 
; https://github.com/FrozenBrain
; Modified by Suchty112
; https://github.com/Suchty112
; Modified by: paul-phoenix
; https://github.com/paul-phoenix
; Modified by: Agrippa1994
; https://github.com/agrippa1994
; Modified by: RawDev and ELon
; Modified by: democrazy
; Обновление от 22.07.2017
; Дополнял: MurKotik
; http://murkot.tk
; Дополнял: McFree
; Дополнял: aknqkzxlcs
; Дополнял: Godarck
; Дополнял: Слюнявчик
; Дополнял: MrGPro
; Дополнял: Phoenixxx_Czar
; Дополнял: Dworkin
; Дополнял: Ghost29
; Перевёл: I_Qwerty_I
; Do not remove these lines.
; Не удаляйте пожалуйста авторов
; ####################
; DLL API библиотека: https://yadi.sk/d/WYNP9ryTxXuDf
; Samp Dop Function: https://yadi.sk/d/rWFgksjc3KexSA
; Библиотека dx9_overlay: https://yadi.sk/d/6iQMTa043FFAZ6

; Samp-udf-addon
global ADDR_SET_POSITION                    := 0xB7CD98
global ADDR_SET_POSITION_OFFSET             := 0x14
global ADDR_SET_POSITION_X_OFFSET           := 0x30
global ADDR_SET_POSITION_Y_OFFSET           := 0x34
global ADDR_SET_POSITION_Z_OFFSET           := 0x38
global ADDR_SET_INTERIOR_OFFSET             := 0xB72914
global SAMP_SZIP_OFFSET                     := 0x20
;~ global SAMP_SZHOSTNAME_OFFSET               := 0x121
global SAMP_INFO_SETTINGS_OFFSET            := 0x3C5
global SAMP_DIALOG_LINENUMBER_OFFSET        := 0x140

; ErrorLevels
global ERROR_OK                             := 0
global ERROR_PROCESS_NOT_FOUND              := 1
global ERROR_OPEN_PROCESS                   := 2
global ERROR_INVALID_HANDLE                 := 3
global ERROR_MODULE_NOT_FOUND               := 4
global ERROR_ENUM_PROCESS_MODULES           := 5
global ERROR_ZONE_NOT_FOUND                 := 6
global ERROR_CITY_NOT_FOUND                 := 7
global ERROR_READ_MEMORY                    := 8
global ERROR_WRITE_MEMORY                   := 9
global ERROR_ALLOC_MEMORY                   := 10
global ERROR_FREE_MEMORY                    := 11
global ERROR_WAIT_FOR_OBJECT                := 12
global ERROR_CREATE_THREAD                  := 13
            
; GTA Addresses         
global ADDR_ZONECODE                        := 0xA49AD4      ;Player Zone
global ADDR_POSITION_X                      := 0xB6F2E4      ;Player X Position
global ADDR_POSITION_Y                      := 0xB6F2E8      ;Player Y Position
global ADDR_POSITION_Z                      := 0xB6F2EC      ;Player Z Position
global ADDR_CPED_PTR                        := 0xB6F5F0      ;Player CPED Pointer
global ADDR_CPED_HPOFF                      := 0x540         ;Player Health
global ADDR_CPED_ARMOROFF                   := 0x548         ;Player Armour
global ADDR_CPED_MONEY                      := 0x0B7CE54     ;Player Money
global ADDR_CPED_INTID                      := 0xA4ACE8      ;Player Interior-ID
global ADDR_CPED_SKINIDOFF                  := 0x22          ;Player Skin-ID
;           
global ADDR_VEHICLE_PTR                     := 0xBA18FC      ;Vehicle CPED Pointer
global ADDR_VEHICLE_HPOFF                   := 0x4C0         ;Vehicle Health
global ADDR_VEHICLE_DOORSTATE               := 0x4F8         ;Vehicle Door Status
global ADDR_VEHICLE_ENGINESTATE             := 0x428         ;Vehicle Engine Status
global ADDR_VEHICLE_SIRENSTATE              := 0x1069 
global ADDR_VEHICLE_SIRENSTATE2             := 0x1300 
global ADDR_VEHICLE_LIGHTSTATE              := 0x584         ;Vehicle Light Status
global ADDR_VEHICLE_MODEL                   := 0x22          ;Vehicle Car-ID & Car-Name
global ADDR_VEHICLE_TYPE                    := 0x590         ;Vehicle Typ-ID (1 = Car)
global ADDR_VEHICLE_DRIVER                  := 0x460         ;Vehicle Driver
global ADDR_VEHICLE_X                       := 0x44          ;Vehicle Speed X
global ADDR_VEHICLE_Y                       := 0x48          ;Vehicle Speed Y
global ADDR_VEHICLE_Z                       := 0x4C          ;Vehicle Speed Z
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global oweaponNames := ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana","Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","21Desert Eagle","Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge","Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]
global oradiostationNames := ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9", "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]
global oweatherNames := ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF", "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE", "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]

; SAMP Адреса
global ADDR_SAMP_INCHAT_PTR                 := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF             := 0x55
global ADDR_SAMP_USERNAME                   := 0x219A6F
global FUNC_SAMP_SENDCMD                    := 0x65c60
global FUNC_SAMP_SENDSAY                    := 0x57f0
global FUNC_SAMP_ADDTOCHATWND               := 0x64520
global ADDR_SAMP_CHATMSG_PTR                := 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT               := 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR               := 0x62da0
global FUNC_SAMP_STOPAUDIOSTR               := 0x629a0
; ########################## Стили Диалога ##########################
global DIALOG_STYLE_MSGBOX			        := 0
global DIALOG_STYLE_INPUT 			        := 1
global DIALOG_STYLE_LIST			        := 2
global DIALOG_STYLE_PASSWORD		        := 3
global DIALOG_STYLE_TABLIST			        := 4
global DIALOG_STYLE_TABLIST_HEADERS	        := 5
; ######################### Структуры диалога #########################
global SAMP_DIALOG_STRUCT_PTR				:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET				:= 0x1C
global SAMP_DIALOG_LINES_OFFSET 			:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET				:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET	:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET	:= 0x466
global SAMP_DIALOG_PTR2_OFFSET 				:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET			:= 0x150
global SAMP_DIALOG_OPEN_OFFSET				:= 0x28
global SAMP_DIALOG_STYLE_OFFSET				:= 0x2C
global SAMP_DIALOG_ID_OFFSET				:= 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET			:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET			:= 0x40
global FUNC_SAMP_SHOWDIALOG				 	:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG				:= 0x6C040
global FUNC_UPDATESCOREBOARD                := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global ADDR_SAMP_CRASHREPORT 				:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global SAMP_KILLSTAT_OFFSET                 := 0x21A0EC
global multVehicleSpeed_tick                := 0
global CheckpointCheck 						:= 0xC7DEEA
global rmaddrs 								:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]

; Sizes
global SIZE_SAMP_CHATMSG                    := 0xFC
; Internal
global hGTA                                 := 0x0
global dwGTAPID                             := 0x0
global dwSAMP                               := 0x0
global pMemory                              := 0x0
global pParam1                              := 0x0
global pParam2                              := 0x0
global pParam3                              := 0x0
global pParam4                              := 0x0
global pParam5                              := 0x0
global pInjectFunc                          := 0x0
global nZone                                := 1
global nCity                                := 1
global bInitZaC                             := 0
global iRefreshScoreboard                   := 0
global oScoreboardData                      := ""
global iRefreshHandles                      := 0
global iUpdateTick                          := 2500 ; Время в мс, используемое в функциях getPlayerNameById и др. для обновления данных. По умолчанию 2500 (2.5 сек)
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с клиентом SAMP                                                                                  #
; #     - IsSAMPAvailable()                         - Возвращает состояние SAMP (0 - Запущен, 1 - Выключен)                     #
; #     - isInChat()                                - Проверяет открыт ли чат (0 - нет, 1 - да)                                 #
; #     - getUsername()                             - Возвращает ник локального игрока                                          #
; #     - getId()                                   - Возвращает id локального игрока                                           #
; #     - SendChat(wText)                           - Отправка сообщения/команды серверу                                        #
; #     - addChatMessage(wText)                     - Локальное сообдещие в чат                                                 #
; #     - showGameText(wText, dwTime, dwTextsize)   - Отоброжение Game Text                                                     #
; #     - playAudioStream(wUrl)                     - Воспроизведение аудиопотока                                               #
; #     - stopAudioStream()                         - Остановка аудиопотока                                                     #
; #	    - GetChatLine(Line, Output)		            - Вывод строки из чат лога (0 - Последняя строка)                           #
; # 	- blockChatInput() 					        - Блокировка отправления сообщений серверу                                  #
; # 	- unBlockChatInput() 						- Разблокировка отправлений сообщений серверу                               #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - getServerName()                           - Возвращает название сервера                       						#
; #     - getServerIP()                             - Возвращает IP сервера      						    			        #
; #     - getServerPort()                           - Возвращает порт сервера              									    #
; #     - CountOnlinePlayers()                      - Возвращает текущий онлайн на сервере                                      #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #	    - getWeatherID()			                - Возвращает ID текущей погоды                                              #
; #	    - getWeatherName()			                - Возвращает название текущей погоды                                        #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - patchRadio()                              - Включает патч для аудиопотока                                             #
; #     - unPatchRadio()                            - Выключает патч для аудиопотока 		                                    #
; # 														                                                                    #
; ###############################################################################################################################
; # Функции для взаимодействия с диалогами (v.0.3.7)	        											                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; #	    - isDialogOpen()                            - Проверяет открыт ли диалог                       	                       	#
; #	    - getDialogStyle()                          - Возвращает id стиля диалога                              					#
; #	    - getDialogID()                             - Возвращает id диалога (исходя из данных сервера)                  		#
; #	    - setDialogID(id)                           - Изменение ID диалога          				                        	#
; #	    - getDialogCaption()                        - Возвращает заголовок диалога           			                        #
; #	    - getDialogText()                           - Возвращает текст диалога                                                  #
; #	    - getDialogLineCount()                      - Возвращает количество строк диалога                                       #
; #	    - getDialogLine(index)                      - Возвращает содержимое строки по номеру           	                       	#
; #	    - getDialogLines()                          - Возвращает массив строк диалога  	     	        	                   	#
; #     - getDialogStructPtr()                      - Возвращает указатель на структуру диалога                                	#
; #	    - showDialog(style, caption, text, button1, button2, id) - Создание локального диалога         	                       	#
; #	                                                                                                                            #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с игроками                                                                                       #
; #	    - getTargetPed(dwPED)   			        - Возвращает PED ID, по таргету                                             #
; #     - getPedById(dwId)                          - Возвращает PED ID по id игрока                                            #
; #     - getIdByPed(dwId)                          - Возвращает id игрока по PED                                               #
; #     - getStreamedInPlayersInfo()                - Возвращает объект, хранящий информацию об игроках в зоне стрима           #
; #     - callFuncForAllStreamedInPlayers(cfunc)    - Вызывает функцию отображающую всю информации о игроках в зоне стрима      #
; #	    - getDist(pos1, pos2)   			        - Возвращает растояние между двумя точками                                  #
; #     - getClosestPlayerPed()                     - Возвращает PED ID ближайшего игрока                                       #
; #     - getClosestPlayerId()                      - Возвращает id ближайшего игрока                                           #
; #	    - getPedCoordinates(dwPED)   			    - Возвращает кординаты (в зоне стрима) по PED ID                            #
; #     - getTargetPosById(dwId)                    - Возвращает позицию игрока по id                                           #
; #     - getTargetPlayerSkinIdByPed(dwPED)         - Возвращает id скина по PED ID                                             #
; #     - getTargetPlayerSkinIdById(dwId)           - Возвращает id скина по id игрока                                          #
; #     - calcScreenCoors(fX,fY,fZ)                 - Возвращает массив координат [fX,fY,fZ] относительно экрана                #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с транспортом:                                                                                   #
; #	    - getVehiclePointerByPed(dwPED)   			- Возвращает указатель на транспорт по PED ID                               #
; #	    - getVehiclePointerById(dwId)   			- Возвращает указатель на транспорт по id игрока                            #
; #     - isTargetInAnyVehicleByPed(dwPED)          - Проверяет находится ли игрок в транспорте по PED ID                       #
; #     - isTargetInAnyVehicleById(dwId)            - Проверяет находится ли игрок в транспорте по id игрока                    #
; #     - getTargetVehicleHealthByPed(dwPED)        - Возвращает hp транспорта по PED ID                                        #
; #     - getTargetVehicleHealthById(dwId)          - Возвращает hp транспорта по id игрока                                     #
; #     - getTargetVehicleTypeByPed(dwPED)          - Возвращает тип транспорта по PED ID (возвращает число, а не название)     #
; #     - getTargetVehicleTypeById(dwId)            - Возвращает тип транспорта по id игрока (возвращает число, а не название)  #
; #     - getTargetVehicleModelIdByPed(dwPED)       - Возвращает номер модели транспорта по PED ID                              #
; #     - getTargetVehicleModelIdById(dwId)         - Возвращает номер модели транспорта по id игрока                           #
; #     - getTargetVehicleModelNameByPed(dwPED)     - Возвращает название модели транспорта по PED ID 				            #
; #     - getTargetVehicleModelNameById(dwId)       - Возвращает название модели транспорта по id игрока 				        #
; #     - getTargetVehicleLightStateByPed(dwPED)    - Возвращает состояние света транспорта по PED ID (вкл./выкл.)			    #
; #     - getTargetVehicleLightStateById(dwId)      - Возвращает состояние света транспорта по id игрока (вкл./выкл.)		    #
; #     - getTargetVehicleEngineStateByPed(dwPED)   - Возвращает состояние мотора транспорта по PED ID (вкл./выкл.)			    #
; #     - getTargetVehicleEngineStateById(dwId)     - Возвращает состояние мотора транспорта по id игрока (вкл./выкл.) 			#
; #     - getTargetVehicleLockStateByPed(dwPED)     - Возвращает состояние дверей транспорта по PED ID (закрыты/открыты) 	    #
; #     - getTargetVehicleLockStateById(dwId)       - Возвращает состояние дверей транспорта по id игрока (закрыты/открыты)     #
; #     - getTargetVehicleColor1ByPed(dwPED)        - Возвращает 1-й цвет транспорта по PED ID 			                        #
; #     - getTargetVehicleColor1ById(dwId)          - Возвращает 1-й цвет транспорта по id игрока			                    #
; #     - getTargetVehicleColor2ByPed(dwPED)        - Возвращает 2-й цвет транспорта по PED ID 			                        #
; #     - getTargetVehicleColor2ById(dwId)          - Возвращает 2-й цвет транспорта по id игрока 			                    #
; #     - getTargetVehicleSpeedByPed(dwPED)         - Возвращает текущую скорость транспорта по PED ID			                #
; #     - getTargetVehicleSpeedById(dwId)           - Возвращает текущую скорость транспорта по id игрока		                #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодейтвия с общим списком игроков (Tab):                                                                    #
; #     - getPlayerScoreById(dwId)                  - Возвращает уровень игрока по id                                           #
; #     - getPlayerPingById(dwId)                   - Возвращает ping игрока по id                                              #
; #     - getPlayerNameById(dwId)                   - Возвращает ник игрока по id                                               #
; #     - getPlayerIdByName(wName)                  - Возвращает id игрока по нику                                              #
; #     - updateScoreboardDataEx()                  - Обновление данных Tab'a                                                   #
; #     - updateOScoreboardData()                   - Обновление данных игроков на сервере                                      #
; #	    - isNPCById(dwId)   			            - Проверяет является ли персонаж NPC по id		                            #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с локальным игроком:                                                                             #
; #     - getPlayerHealth()                         - Возвращает hp локального игрока                                           #
; #     - getPlayerArmour()                         - Возвращает количество брони локального игрока                             #
; # 	- getPlayerInteriorId()			            - Возвращает id интерьера 		                                            #
; # 	- getPlayerSkinId()			                - Возвращает id скина локального игрока          		                    #
; # 	- getPlayerMoney() 			                - Возвращает количество денег на руках у локального игрока                  #
; #	    - getPlayerWanteds()			            - Возвращает уровень розыска локального игрока                              #
; #	    - getPlayerWeaponId()			            - Возвращает id оружия в руках у локального игрока                          #
; #	    - getPlayerWeaponName()			            - Возвращает название оружия в руках у локального игрока                    #
; #	    - getPlayerState()			                - Возвращает состояние локального игрока (возвращает число)                 #
; #	    - getPlayerMapPosX()			            - Возвращает X позицию на карте (Esc > Карта) локального игрока             #
; #	    - getPlayerMapPosY()			            - Возвращает Y позицию на карте (Esc > Карта) локального игрока             #
; #	    - getPlayerMapZoom()			            - Возвращает коэф. увеличения карты (Esc > Карта) локального игрока         #
; #	    - IsPlayerFreezed()			                - Проверяет заморожен ли локальний игрок                                    #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с текущим транспортом:                                                                           #
; #     - isPlayerInAnyVehicle()                    - Проверяет находится ли локальный игрок в транспорте (любом)               #
; #     - getVehicleHealth()                        - Возвращает hp текущего транспорта                                         #
; # 	- isPlayerDriver() 			                - Проверяет является ли локальный игрок водителем		                    #
; # 	- getVehicleType() 			                - Возвращает тип текущего транспорта                                        #
; # 	- getVehicleModelId()			            - Возвращает номер модели текущего транспорта 				                #
; # 	- getVehicleModelName() 		            - Возвращает название модели текущего транспорта 				            #
; # 	- getVehicleLightState() 		            - Возвращает состояние света текущего транспорта (вкл./выкл.) 			    #
; # 	- getVehicleEngineState() 		            - Возвращает состояние мотора текущего транспорта (вкл./выкл.)			    #
; # 	- getVehicleLockState() 		            - Возвращает состояние дверей текущего транспорта 			                #
; # 	- getVehicleColor1() 		                - Возвращает 1-й цвет текущего транспорта   			                    #
; # 	- getVehicleColor2() 		                - Возвращает 2-й цвет текущего транспорта   			                    #
; # 	- getVehicleSpeed() 		                - Возвращает текущую скорость текущего транспорта   			            #
; # 	- getPlayerRadiostationID() 		        - Возвращает номер радиостанции текущего транспорта   			            #
; # 	- getPlayerRadiostationName() 		        - Возвращает название радиостанции текущего транспорта   			        #
; # 														                                                                    #
; ###############################################################################################################################
; # 														                                                                    #
; # Функции для взаимодействия с координатами:                                                                                  #
; #     - getCoordinates()                          - Возвращает массив координат [fX,fY,fZ] локального игрока                  #
; #	    - getPlayerPos(X,Y,Z) 			            - Возвращает координаты локального игрока в указанные перменные             #
; # 														                                                                    #
; # --------------------------------------------------------------------------------------------------------------------------- #
; # 														                                                                    #
; #     - initZonesAndCities()                      - Инициализация районов и городов карты                                     #
; #     - calculateZone(X, Y, Z)                    - Возвращает название района по координатам                                 #
; #     - calculateCity(X, Y, Z)                    - Возвращает название города по координатам                                 #
; #     - getCurrentZonecode()                      - ..:: НЕ РАБОТАЕТ ::..                                                     #
; #     - AddZone(Name, X1, Y1, Z1, X2, Y2, Z2)     - Добавление нового района                                                  #
; #     - AddCity(Name, X1, Y1, Z1, X2, Y2, Z2)     - Добавление нового города                                                  #
; #	    - IsPlayerInRangeOfPoint(X, Y, Z, Radius)   - Проверяет находится ли локальный игрок в радиусе 3D координат             #
; #	    - IsIsPlayerInRangeOfPoint2D(X, Y, Radius)  - Проверяет находится ли локальный игрок в радиусе 2D координат             #
; #	    - getPlayerZone()                   		- Возвращает название района локального игрока		                        #
; #	    - getPlayerCity()                   		- Возвращает название города локального игрока			                    #
; # 														                                                                    #
; ###############################################################################################################################
; # Sonstiges:                                                                                                                  #
; #     - checkHandles()                                                                                                        #
; #     - AntiCrash()								- AntiCrash                                                                 #
; ###############################################################################################################################
; # Функции для взаимодействия с памятью (внутренние функции):                                                                  #
; #     - checkHandles()                                                                                                        #
; #     - refreshGTA()                                                                                                          #
; #     - refreshSAMP()                                                                                                         #
; #     - refreshMemory()                                                                                                       #
; #     - getPID(szWindow)                                                                                                      #
; #     - openProcess(dwPID, dwRights)                                                                                          #
; #     - closeProcess(hProcess)                                                                                                #
; #     - getModuleBaseAddress(sModule, dwPID)                                                                                  #
; #     - readString(hProcess, dwAddress, dwLen)                                                                                #
; #     - readFloat(hProcess, dwAddress)                                                                                        #
; #     - readDWORD(hProcess, dwAddress)                                                                                        #
; #     - readMem(hProcess, dwAddress, dwLen=4, type="UInt")                                                                    #
; #     - writeString(hProcess, dwAddress, wString)                                                                             #
; #     - writeRaw(hProcess, dwAddress, data, dwLen)                                                                            #
; #     - Memory_ReadByte(process_handle, address)                                                                              #
; #     - callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true)                                                       #
; #     - virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect)                                                         #
; #     - virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType)                                                                #
; #     - createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter,                            #
; #     - dwCreationFlags, lpThreadId)                                                                                          #
; #     - waitForSingleObject(hThread, dwMilliseconds)                                                                          #
; #     - __ansiToUnicode(sString, nLen = 0)                                                                                    #
; #     - __unicodeToAnsi(wString, nLen = 0)                                                                                    #
; ###############################################################################################################################
; # by MurKotik                                                                                                                 #
; #     - setCoordinates(x, y, z, Interior)         - Изменяет координаты локальному игроку                                     #
; #     - setIP(IP)                                 - Изменяет IP сервера (Не доработано)                                       #
; #     - setUsername(username)                     - Изменяет ник (Не доработано)                                              #
; #     - colorhud(color)                           - Изменяет зелёный цвет в игре на указаный                                  #
; #	    - setTime(hour)	                            - Изменяет времени на сервере (визуально)                                   #
; #	    - getSkinID()   	                        - Возвращает ID Скина локального игрока                                     #
; #	    - getDialogTitle() 	                        - Возвращает заголовок последнего диалога                                   #
; #	    - getPlayerColor(id)                        - Возвращает ID цвета ника игрока по id игрока                              #
; #	    - setPlayerColor(id,color)                  - Изменяет цвет ника игроку по id игрока                                    #
; #	    - colorToStr(color)	                        - Конвертация цвета из десятичной в шестнадцатиричную систему измерения     #
; #	    - getWeaponId() 	                        - Возвращает ID оружия локального персонажа                                 #
; #     - restartGameEx()                           - Рестарт игры (Не отключает от сервера)                                    #
; #     - setrestart()                              - Изменяет состояние игрока на Restart (Переподключение к серверу)          #
; #     - disconnectEx()                            - Отключение от сервера                                                     #
; #     - WriteProcessMemory(title,addresse,wert,size) - Работа с пресетам                                                      #
; #     - FloatToHex(value)                         - Перевод из Float в Hex                                                    #
; #     - IntToHex(int)                             - Перевод из Int в Hex                                                      #
; #     - HexToDec(str)                             - Перевод из Hex в Dec (Строковых значений)                                 #
; #     - addChatMessageEx(Color, wText)            - Локальное сообщение с изменением цвета timestamp'a                        #
; #     - connect(IP)                               - Подключение к серверу по IP (Пока что без смены Порта)                    #
; #     - setWeather(id)                            - Изменяет погоду (визуально)                                               #
; #     - setPlayerFreeze(status)                   - Изменяет статус заморозки (0 - разморозка, 2 - заморозка)                 #
; # by McFree                                                                                                                   #
; #     - getPlayerPosById(dwId)                    - Возвращает позицию игрока по id игрока                                    #
; #     - HexToDecOne(Hex)                          - Перевод из Hex в Dec                                                      #
; #     - HexToDecTwo(Hex)                          - Перевод шестнадцатиричного числа в десятичное                             #
; #     - hex2rgb(CR)                               - Перевод шестнадцатиричного цвета в rgb строку (255,255,255)               #
; #     - rgb2hex(R, G, B)                          - Перевод RGB цвета в шестнадцатиричное значение (FFFFFF)                   #
; #     - ProcessWriteMemory(Str ,addresse, process, Str, byte) - Запись в память                                               #
; #     - ProcessReadMemory(address, processIDorName, type, numBytes) - Чтение из памяти                                        #
; #     - GetCoordsSamp(ByRef ResX, ByRef ResY)     - Перевод кординат монитора на кординаты SA-MP                              #
; #     - getZoneByName(zName, ByRef CurZone)       - Возвращает координаты зоны по имени                                       #
; #     - getCenterPointToZone(zName, ByRef PointPos)- Возвращает координаты центра зоны по имени                               #
; # by Godarck                                                                                                                  #
; #     - GetInterior()                             - Проверяет находится ли персонаж в интерьере (true/false)                  #
; #     - getVehicleSirenState()                    - Проверяет в ключена ли сирена (true/false)                                #
; #     - CoordsFromRedmarker()                     - Возвращает координаты метки с карты.                                      #
; #     - NearPlayerInCar(dist)                     - Определяет игрока в автомобиле рядом                                      #
; #     - isTargetDriverbyId(dwId)                  - Проверяет является ли игрок водителем т/с по id                           #
; #     - ConvertCarColor(Color)                    - Конвертация цвета в RGB для getVehicleColor1() и getVehicleColor2()       #
; # By Unknown                                                                                                                  #
; #     - disableCheckpoint()                       - Отключает маркер на карте (Disable RED Marker on map)                     #
; #     - setCheckpoint(xpos,ypos,zpos,Radius)      - Устанавливает маркер на карте                                             #
; # By MrGPro                                                                                                                   #
; #     - getServerHour()                           - Возвращает минуты по серверному времени (Только серверах где отображается)#
; #     - getServerMinute()                         - Возвращает часы по серверному времени (Только серверах где отображается)  #
; #     - getVehicleIdServer()                      - Возвращает ID транспорта на сервере в который сидит локальный игрок       #
; # By Слюнявчик                                                                                                                #
; #     - IsInAFK()                                 - Проверяет находится ли локальный игрока в AFK                             #
; #                                                      (1 - AFK, 0 - не AFK, -1 - Игра закрыта)                               #
; # By Phoenixxx_Czar                                                                                                           #
; #     - isPlayerStreamebyid(id, dist)             - Определяет есть ли игрок на заданной дистации от вас                      #
; #     - getDialogLineNumber()                     - Замена, в случае не работоспособности getDialogIndex()                    #
; #     - getsexbyskin(skin)                        - Выдает пол по иду скина (0 - Ошибка, 1 - Мужской, 2 - Женский)            #
; # By aknqkzxlcs                                                                                                               #
; #     - setPlayerName(playerid, newnick)          - Визуальная смена Ника игрока по id (над головой и в табе)                 #
; #     - getDialogIndex()                          - Возвращает индекс выбранной строки, начиная с 1                           #
; #     - isDialogButtonSelected(Button id)         - Наведена ли мышка на кнопку или была ли кнопка нажата (id: 1 или 2)       #
; #     - set_player_armed_weapon_to(weaponid)      - Меняет оружие в руках на указанное путем перелистывания                   #
; #     - setPlayerHealth(float)                    - Установить уровень ХП персонажу      (Пример данных: float := 50.0)       #
; #     - setPlayerArmor(float)                     - Установить уровень брони персонажу                                        #
; #     - setVehicleHealth(float)                   - Установить уровень ХП автомобилю                                          #
; #     - getPlayerAnim()                           - Возвращает ID текущей анимации                                            #
; #     - toggleUnlimitedAmmo()                     - Бесконечные патроны                                                       #
; #     - toggleNoReload()                          - Стрельба без перезарядки                                                  #
; #     - toggleNoRecoil()                          - Стрельба без отдачи                                                       #
; #     - getKillStat()                             - Возвращает киллстат в виде массива из 5 строк                             #
; #     - getLastDamagePed(playerid, weapon)        - Получить ид того игрока, который тебя дамажил последним                   #
; #     - toggleAntiBikeFall()                      - не падать с байка                                                         #
; #     - toggleAntiCarEject()                      - вас не могут выкинуть из машины                                           #
; #     - toggleNoAnimations()                      - анимации не отображаются                                                  #
; #     - toggleObjectDrawMode()                    - курсор для отображения информации о streamer объектах на сервере          #
; #     - toggleMotionBlur()                        - размытость при движении на большой скорости как в сингле                  #
; #     - toggleNoDamageByWeapon()                  - вкл/выкл невосприимчивость к пулям                                        #
; #     - toggleInvulnerability()                   - вкл/выкл неуязвимость                                                     #
; #     - isPlayerCrouch()                          - Положение персонажа (1 - сидит, 0 - стоит)                                #
; #     - multVehicleSpeed(1.1)                     - Спидхак, ставится в цикл. Чем выше цифра, тем сильнее пинок под зад       #
; #     - setFireImmunity(state)                    - Установить иммунитет к огню (0 - выкл, 1 - не гореть в огне)              #
; #     - setInfiniteRun(state)                     - бесконечный бег (0 выкл / 1 вкл)                                          #
; #     - isMarkerSetup()                           - Установлена ли метка на карте                                             #
; #     - setDialogState(state)                     - Свернуть / развернуть диалог 0 - Скрыть 1 - Развернуть                    #
; #     - blurlevel()                               - Выдаёт / устанавливает уровень размытости пример - blurlevel(level)       #
; #     - getWeaponAmmo()                           - Возвращает общее количество патрон в текущем оружии                       #
; #     - gmpatch()                                 - by FYP, отключает встроенный клиентский античит на бессмертие             #
; #     - getVehicleMaxPassengers()                 - Максимальное количество пассажирских мест в текущем транспорте            #
; #     - getVehiclePassenger(место)                - Возвращает CPed pointer пассажира/водителя                                #
; #     - getVehiclePassengerId(место)              - возвращает id пассажира/водителя места: 0 водительское, 1-8 пассажирские  #
; #     - writeBytes(hProcess, dwAddress, bytes)    - записать несколько байтов по адресу (служебная функция)                   #
; #     - setChatState(state)                       - установить состояние чату (от 0 до 2)                                     #
; #     - getChatState()                            - состояние видимости чата (0 - спрятан, 1 - без контура, 2 - с контуром)   #
; #     - getChatLineEx(line = 0)                   - Читает чат из памяти, а не из чатлога                                     #
; #     - removeChatLine(line = 0)                  - Удаляет строку из чата                                                    #
; #     - NOP_SetPlayerPos()                        - Если включен, то сервер не может вас телепортировать куда-либо            #
; # By Dworkin                                                                                                                  #
; #     - getCameraCoordinates()                    - Получение координаты вашей камеры                                         #
; #     - GetBonePosition(ped,boneId)               - Получение координат костей по педу.                                       #
; # By Ghost29                                                                                                                  #
; #     - togglekillstat(state)                     - Переключает киллстат. (1 - вкл, 0 - выкл)                                 #
; #     - setkillstatwidth(width)                   - Ширина между строками киллстата                                           #
; #     - movekillstat(x)                           - Двигает киллстат по Х                                                     #
; #     - setdistkillstat(int)                      - Расстояние между правым столбиком и иконкой гана                          #
; #     - PrintLow(text, time)                      - Выводит текст внизу экрана. Поддерживает форматирование типа ~g~ / ~n~    #
; ###############################################################################################################################



; # Аргументы для функции getWeaponAmmo(Ammo, Clip, Slot = -1)
; # [1] Ammo - возвращает в указанную переменную общее количество патрон текущего оружия
; # [2] Clip (необязательный) - возвращает в переменную количество патрон в магазине текущего оружия
; # [3] Slot (необязательный) - если не указан, то возвращает количество патрон текущего оружия, иначе патроны оружия из указанного слота
; # Подробнее: http://wiki.sa-mp.com/wiki/Weapons

getWeaponAmmo(ByRef Ammo := "", ByRef Clip := "", slot := -1)
{
    if(!checkHandles())
        return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
        return -1
    if slot not between 0 and 12
    {
        VarSetCapacity(slot, 1)
        DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", CPed + 0x718, "Str", slot, "UInt", 1, "UInt*", 0)
        slot := NumGet(slot, 0, "short")
        if slot >= 12544
            slot -= 12544
    }
    struct := CPed + 0x5AC
    VarSetCapacity(Ammo, 4)
    VarSetCapacity(Clip, 4)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot), "Str", Ammo, "UInt", 4, "UInt*", 0)
    DllCall("ReadProcessMemory", "UInt", hGTA, "UInt", struct + (0x1C * slot) - 0x4, "Str", Clip, "UInt", 4, "UInt*", 0)
    Ammo := NumGet(Ammo, 0, "int")
    Clip := NumGet(Clip, 0, "int")
    return Ammo
}

NOP_SetPlayerPos(tog := -1)
{
    if(!checkHandles())
        return -1
    dwAddress := dwSAMP+0x15970
    byte := readMem(hGTA, dwAddress, 1, "byte")
    if((tog == -1 && byte != 195) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwAddress, "C390")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwAddress, "E910")
        return false
    }
    return -1
}

removeChatLine(line := 0)
{
    if(!checkHandles())
        return false
    if(!dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR))
        return false
    loop % 100 - line
    {
        a := ""
        dwLine := dwAddress + 0x132 + ( (99 - A_Index - line) * 0xFC )
        loop 0xFC
        {
            byte := substr(inttohex(Memory_ReadByte(hGTA, dwLine++)), 3)
            a .= (strlen(byte) == 1 ? "0" : "") byte
        }
        dwLine := dwAddress + 0x132 + ( (100 - A_Index - line) * 0xFC )
        writeBytes(hGTA, dwLine, a)
    }
    sendinput {f7 3} ; 3 - без соба, 4 - есть собейт
    return true
}

getChatLineEx(line := 0) {
    ; 0x152 - offset for first message
    ; 0xFC - size of a message
    ; 99 - max count of a messages
    if(!checkHandles())
        return
    dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
    dwAddress := readDWORD(hGTA, dwPtr)
    if(ErrorLevel)
        return
    msg := readString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), 0xFC)
    if(ErrorLevel)
        return
    return msg
}

PrintLow(text, time) {
    ;0x69F1E0 = PrintLowPriorityMessage(const char* text, int time_in_ms, int unknown1 = 1, int unknown2 = 1);
    if(!checkHandles())
        return -1
    dwFunc := 0x69F1E0
    callwithparams(hGta, dwFunc, [["s",text], ["i", time], ["i", 1], ["i", 1]], true)
}

getChatState(state := -1)
{
    if(!checkHandles())
        return false
    dwAddr := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR) + 8
    if state between 0 and 2
    {
        writeByte(hGTA, dwAddr, state)
        sendinput {f7 3}
    }
    return Memory_ReadByte(hGTA, dwAddr)
}

GetBonePosition(ped,boneId){
    callWithParamsBonePos(0x5E4280, [["i", ped],["i", pParamBonePos1],["i",boneId],["i", 1]], false, true)
    return [readFloat(hGTA, pParamBonePos1), readFloat(hGTA, pParamBonePos1 + 4), readFloat(hGTA, pParamBonePos1 + 8)]
}
    callWithParamsBonePos(dwFunc, aParams, bCleanupStack = true,  thiscall = false) {
    validParams := 0
    i := aParams.MaxIndex()
    dwLen := i * 5 + 5 + 1
    if(bCleanupStack)
    dwLen += 3
    VarSetCapacity(injectData, i * 5 + 5 + 3 + 1, 0)
    i_ := 1
    while(i > 0) {
    if(aParams[i][1] != "") {
        dwMemAddress := 0x0
    if(aParams[i][1] == "p") {
        dwMemAddress := aParams[i][2]
    } else if(aParams[i][1] == "s") {
        if(i_>3)
            return false
        dwMemAddress := pParamBonePos%i_%
        writeString(hGTA,dwMemAddress, aParams[i][2])
        if(ErrorLevel)
            return false
        i_ += 1
        } else if(aParams[i][1] == "i") {
            dwMemAddress := aParams[i][2]
        } else {
            return false
        }
            NumPut((thiscall && i == 1 ? 0xB9 : 0x68), injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
            i -= 1
        }
            offset := dwFunc - ( pInjectFuncBonePos + validParams * 5 + 5 )
            NumPut(0xE8, injectData, validParams * 5, "UChar")
            NumPut(offset, injectData, validParams * 5 + 1, "Int")
            if(bCleanupStack) {
            NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
            NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
            NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
            } else {
                NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
            }
            writeRaw(hGTA, pInjectFuncBonePos, &injectData, dwLen)
            if(ErrorLevel)
                return false
            hThread := createRemoteThread(hGTA, 0, 0, pInjectFuncBonePos, 0, 0, 0)
            if(ErrorLevel)
                return false
            waitForSingleObject(hThread, 0xFFFFFFFF)
            closeProcess(hThread)
            return true
        }
getVehicleMaxPassengers()
{
    if(!checkHandles())
        return -1
    if(!CVeh := readDWORD(hGTA, ADDR_VEHICLE_PTR))
        return -1
    return readMem(hGTA, CVeh + 0x488, 1, "byte")
}

getVehiclePassenger(place)
{
    ; возвращает указатель на игрока
    ; 0 - водитель, от 1 до 8 - пассажирские места
    if(!checkHandles())
        return -1
    if(!CVeh := readDWORD(hGTA, ADDR_VEHICLE_PTR))
        return -1
    return readDWORD(hGTA, CVeh + 0x460 + (place * 4))
}

getVehiclePassengerId(place)
{
    CPed := getVehiclePassenger(place)
    return getIdByPed(CPed)
}

getLastDamagePed(ByRef Ped := "", ByRef Weapon := "")
{
    if(!checkHandles())
        return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
        return -1
    if(!dwPed := readDWORD(hGTA, CPed + 0x764))
        return -1
    Ped := getIdByPed(dwPed)
    Weapon := readMem(hGTA, CPed + 0x760, 4, "int")
    return Ped
}

getKillStat(ByRef IsEnabled := "")
{
    if(!checkHandles())
        return false
    a := []
    klist := readDWORD(hGTA, dwSAMP + 0x21A0EC)
    isEnabled := readMem(hGTA, klist, 4, "int")
    klist += 4
    loop 5
    {
        szKiller := readString(hGTA, klist, 25)
        szVictim := readString(hGTA, (klist += 25), 25)
        clKillerColor := inttohex(readMem(hGTA, (klist += 25), 4, "uint"))
        clVictimColor := inttohex(readMem(hGTA, (klist += 4), 4, "uint"))
        byteType := Memory_ReadByte(hGTA, (klist += 4))
        klist++
        a.Insert([szKiller, szVictim, clKillerColor, clVictimColor, byteType])
    }
    return a
}

setFireImmunity(state)
{
    if(!checkHandles())
        return
    writeMemory(hGTA, 0xB7CEE6, (state ? 1 : 0), 1, "byte")
}

setInfiniteRun(state)
{
    if(!checkHandles())
        return
    writeMemory(hGTA, 0xB7CEE4, (state ? 1 : 0), 1, "byte")
}

isMarkerSetup()
{
    if(!checkHandles())
        return -1
    return readMem(hGTA, 0xBA6774, 1, "byte")
}

multVehicleSpeed(MultValue := 1.01, SleepTime := 10, MaxSpeedX := 2.0, MaxSpeedY := 2.0)
{
    if(multVehicleSpeed_tick + SleepTime > A_TickCount)
        return false
    multVehicleSpeed_tick := A_TickCount
    
    if(!checkHandles())
        return false
    if(!dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR))
        return false
    
    if(!MultValue)
    {
        writeFloat(hGTA, dwAddr + ADDR_VEHICLE_X, 0.0)
        writeFloat(hGTA, dwAddr + ADDR_VEHICLE_Y, 0.0)
        return true
    }
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    
    if(abs(fSpeedX) <= MaxSpeedX)
        writeFloat(hGTA, dwAddr + ADDR_VEHICLE_X, fSpeedX * MultValue)
    if(abs(fSpeedY) <= MaxSpeedY)
        writeFloat(hGTA, dwAddr + ADDR_VEHICLE_Y, fSpeedY * MultValue)
    
    return true
}


togglekillstat(state) 
{
    if(!checkHandles())
        return false
    dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
    if(ErrorLevel || dwKillptr == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    writeBytes(hGTA, dwKillptr, state)
    if(ErrorLevel) {
  ErrorLevel := ERROR_WRITE_MEMORY
  return -1
    }
    return true
}

setkillstatwidth(width)
{
   if(!checkHandles())
        return false
        
    dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
    if(ErrorLevel || dwKillptr == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    writeBytes(hGTA, dwKillptr + 0x133, width)
    if(ErrorLevel) {
  ErrorLevel := ERROR_WRITE_MEMORY
  return false
    }
    return true
}

movekillstat(x)
{
    if(!checkHandles())
        return false
        
    dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
    if(ErrorLevel || dwKillptr == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    writeBytes(hGTA, dwKillptr + 0x12B, x)
    if(ErrorLevel) {
  ErrorLevel := ERROR_WRITE_MEMORY
  return false
    }
    return true
}

setdistkillstat(int)
{
        if(!checkHandles())
        return false
        
    dwKillptr := readDWORD(hGTA, dwSAMP + SAMP_KILLSTAT_OFFSET)
    if(ErrorLevel || dwKillptr == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    writeBytes(hGTA, dwKillptr + 0x12F, int)
    if(ErrorLevel) {
  ErrorLevel := ERROR_WRITE_MEMORY
  return false
    }
    return true
}

getWeaponSlotById(id)
{
    if id between 2 and 9
        slot := 1
    if id between 10 and 15
        slot := 10
    if id in 16,17,18,39
        slot := 8
    if id between 22 and 24
        slot := 2
    if id between 25 and 27
        slot := 3
    if id in 28,29,32
        slot := 4
    if id in 30,31
        slot := 5
    if id in 33,34
        slot := 6
    if id between 35 and 38
        slot := 7
    if id == 40
        slot := 12
    if id between 41 and 43
        slot := 9
    if id between 44 and 46
        slot := 11
}

isPlayerCrouch()
{
    if(!checkHandles())
        return -1
    if(!CPed := readDWORD(hGTA, ADDR_CPED_PTR))
        return -1
    state := readMem(hGTA, CPed + 0x46F, 1, "byte")
    if(state == 132)
        return 1
    if(state == 128)
        return 0
    return -1
}

setDialogState(tog)
{
    if(!checkHandles())
        return false
    
    dwPointer := getDialogStructPtr()
    if(ErrorLevel || !dwPointer)
        return false
    
    writeMemory(hGTA, dwPointer + 0x28, (tog ? 1 : 0), 1, "byte")
    if(!tog)
        Send {f6}{esc}
    return true
}

toggleObjectDrawMode(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, dwSAMP + 0x69529, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x69529, "0F84AE000000")
        Send {f6}{esc}
        return false
    }
    return -1
}

blurlevel(level := -1)
{
    if(!checkHandles())
        return -1
    if level between 0 and 255
        writeMemory(hGTA, 0x8D5104, level, 1, "byte")
    blur := readMem(hGTA, 0x8D5104, 1, "byte")
    return blur
}

toggleNoDamageByWeapon(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x60A5BA, 1, "byte")
    if((tog == -1 && byte == 216) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x60A5BA, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x60A5BA, "D95E18")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

toggleInvulnerability(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x60A5BA, 1, "byte")
    if((tog == -1 && byte == 217) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x4B3314, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x4B3314, "D86504")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

gmpatch()
{
    if(!checkHandles())
        return false
    a := writeMemory(hGTA, 0x4B35A0, 0x560CEC83, 4, "int")
    b := writeMemory(hGTA, 0x4B35A4, 0xF18B, 2, "byte")
    return (a && b)
}

toggleUnlimitedAmmo(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x7428E6, 1, "byte")
    if((tog == -1 && byte == 255) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428E6, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428E6, "FF4E0C")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

toggleNoReload(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x7428B0, 1, "byte")
    if((tog == -1 && byte == 137) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x7428B0, "909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x7428B0, "894608")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

toggleNoRecoil(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x740450, 1, "byte")
    if((tog == -1 && byte == 216) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x740450, "90909090909090909090")
        return true
    } else if((tog == -1 && byte == 144) || !tog)
    {
        writeBytes(hGTA, 0x740450, "D80D3C8B8500D84C241C")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

toggleAntiBikeFall(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x4BA3B9, 1, "byte")
    if((tog == -1 && byte == 15) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x4BA3B9, "E9A703000090")
        return true
    } else if((tog == -1 && byte == 233) || !tog)
    {
        writeBytes(hGTA, 0x4BA3B9, "0F84A6030000")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

toggleAntiCarEject(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, dwSAMP + 0x146E0, 1, "byte")
    if((tog == -1 && byte == 233) || tog == true || tog == 1)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "C390909090")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeBytes(hGTA, dwSAMP + 0x146E0, "E9D7722700")
        return false
    }
    return -1
}

toggleNoAnimations(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, dwSAMP + 0x16FA0, 1, "byte")
    if((tog == -1 && byte == 85) || tog == true || tog == 1)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0xC3, 1, "byte")
        return true
    } else if((tog == -1 && byte == 195) || !tog)
    {
        writeMemory(hGTA, dwSAMP + 0x16FA0, 0x55, 1, "byte")
        return false
    }
    return -1
}

toggleMotionBlur(tog := -1)
{
    if(!checkHandles())
        return -1
    byte := readMem(hGTA, 0x704E8A, 1, "byte")
    if((tog == -1 && byte == 144) || tog == true || tog == 1)
    {
        writeBytes(hGTA, 0x704E8A, "E811E2FFFF")
        return true
    } else if((tog == -1 && byte == 232) || !tog)
    {
        writeBytes(hGTA, 0x704E8A, "9090909090")
        return false
    }
    addChatMessageEx(0xCC0000, "only for gta_sa.exe 1.0 us")
    return -1
}

writeBytes(handle, address, bytes)
{
    length := strlen(bytes) / 2
    VarSetCapacity(toInject, length, 0)
    Loop %length%
    {
        byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
        NumPut(byte, toInject, A_Index - 1, "uchar")
    }
    return writeRaw(handle, address, &toInject, length)
}

setPlayerFreeze(status) {
    if(!checkHandles())
        return -1
    
    dwCPed := readDWORD(hGTA, 0xB6F5F0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    dwAddr := dwCPed + 0x42 
	writeString(hGTA, dwAddr, status)
	if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return -1		
	}     
    ErrorLevel := ERROR_OK
    return true
}

getPlayerAnim()
{
    if(!checkHandles())
        return false
    dwPointer := readDWORD(hGTA, dwSAMP + 0x13D190)
    anim := readMem(hGTA, dwPointer + 0x2F4C, 2, "byte")
    return anim
}

setPlayerHealth(amount) {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    writeFloat(hGTA, dwAddr, amount)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return true
}

setPlayerArmor(amount) {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    writeFloat(hGTA, dwAddr, amount)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return true
}

setVehicleHealth(amount) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    writeFloat(hGTA, dwAddr, amount)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return true
}

getDialogIndex() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return false
    
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    index := readMem(hGTA, dwPointer + 0x143, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return index + 1
}

isDialogButtonSelected(btn := 1) {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return false
    
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    offset := (btn == 1 ? 0x165 : 0x2C5)
    sel := readMem(hGTA, dwPointer + offset, 1, "Byte")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return sel
}

getServerHour() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Hour := readMem(hGTA, 0xB70153, 1, "Int")
    if (Hour <= 9) {
        FixHour = 0%Hour%
        return FixHour
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return Hour
}
getsexbyskin(skin) 
{ 
if skin in 1,2,3,4,5,6,7,8,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,42,43,44,45,46,47,48,49,50,51,52,57,58,59,60,61,62,66,67,68,70,71,72,73,79,80,81,82,83,84,86,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,132,133,134,135,136,137,142,143,144,146,147,149,153,154,155,156,158,159,160,161,162,163,164,165,166,167,168,170,171,173,174,175,176,177,179,180,181,182,183,184,185,186,187,188,189,200,202,203,204,206,208,209,210,212,213,217,220,221,222,223,227,228,229,230,234,235,236,239,240,241,242,247,248,249,250,252,253,254,255,258,259,260,261,262,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,299,300,301,302,303,304,305,310,311
    return 1 
if skin in 9,10,11,12,13,31,38,39,40,41,53,54,55,56,63,64,65,69,75,76,77,85,87,88,89,90,91,92,93,129,130,131,138,139,140,141,143,144,145,148,150,151,152,157,169,172,178,190,191,192,193,194,195,196,197,198,199,201,205,207,211,214,215,216,218,219,224,225,226,231,232,233,237,238,243,244,245,246,251,256,257,263,298,306,307,308,309 
    return 2 
else 
    return 0 
}

set_player_armed_weapon_to(weaponid)
{
    c := getPlayerWeaponId()
    WinGet, gtapid, List, GTA:SA:MP
    SendMessage, 0x50,, 0x4090409,, GTA:SA:MP
    Loop
    {
        ControlSend,, {E down}, ahk_id %gtapid1%
        Sleep, 5
        ControlSend,, {E up}, ahk_id %gtapid1%
        if(getPlayerWeaponId() == c || getPlayerWeaponId() == weaponid)
            break
    }
}

getZoneByName(zName, ByRef CurZone ) { 
    if ( bInitZaC == 0 ) 
    { 
        initZonesAndCities() 
        bInitZaC := 1 
    } 
    Loop % nZone-1 
    { 
        if (zone%A_Index%_name == zName) 
        { 
            ErrorLevel := ERROR_OK 
            CurZone[1] := zone%A_Index%_name 
            CurZone[2] := %A_Index% 
            CurZone[3,1,1] := zone%A_Index%_x1 
            CurZone[3,1,2] := zone%A_Index%_y1 
            CurZone[3,1,3] := zone%A_Index%_z1 
            CurZone[3,2,1] := zone%A_Index%_x2 
            CurZone[3,2,2] := zone%A_Index%_y2 
            CurZone[3,2,3] := zone%A_Index%_z2 
            return true 
        } 
    } 
    ErrorLevel := ERROR_ZONE_NOT_FOUND 
    return "Unknown" 
} 
; PointPos[1] - X Point 
; PointPos[2] - Z Point 
getCenterPointToZone(zName, ByRef PointPos) { 
    getZoneByName(zName, CurZone) 
    PointPos[1] := 125 + CurZone[3,1,1] 
    PointPos[2] := 125 + CurZone[3,1,2] 
    return true 
}

getDialogLineNumber() {
    dwPointer := getDialogStructPtr()
    if (ErrorLevel || !dwPointer)
        return 0
    dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINENUMBER_OFFSET, 4, "UInt")
    if (ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    return count//16777216+1
}

getServerMinute() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    Minute := readMem(hGTA, 0xB70152, 1, "Int")
    if (Minute <= 9) {
        FixMinute = 0%Minute%
        return FixMinute
    }
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return Minute
}

getCameraCoordinates() {
    if(!checkHandles())
        return false

    fX := readFloat(hGTA, 0xB6F9CC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, 0xB6F9D0)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, 0xB6F9D4)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

getPlayerPosById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
   if(oScoreboardData[dwId].HasKey("PED"))
    return getPedCoordinates(oScoreboardData[dwId].PED)
   if(oScoreboardData[dwId].HasKey("MPOS"))
    return oScoreboardData[dwId].MPOS
  }
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
    {
  if(oScoreboardData[dwId].HasKey("PED"))
   return getPedCoordinates(oScoreboardData[dwId].PED)
  if(oScoreboardData[dwId].HasKey("MPOS"))
   return oScoreboardData[dwId].MPOS
    }
    return ""
}

HexToDecOne(Hex)
{
    if (InStr(Hex, "0x") != 1)
    Hex := "0x" Hex
    return, Hex + 0
}

HexToDecTwo(hex)
{
    VarSetCapacity(dec, 66, 0)
    , val := DllCall("msvcrt.dll\_wcstoui64", "Str", hex, "UInt", 0, "UInt", 16, "CDECL Int64")
    , DllCall("msvcrt.dll\_i64tow", "Int64", val, "Str", dec, "UInt", 10, "CDECL")
    return dec
}
hex2rgb(CR)
{
    NumPut((InStr(CR, "#") ? "0x" SubStr(CR, 2) : "0x") SubStr(CR, -5), (V := "000000"))
    return NumGet(V, 2, "UChar") "," NumGet(V, 1, "UChar") "," NumGet(V, 0, "UChar")
}
rgb2hex(R, G, B, H := 1)
{
    static U := A_IsUnicode ? "_wcstoui64" : "_strtoui64"
    static V := A_IsUnicode ? "_i64tow"    : "_i64toa"
    rgb := ((R << 16) + (G << 8) + B)
    H := ((H = 1) ? "#" : ((H = 2) ? "0x" : ""))
    VarSetCapacity(S, 66, 0)
    value := DllCall("msvcrt.dll\" U, "Str", rgb , "UInt", 0, "UInt", 10, "CDECL Int64")
    DllCall("msvcrt.dll\" V, "Int64", value, "Str", S, "UInt", 16, "CDECL")
    return H S
}
GetCoordsSamp(ByRef ResX, ByRef ResY) 
{
    MouseGetPos, PosX, PosY
    PosXProc := PosX * 100 / A_ScreenWidth
    PosYProc := PosY * 100 / A_ScreenHeight
    ResX := PosXProc * 8
    ResY := PosYProc * 6
}
getVehicleIdServer(address=0x13C298, datatype="int", length=4, offset=0)
{
    if (isPlayerDriver() != "-1" or isPlayerInAnyVehicle() != "0")
    {
    Process, Exist, gta_sa.exe
    PID_GTA := ErrorLevel
    VarSetCapacity(me32, 548, 0)
    NumPut(548, me32)
    snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", 0x00000008, "Uint", PID_GTA)
    If (snapMod = -1)
        Return 0
    If (DllCall("Module32First", "Uint", snapMod, "Uint", &me32))
{
  Loop
        {
            If (!DllCall("lstrcmpi", "Str", "samp.dll", "UInt", &me32 + 32)) {
                DllCall("CloseHandle", "UInt", snapMod)
                key:= NumGet(&me32 + 20)
                WinGet, PID_SAMP, PID, GTA:SA:MP
                hwnd_samp := DllCall("OpenProcess","Uint",0x1F0FFF,"int",0,"int", PID_SAMP)
                VarSetCapacity(readvalue,length, 0)
                DllCall("ReadProcessMemory","Uint",hwnd_samp,"Uint",key+address+offset,"Str",readvalue,"Uint",length,"Uint *",0)
                finalvalue := NumGet(readvalue,0,datatype)
                DllCall("CloseHandle", "int", hwnd_samp)
                return finalvalue
            }
        }
    Until !DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)
    }
    DllCall("CloseHandle", "Uint", snapMod)
    }
    else
        Return 0
}
; Визуально меняет ник любого игрока
setPlayerName(playerid, newnick) {
    if(!checkHandles() || !strlen(newnick))
        return 0

    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }

    dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+playerid*4)      ;pRemotePlayer
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
        
    if(dwRemoteplayer==0)
        return 0
        
    dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    sUsername := ""
    if(dwTemp <= 0xf)
    {
        sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, newnick)
    }
    else {
        dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
        if(ErrorLevel || dwAddress==0) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        writeString(hGTA, dwAddress, newnick)
    }
    
    ErrorLevel := ERROR_OK
    return 1
}

HexToDec(str)
{   
   local newStr := ""
   static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
   StringLower, str, str
   str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
   Loop, % StrLen(str)
       newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
   newStr := StrSplit(newStr, "")
   local ret := 0
   for i,char in newStr
       ret += comp[char]*(16**(i-1))
   return ret
}

addChatMessageEx(Color, wText) {
   wText := "" wText

   if(!checkHandles())
       return false
   
    VarSetCapacity(data2, 4, 0)
   NumPut(HexToDec(Color),data2,0,"Int")
    
   Addrr := readDWORD(hGTA, dwSAMP+ADDR_SAMP_CHATMSG_PTR)
   
   VarSetCapacity(data1, 4, 0)
   NumPut(readDWORD(hGTA, Addrr + 0x12A), data1,0,"Int") 
   
   WriteRaw(hGTA, Addrr + 0x12A, &data2, 4)
    
   dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
   dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
   if(ErrorLevel) {
       ErrorLevel := ERROR_READ_MEMORY
       return false
   }
   
   callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
   WriteRaw(hGTA, Addrr + 0x12A, &data1, 4)
   
   ErrorLevel := ERROR_OK
    
   return true
}

connect(IP) {
    setIP(IP)
    restartGameEx()
    disconnectEx()
    Sleep 1000
    setrestart()
    Return
}

WriteProcessMemory(title,addresse,wert,size)  
{ 
	VarSetCapacity(idvar,32,0) 
	VarSetCapacity(processhandle,32,0) 
	VarSetCapacity(value, 32, 0) 
	NumPut(wert,value,0,Uint) 
	address=%addresse% 	
	WinGet ,idvar,PID,%title% 
	processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar) 
	Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint",size,"Uint",0) 
}

setCoordinates(x, y, z, Interior) {
    if(!checkHandles())
        return False

    dwAddress := readMem(hGTA, ADDR_SET_POSITION)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }

    dwAddress := readMem(hGTA, dwAddress + ADDR_SET_POSITION_OFFSET)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        Return False
    }

    Sleep 100

    writeByte(hGTA, ADDR_SET_INTERIOR_OFFSET, Interior)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }

    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_X_OFFSET, x)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }

    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Y_OFFSET, y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }

    writeFloat(hGTA, dwAddress + ADDR_SET_POSITION_Z_OFFSET, z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        Return False
    }

    Return True
}
colorhud(colorhud) 
{ 
    VarSetCapacity(idvar,32,0) 
    VarSetCapacity(processhandle,32,0) 
    VarSetCapacity(value, 32, 0) 
    NumPut(colorhud,value,0,Uint) 
    address=0xBAB230
    WinGet ,idvar,PID,GTA:SA:MP
    processhandle:=DllCall("OpenProcess","Uint",0x38,"int",0,"int",idvar) 
    Bvar:=DllCall("WriteProcessMemory","Uint",processhandle,"Uint",address+0,"Uint",&value,"Uint","4","Uint",0) 
}

; Смена Ip Сервера
setIP(IP) {
    if(!checkHandles())
        return False

    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return False
    }

    writeString(hGTA, dwAddress + SAMP_SZIP_OFFSET, IP)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }

    return True
}

; set nickname
setUsername(Username) {
    if(!checkHandles())
        return False

    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    writeString(hGTA, dwAddress, Username)
    if(ErrorLevel) {
        ErrorLevel := ERROR_WRITE_MEMORY
        return False
    }

    ErrorLevel := ERROR_OK
    return True
}

setChatLine(line, msg) {
	if(!checkHandles())
		return -1

	dwPtr := dwSAMP + ADDR_SAMP_CHATMSG_PTR
	dwAddress := readDWORD(hGTA,dwPtr)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
    }

	; 0x152, offset for first msg
	; 0xFC, size of a msg
	; 99, max msg
	writeString(hGTA, dwAddress + 0x152 + ( (99-line) * 0xFC), msg)
	if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return -1
    }
	
	sendinput {f7 3} ; 3 - без соба, 4 - есть собейт
	
	ErrorLevel := ERROR_OK
	return True
}

getTagNameDistance() {
	if(!checkHandles())
		return -1

	dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
  }

	dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
  }

  distance := readFloat(hGTA, dwSAMPInfoSettings + 0x27)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
  }

	ErrorLevel := ERROR_OK
	return distance
}

setTagNameDistance(status, distance) {
	if(!checkHandles())
		return -1

	status := status ? 1 : 0

	dwSAMPInfo := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
  }

	dwSAMPInfoSettings := readDWORD(hGTA, dwSAMPInfo + SAMP_INFO_SETTINGS_OFFSET)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
  }

	writeByte(hGTA, dwSAMPInfoSettings + 0x38, 1)
	if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return -1
  }

	writeByte(hGTA, dwSAMPInfoSettings + 0x2F, status)
	if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return -1
  }

	writeFloat(hGTA, dwSAMPInfoSettings + 0x27, distance)
	if(ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return -1
  }

	ErrorLevel := ERROR_OK
	return
}

; sets the ingame hour (day/night)
setTime(hour)
{
	if(!checkHandles())
		return
	; disable gta setTime function
	VarSetCapacity(nop, 6, 0)
	Loop 6 {
		NumPut(0x90, nop, A_INDEX-1, "UChar")
	}
	writeRaw(hGTA, 0x52D168, &nop, 6)

	; set our own weather
	VarSetCapacity(time, 1, 0)
	NumPut(hour, time, 0, "Int")
	writeRaw(hGTA, 0xB70153, &time, 1)
}

; sets the weather
; @param weather id
setWeather(id)
{
	if(!checkHandles())
		return
	VarSetCapacity(weather, 1, 0)
	NumPut(id, weather, 0, "Int")
	writeRaw(hGTA, 0xC81320, &weather, 1)
	if(ErrorLevel)
		return false


	return true
}

; get the id of your skin
getSkinID() {
	if(!checkHandles())
		return -1

	dwAddress := readDWORD(hGTA, 0xB6F3B8)

	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	id := readMem(hGTA, dwAddress + 0x22, 2, "UShort")
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	ErrorLevel := ERROR_OK
	return id
}

; get the title of dialog
getDialogTitle()
{
	if(!checkHandles())
		return ""
	dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0B8)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}
	text := readString(hGTA, dwAddress + 0x40, 128)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	ErrorLevel := ERROR_OK
	return text
}
; get the color of player
; @author democrazy
getPlayerColor(id)
{
    id += 0

    if(!checkHandles())
        return -1

    color := readDWORD(hGTA, dwSAMP + 0x216378 + 4*id)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    return color
}

; set the color of player
; @author democrazy
setPlayerColor(id,color)
{
    id += 0
    color +=0

    if(!checkHandles())
        return

    VarSetCapacity(bla, 4, 0)
    NumPut(color,bla,0,"UInt")

    writeRaw(hGTA, dwSAMP + 0x216378 + 4*id, &bla, 4)
}
; convert color from decimal into hex
; @author democrazy
colorToStr(color)
{
    color += 0
    color >>= 8
    color &= 0xffffff
    SetFormat, IntegerFast, hex
    color += 0
    color .= ""
    StringTrimLeft, color, color, 2
    SetFormat, IntegerFast, d
    if (StrLen(color) == 5)
       color := "0"color
    return "{" color "}"
}

; Get Interior param.
;;@autor Godarck

GetInterior()
{
    dwAddress := readDWORD(hGTA, ADDR_SET_INTERIOR_OFFSET)
    if (ErrorLevel || dwAddress == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }    
  return true
}

; get current weapon id
; @author AnalFatal
getWeaponId()
{
    If(!checkHandles())
    return 0

   c := readDWORD(hGTA, ADDR_CPED_PTR)
   If(ErrorLevel) {
   		ErrorLevel := ERROR_READ_MEMORY
   		return 0
   }
   id := readMem(hGTA, c + 0x740)
   If(ErrorLevel) {
   		ErrorLevel := ERROR_READ_MEMORY
   		return 0
   }

   return id
}
writeFloat(hProcess, dwAddress, wFloat) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }

    wFloat := FloatToHex(wFloat)

    dwRet := DllCall(   "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt *", wFloat
                        , "UInt", 4
                        , "UInt *", 0)

    ErrorLevel := ERROR_OK
    return true
}

writeByte(hProcess, dwAddress, wInt) {
  if(!hProcess) {
      ErrorLevel := ERROR_INVALID_HANDLE
      return false
  }

  wInt := IntToHex(wInt)

	dwRet := DllCall(     "WriteProcessMemory"
	                      , "UInt", hProcess
	                      , "UInt", dwAddress
	                      , "UInt *", wInt
	                      , "UInt", 1
	                      , "UInt *", 0)
}

FloatToHex(value) {
   format := A_FormatInteger
   SetFormat, Integer, H
   result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
   SetFormat, Integer, %format%
   return, result
}

IntToHex(int)
{
	CurrentFormat := A_FormatInteger
	SetFormat, integer, hex
	int += 0
	SetFormat, integer, %CurrentFormat%
	return int
}

disconnectEx() {
	
	if(!checkHandles())
		return 0
	
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	
	dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)			;pRakClientInterface
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
    
    ecx := dwAddress        ;this
	
	dwAddress := readDWORD(hGTA, dwAddress)         ;vtable
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	
	
	
	VarSetCapacity(injectData, 24, 0) ;mov, call, retn
	
    NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(ecx, injectData, 1, "UInt")			;1+4
    
	NumPut(0xB8, injectData, 5, "UChar")	;mov eax 	5+1
	NumPut(dwAddress, injectData, 6, "UInt")			;6+4
	
	;NumPut(0x006A006A, injectData, 10, "UInt")  ; 2x push			10+4
    
    NumPut(0x68, injectData, 10, "UChar")		;10 + 1		;push style
	NumPut(0, injectData, 11, "UInt")		;11 + 4
    
    NumPut(0x68, injectData, 15, "UChar")		;15 + 1		;push style
	NumPut(500, injectData, 16, "UInt")		;16 + 4
    
    ;---
	
	NumPut(0x50FF, injectData, 20, "UShort")			;20 + 2
	NumPut(0x08, injectData, 22, "UChar")			;22 + 1
	
	NumPut(0xC3, injectData, 23, "UChar")	;retn		23+1
	
	writeRaw(hGTA, pInjectFunc, &injectData, 24)
	if(ErrorLevel)
		return false
	
	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false
	
	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}
setrestart()
{
  VarSetCapacity(old, 4, 0)
  dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
    if(ErrorLevel || dwAddress==0) {
      ErrorLevel := ERROR_READ_MEMORY
      return 0
  }

  NumPut(9,old,0,"Int")
  writeRaw(hGTA, dwAddress + 957, &old, 4)
}
restartGameEx() {
	
	if(!checkHandles())
		return -1
	
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)			;g_SAMP
	if(ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}
	
	dwFunc := dwSAMP + 0xA060
	
	VarSetCapacity(injectData, 11, 0) ;mov, call, retn
	
	NumPut(0xB9, injectData, 0, "UChar")	;mov ecx 	0+1
	NumPut(dwAddress, injectData, 1, "UInt")			;1+4
	NumPut(0xE8, injectData, 5, "UChar")	;call 		5+1
	offset := dwFunc - (pInjectFunc + 10)
	NumPut(offset, injectData, 6, "Int")	;			6+4
    NumPut(0xC3, injectData, 10, "UChar")	;		10+1
	
	writeRaw(hGTA, pInjectFunc, &injectData, 11)
	if(ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if(ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)

  closeProcess(hThread)

	return true
}
; ##### SAMP-Funktionen #####
isPlayerStreamebyid(id, dist) { 
    if (getPlayerNameById(id)=="")
        return -1
    p := getStreamedInPlayersInfo()
    if(!p)
        return 0
    lpos := getCoordinates() 
    if(!lpos) 
        return 0
    For i, o in p 
    { 
        if(dist>getDist(lpos, o.POS))   
        { 
            if (id = o.ID) 
            return 1
        } 
        else 
        return 0
    }  
}
IsSAMPAvailable() {
    if(!checkHandles())
        return false
	
	dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
	
	if(dwChatInfo == 0 || dwChatInfo == "ERROR")
	{
		return false
	}
	else
	{
		return true
	}
}
isInChat() {
    if(!checkHandles())
        return -1
    
    dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
    dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwInChat := readDWORD(hGTA, dwAddress)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    if(dwInChat > 0) {
        return true
    } else {
        return false
    }
}

getUsername() {
    if(!checkHandles())
        return ""
    
    dwAddress := dwSAMP + ADDR_SAMP_USERNAME
    sUsername := readString(hGTA, dwAddress, 25)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return sUsername
}

getId() {
    s:=getUsername()
    return getPlayerIdByName(s)
}


SendChat(wText) {
     wText := "" wText
    
    if(!checkHandles())
        return false
    
    dwFunc:=0
    if(SubStr(wText, 1, 1) == "/") {
        dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    } else {
        dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    }
    
    callWithParams(hGTA, dwFunc, [["s", wText]], false)
    
    ErrorLevel := ERROR_OK
    return true
}
;=================================================[Работа с памятью]=========================================================
; Источник - http://dumpz.org/2345353/
ProcessReadMemory(address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
        return -1
        ;throw Exception("Invalid process name or process ID:`n`n""" . processIDorName . """")
    if !processHandle := DllCall("OpenProcess", "Int", 24, "UInt", 0, "UInt", processID, "Ptr")
        throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
    result := DllCall("ReadProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "PtrP", numBytesRead, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
        throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
    if !result
        throw Exception("Failed to read process memory.`n`nError code:`t" . A_LastError)
    if !numBytesRead
        throw Exception("Read 0 bytes from the`n`nprocess:`t" . processIDorName . "`naddress:`t" . address)
    return (type = "Str")
        ? StrGet(&buf, numBytes)
        : NumGet(buf, type)
}
ProcessWriteMemory(data, address, processIDorName, type := "Int", numBytes := 4) {
    VarSetCapacity(buf, numBytes, 0)
    (type = "Str")
        ? StrPut(data, &buf, numBytes)
        : NumPut(data, buf, type)
    Process Exist, %processIDorName%
    if !processID := ErrorLevel
        ;throw Exception("Invalid process name or process ID:`n`n""" . processIDorName . """")
        return
    if !processHandle := DllCall("OpenProcess", "Int", 40, "UInt", 0, "UInt", processID, "Ptr")
        throw Exception("Failed to open process.`n`nError code:`t" . A_LastError)
        result := DllCall("WriteProcessMemory", "Ptr", processHandle, "Ptr", address, "Ptr", &buf, "Ptr", numBytes, "UInt", 0, "UInt")
    if !DllCall("CloseHandle", "Ptr", processHandle, "UInt") && !result
        throw Exception("Failed to close process handle.`n`nError code:`t" . A_LastError)
    if !result
        ;throw Exception("Failed to write process memory.`n`nError code:`t" . A_LastError)
        return
    return result
}
;==================================================[Работа с памятью]==========================================================
addChatMessage(wText) {
    wText := "" wText

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
    dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
    
    ErrorLevel := ERROR_OK
    return true
}

showGameText(wText, dwTime, dwSize) {
    wText := "" wText
    dwTime += 0
    dwTime := Floor(dwTime)
    dwSize += 0
    dwSize := Floor(dwSize)

    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
    
    callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
    
    ErrorLevel := ERROR_OK
    return true
}

playAudioStream(wUrl) {
    wUrl := "" wUrl
    
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    
    patchRadio()
    
    callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
    
    unPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

stopAudioStream() {
    if(!checkHandles())
        return false
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    
    patchRadio()
    
    callWithParams(hGTA, dwFunc, [["i", 1]], false)
    
    unPatchRadio()
    
    ErrorLevel := ERROR_OK
    return true
}

patchRadio()
{
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 4, 0)
    NumPut(0x90909090,nop,0,"UInt")
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    writeRaw(hGTA, dwFunc, &nop, 4)
    writeRaw(hGTA, dwFunc+4, &nop, 1)
    return true
}

unPatchRadio()
{
    if(!checkHandles())
        return false
    
    VarSetCapacity(old, 4, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x39,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    
    dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
    NumPut(0x74003980,old,0,"UInt")
    writeRaw(hGTA, dwFunc, &old, 4)
    NumPut(0x09,old,0,"UChar")
    writeRaw(hGTA, dwFunc+4, &old, 1)
    return true
}

blockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0x04C2,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

unBlockChatInput() {
    if(!checkHandles())
        return false
    
    VarSetCapacity(nop, 2, 0)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
    NumPut(0xA164,nop,0,"Short")
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
    writeRaw(hGTA, dwFunc, &nop, 2)
    
    return true
}

getServerName() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerName := readString(hGTA, dwAdress + 0x121, 200)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerName
}

getServerIP() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerIP := readString(hGTA, dwAdress + 0x20, 100)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerIP
}

getServerPort() {
    if(!checkHandles())
        return -1
    
    dwAdress := readMem(hGTA, dwSAMP + 0x21A0F8, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAdress)
        return -1
    
    ServerPort := readMem(hGTA, dwAdress + 0x225, 4, "int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return ServerPort
}

getWeatherID() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    WeatherID := readMem(hGTA, dwGTA + 0xC81320, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return WeatherID
}

getWeatherName() {
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    if(id >= 0 && id < 23)
    {
        return oweatherNames[id-1]
    }
    return ""
}

; ##### Extra-Player-Funktionen #####
; by Godarck
isTargetDriverbyId(dwId) 
{ 
    if(!checkHandles()) 
    return -1 
    dwPedPointer := getPedById(dwId) 
    dwAddrVPtr := getVehiclePointerByPed(dwPedPointer) 
    if(ErrorLevel) { 
    ErrorLevel := ERROR_READ_MEMORY 
    return -1 
    } 
    dwVal := readDWORD(hGTA, dwAddrVPtr + ADDR_VEHICLE_DRIVER) 
    if(ErrorLevel) { 
    ErrorLevel := ERROR_READ_MEMORY 
    return -1 
    } 
    ErrorLevel := ERROR_OK 
    return (dwVal == dwPedPointer) 
}
getTargetPed() {
	if(!checkHandles())
        return 0
	
	dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	if(!dwAddress)
		return 0
		
	dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	
	ErrorLevel := ERROR_OK
	return dwAddress
}

calcScreenCoors(fX,fY,fZ)
{
	if(!checkHandles())
		return false
	
	dwM := 0xB6FA2C
	
	m_11 := readFloat(hGTA, dwM + 0*4)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	m_12 := readFloat(hGTA, dwM + 1*4)
	m_13 := readFloat(hGTA, dwM + 2*4)
	m_21 := readFloat(hGTA, dwM + 4*4)
	m_22 := readFloat(hGTA, dwM + 5*4)
	m_23 := readFloat(hGTA, dwM + 6*4)
	m_31 := readFloat(hGTA, dwM + 8*4)
	m_32 := readFloat(hGTA, dwM + 9*4)
	m_33 := readFloat(hGTA, dwM + 10*4)
	m_41 := readFloat(hGTA, dwM + 12*4)
	m_42 := readFloat(hGTA, dwM + 13*4)
	m_43 := readFloat(hGTA, dwM + 14*4)
	
	dwLenX := readDWORD(hGTA, 0xC17044)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	dwLenY := readDWORD(hGTA, 0xC17048)
	
	frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
	frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
	frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
	
	fRecip := 1.0/frZ
	frX *= fRecip * dwLenX
	frY *= fRecip * dwLenY
    
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
        return [frX,frY,frZ]
}
ConvertCarColor(Color)
{
    ArrayRGB := ["0xF5F5F5FF", "0x2A77A1FF", "0x840410FF", "0x263739FF", "0x86446EFF", "0xD78E10FF", "0x4C75B7FF", "0xBDBEC6FF", "0x5E7072FF", "0x46597AFF", "0x656A79FF", "0x5D7E8DFF", "0x58595AFF", "0xD6DAD6FF", "0x9CA1A3FF", "0x335F3FFF", "0x730E1AFF", "0x7B0A2AFF", "0x9F9D94FF", "0x3B4E78FF", "0x732E3EFF", "0x691E3BFF", "0x96918CFF", "0x515459FF", "0x3F3E45FF", "0xA5A9A7FF", "0x635C5AFF", "0x3D4A68FF", "0x979592FF", "0x421F21FF", "0x5F272BFF", "0x8494ABFF", "0x767B7CFF", "0x646464FF", "0x5A5752FF", "0x252527FF", "0x2D3A35FF", "0x93A396FF", "0x6D7A88FF", "0x221918FF", "0x6F675FFF", "0x7C1C2AFF", "0x5F0A15FF", "0x193826FF", "0x5D1B20FF", "0x9D9872FF", "0x7A7560FF", "0x989586FF", "0xADB0B0FF", "0x848988FF", "0x304F45FF", "0x4D6268FF", "0x162248FF", "0x272F4BFF", "0x7D6256FF", "0x9EA4ABFF", "0x9C8D71FF", "0x6D1822FF", "0x4E6881FF", "0x9C9C98FF", "0x917347FF", "0x661C26FF", "0x949D9FFF", "0xA4A7A5FF", "0x8E8C46FF", "0x341A1EFF", "0x6A7A8CFF", "0xAAAD8EFF", "0xAB988FFF", "0x851F2EFF", "0x6F8297FF", "0x585853FF", "0x9AA790FF", "0x601A23FF", "0x20202CFF", "0xA4A096FF", "0xAA9D84FF", "0x78222BFF", "0x0E316DFF", "0x722A3FFF", "0x7B715EFF", "0x741D28FF", "0x1E2E32FF", "0x4D322FFF", "0x7C1B44FF", "0x2E5B20FF", "0x395A83FF", "0x6D2837FF", "0xA7A28FFF", "0xAFB1B1FF", "0x364155FF", "0x6D6C6EFF", "0x0F6A89FF", "0x204B6BFF", "0x2B3E57FF", "0x9B9F9DFF", "0x6C8495FF", "0x4D8495FF", "0xAE9B7FFF", "0x406C8FFF", "0x1F253BFF", "0xAB9276FF", "0x134573FF", "0x96816CFF", "0x64686AFF", "0x105082FF", "0xA19983FF", "0x385694FF", "0x525661FF", "0x7F6956FF", "0x8C929AFF", "0x596E87FF", "0x473532FF", "0x44624FFF", "0x730A27FF", "0x223457FF", "0x640D1BFF", "0xA3ADC6FF", "0x695853FF", "0x9B8B80FF", "0x620B1CFF", "0x5B5D5EFF", "0x624428FF", "0x731827FF", "0x1B376DFF", "0xEC6AAEFF", "0x000000FF"]
    ArrayRGBNew := ["0x177517FF", "0x210606FF", "0x125478FF", "0x452A0DFF", "0x571E1EFF", "0x010701FF", "0x25225AFF", "0x2C89AAFF", "0x8A4DBDFF", "0x35963AFF", "0xB7B7B7FF", "0x464C8DFF", "0x84888CFF", "0x817867FF", "0x817A26FF", "0x6A506FFF", "0x583E6FFF", "0x8CB972FF", "0x824F78FF", "0x6D276AFF", "0x1E1D13FF", "0x1E1306FF", "0x1F2518FF", "0x2C4531FF", "0x1E4C99FF", "0x2E5F43FF", "0x1E9948FF", "0x1E9999FF", "0x999976FF", "0x7C8499FF", "0x992E1EFF", "0x2C1E08FF", "0x142407FF", "0x993E4DFF", "0x1E4C99FF", "0x198181FF", "0x1A292AFF", "0x16616FFF", "0x1B6687FF", "0x6C3F99FF", "0x481A0EFF", "0x7A7399FF", "0x746D99FF", "0x53387EFF", "0x222407FF", "0x3E190CFF", "0x46210EFF", "0x991E1EFF", "0x8D4C8DFF", "0x805B80FF", "0x7B3E7EFF", "0x3C1737FF", "0x733517FF", "0x781818FF", "0x83341AFF", "0x8E2F1CFF", "0x7E3E53FF", "0x7C6D7CFF", "0x020C02FF", "0x072407FF", "0x163012FF", "0x16301BFF", "0x642B4FFF", "0x368452FF", "0x999590FF", "0x818D96FF", "0x99991EFF", "0x7F994CFF", "0x839292FF", "0x788222FF", "0x2B3C99FF", "0x3A3A0BFF", "0x8A794EFF", "0x0E1F49FF", "0x15371CFF", "0x15273AFF", "0x375775FF", "0x060820FF", "0x071326FF", "0x20394BFF", "0x2C5089FF", "0x15426CFF", "0x103250FF", "0x241663FF", "0x692015FF", "0x8C8D94FF", "0x516013FF", "0x090F02FF", "0x8C573AFF", "0x52888EFF", "0x995C52FF", "0x99581EFF", "0x993A63FF", "0x998F4EFF", "0x99311EFF", "0x0D1842FF", "0x521E1EFF", "0x42420DFF", "0x4C991EFF", "0x082A1DFF", "0x96821DFF", "0x197F19FF", "0x3B141FFF", "0x745217FF", "0x893F8DFF", "0x7E1A6CFF", "0x0B370BFF", "0x27450DFF", "0x071F24FF", "0x784573FF", "0x8A653AFF", "0x732617FF", "0x319490FF", "0x56941DFF", "0x59163DFF", "0x1B8A2FFF", "0x38160BFF", "0x041804FF", "0x355D8EFF", "0x2E3F5BFF", "0x561A28FF", "0x4E0E27FF", "0x706C67FF", "0x3B3E42FF", "0x2E2D33FF", "0x7B7E7DFF", "0x4A4442FF", "0x28344EFF"]
if (Color > 0) and (Color < 128)
  RGB := ArrayRGB[Color]
if (Color > 127) and (Color < 256)
{
  RGB := ArrayRGBNew[Color + 127]
}
StringLeft, RGBTemp, RGB, 8
StringRight, RGB, RGBTemp, 6
if Color = 0
   RGB := "000000"
return RGB
}
;--
getPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return 0
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
                return oScoreboardData[dwId].PED
        }
        return 0
    }
    
    if(!updateOScoreboardData())
        return 0
    
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
    }
    return 0
}

getIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
	if(!dwPed)
		return -1
	
	if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
		For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
				if(o.PED==dwPed)
					return i
            }
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
	For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
			if(o.PED==dwPed)
				return i
        }
    }
    return -1
}
IsInAFK() {
    res := ProcessReadMemory(0xBA6748 + 0x5C, "gta_sa.exe")
    if (res==-1)
        return -1
    WinGet, win, MinMax, GTA:SA:MP
    if ((res=0) and (win=-1)) or res=1
        return 1
    return 0
}
getStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := getPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    
    if(!updateOScoreboardData())
        return ""
    
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := getPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}

callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
        return false
    p := getStreamedInPlayersInfo()
    if(!p)
        return false
    if(dist<0x7fffffff)
    {
        lpos := getCoordinates()
        if(!lpos)
            return false
        For i, o in p
        {
            if(dist>getDist(lpos,o.POS))
                %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
            %cfunc%(o)
    }
    return true
}

getDist(pos1,pos2) {
	if(!pos1 || !pos2)
		return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getClosestPlayerPed() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := getPedById(id)
    return PED
}

getClosestPlayerId() {
    dist := 0x7fffffff              ;max int32
    p := getStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := getCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=getDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}

CountOnlinePlayers() {
if(!checkHandles())
return -1
dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwOnline + 0x4
OnlinePlayers := readDWORD(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return OnlinePlayers
}

getPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return ""
    
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

getTargetPos(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
			if(oScoreboardData[dwId].HasKey("PED"))
				return getPedCoordinates(oScoreboardData[dwId].PED)
			if(oScoreboardData[dwId].HasKey("MPOS"))
				return oScoreboardData[dwId].MPOS
		}
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
    {
		if(oScoreboardData[dwId].HasKey("PED"))
			return getPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
    return ""
}

getTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

getTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
        return -1
    
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

setTargetPlayerSkinIdById(dwId, skinid) {
    if(!checkHandles())
        return -1
    
    dwPED := getPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    
    writeMemory(hGTA, dwAddr, skinid, 2, "byte")

    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return true
}


; ##### Extra-Player-Fahrzeug-Funktionenn #####

NearPlayerInCar(dist)
{
    TempDist := 100000
    if(!p := getStreamedInPlayersInfo())
        return false
    if(!lpos := getCoordinates())
        return false
    for i, o in p
    {
        t := getDist(lpos, o.POS)
        if(t <= dist)
        {
            if(t < TempDist && t > 5 && isTargetInAnyVehiclebyId(o.ID))
                TempId := i, TempDist := t
        }
    }
    return TempId
}

getVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return 0
	if(!checkHandles())
        return 0
	dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

getVehiclePointerById(dwId) {
    if(!dwId)
        return 0
	if(!checkHandles())
        return 0
    
    dwPed_By_Id := getPedById(dwId)
    
	dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

isTargetInAnyVehicleByPed(dwPED)
{
    if(!checkHandles())
        return -1
    
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

isTargetInAnyVehiclebyId(dwId)
{
    if(!checkHandles())
        return -1
    
    dwPedPointer := getPedById(dwId)
    dwVehiclePointer := getVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

getTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := getVehiclePointerByPed(dwPed)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getTargetVehicleHealthById(dwId) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := getVehiclePointerById(dwId)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getTargetVehicleTypeByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getTargetVehicleTypeById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getTargetVehicleModelIdByPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleModelIdById(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleModelNameByPed(dwPED) {
    id := getTargetVehicleModelIdByPed(dwPED)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

getTargetVehicleModelNameById(dwId) {
    id := getTargetVehicleModelIdById(dwId)
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}

getTargetVehicleLightStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}


getTargetVehicleLightStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

getTargetVehicleLockStateByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

getTargetVehicleLockStateById(dwId) {
    if(!checkHandles())
        return -1
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}

getTargetVehicleColor1byPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor1byId(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor2byPed(dwPED) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerByPed(dwPED)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleColor2byId(dwId) {
    if(!checkHandles())
        return 0
    
    dwAddr := getVehiclePointerById(dwId)
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getTargetVehicleSpeedByPed(dwPED) {
    if(!checkHandles())
        return -1
 
    dwAddr := getVehiclePointerByPed(dwPED)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhГѓВ¶ht bzw. verringert
 
	return fVehicleSpeed
}

getTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
        return -1
 
    dwAddr := getVehiclePointerById(dwId)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhГѓВ¶ht bzw. verringert
 
	return fVehicleSpeed
}
; ##### Scoreboard-Funktionen #####

getPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].NAME
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
    return ""
}

getPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
                return i
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
            return i
    }
    return -1
}

getPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].SCORE
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
    return ""
}

getPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
        
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].PING
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
    return -1
}

isNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].ISNPC
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
    return -1
}

; internal stuff
updateScoreboardDataEx() {
    
    if(!checkHandles())
        return false
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)            ;g_SAMP
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    
    VarSetCapacity(injectData, 11, 0) ;mov + call + retn
    
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
    
}

; internal stuff
updateOScoreboardData() {
    if(!checkHandles())
        return 0
    
    oScoreboardData := []
    
    if(!updateScoreboardDataEx())
        return 0
    
    iRefreshScoreboard := A_TickCount
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")    ;sLocalPlayerID
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")    ;iStrlen_LocalPlayerName
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)       ;szLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)        ;pszLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)      ;pRemotePlayer
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        if(dwRemoteplayer==0)
            continue
        
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)                ;pPlayerData
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)		;this ever happen?
            continue
		
		dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)        ;iGlobalMarkerLoaded
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		if(dwAddress)
		{
			ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")        ;x map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")        ;y map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")        ;z map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			o.MPOS := [ix, iy, iz]
		}
        
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)                ;pSAMP_Actor
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)               ;not streamed in
            continue

        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)                ;pGTA_Ped_
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
            continue
        o.PED := dwPed
		
		fHP := readFloat(hGTA, dwRemoteplayerData + 444)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		o.HP := fHP
		o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}


; ##### Sonstiges #####
; written by David_Luchs %
; returns nth message of chatlog (beggining from bottom)
; -1 = error
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
	chatindex := 0
	FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	loop, Parse, file, `n, `r
	{
		if(A_LoopField)
			chatindex := A_Index
	}
	loop, Parse, file, `n, `r
	{
		if(A_Index = chatindex - line){
			output := A_LoopField
			break
		}
	}
	file := ""
	if(!timestamp)
		output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
	if(!color)
		output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
	return
} 

; ##### Spielerfunktionen #####
getPlayerHealth() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getPlayerArmor() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getPlayerInteriorId() {
    if(!checkHandles())
        return -1
    
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return iid
}

getPlayerSkinID() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

getPlayerMoney() {
    if(!checkHandles())
        return ""
    
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return money
}

getPlayerWanteds() {
    if(!checkHandles())
        return -1
 
    dwPtr := 0xB7CD9C
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    ErrorLevel := ERROR_OK
    return Wanteds
}

getPlayerWeaponId() {
    if(!checkHandles())
        return 0
    
    WaffenId := readMem(hGTA, 0xBAA410, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }

   return WaffenId
}

getPlayerWeaponName() {
    id := getPlayerWeaponId()
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}

getPlayerState() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    State := readDWORD(hGTA, dwCPedPtr + 0x530)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return State
}

IsPlayerInMenu() {
    if(!checkHandles())
        return -1
    
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return IsInMenu
}

getPlayerMapPosX() {
    if(!checkHandles())
        return -1
    
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosX
}

getPlayerMapPosY() {
    if(!checkHandles())
        return -1
    
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosY
}

getPlayerMapZoom() {
    if(!checkHandles())
        return -1
    
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapZoom
}

IsPlayerFreezed() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return IPF
}

; ##### Fahrzeugfunktionen #####

isPlayerInAnyVehicle()
{
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return (dwVehPtr > 0)
}

isPlayerDriver() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==dwCPedPtr)
}

getVehicleHealth() {
    if(!checkHandles())
        return -1
    
    dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

getVehicleType() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if(!cVal)
    {
        mid := getVehicleModelId()
        Loop % oAirplaneModels.MaxIndex()
        {
            if(oAirplaneModels[A_Index]==mid)
                return 5
        }
        return 1
    }
    else if(cVal==5)
        return 2
    else if(cVal==6)
        return 3
    else if(cVal==9)
    {
        mid := getVehicleModelId()
        Loop % oBikeModels.MaxIndex()
        {
            if(oBikeModels[A_Index]==mid)
                return 6
        }
        return 4
    }
    return 0
}

getVehicleModelId() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
    
    sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleModelName() {
    id:=getVehicleModelId()
    if(id > 400 && id < 611)
    {
        return ovehicleNames[id-399]
    }
    return ""
}


getVehicleLightState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal>0)
}

getVehicleEngineState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}


getVehicleSirenState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1

    cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_SIRENSTATE, 1, "Char")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (cVal==-48)
}

getVehicleLockState() {
    if(!checkHandles())
        return -1
    
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    if(!dwAddr)
        return -1
    
    dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return (dwVal==2)
}
getVehicleColor1() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1076, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleColor2() {
    if(!checkHandles())
        return 0
    
    dwAddr := readDWORD(hGTA, 0xBA18FC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    if(!dwAddr)
        return 0
	
    sVal := readMem(hGTA, dwAddr + 1077, 1, "byte")
	
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return sVal
}

getVehicleSpeed() {
    if(!checkHandles())
        return -1
 
    dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhГѓВ¶ht bzw. verringert
 
	return fVehicleSpeed
}

getPlayerRadiostationID() {
    if(!checkHandles())
        return -1
    
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return RadioStationID
}

getPlayerRadiostationName() {
    if(isPlayerInAnyVehicle() == 0)
        return -1
    
    id := getPlayerRadiostationID()
    
    if(id == 0)
        return -1
    
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}

; ##### Checkpointsachen #####
setCheckpoint(fX, fY, fZ, fSize ) {
    if(!checkHandles())
        return false
    dwFunc := dwSAMP + 0x9D340
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(buf, 16, 0)
    NumPut(fX, buf, 0, "Float")
    NumPut(fY, buf, 4, "Float")
    NumPut(fZ, buf, 8, "Float")
    NumPut(fSize, buf, 12, "Float")
    writeRaw(hGTA, pParam1, &buf, 16)
    dwLen := 31
    VarSetCapacity(injectData, dwLen, 0)
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    NumPut(0x68, injectData, 5, "UChar")
    NumPut(pParam1+12, injectData, 6, "UInt")
    NumPut(0x68, injectData, 10, "UChar")
    NumPut(pParam1, injectData, 11, "UInt")
    NumPut(0xE8, injectData, 15, "UChar")
    offset := dwFunc - (pInjectFunc + 20)
    NumPut(offset, injectData, 16, "Int")
    NumPut(0x05C7, injectData, 20, "UShort")
    NumPut(dwAddress+0x24, injectData, 22, "UInt")
    NumPut(1, injectData, 26, "UInt")
    NumPut(0xC3, injectData, 30, "UChar")
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    waitForSingleObject(hThread, 0xFFFFFFFF)
    closeProcess(hThread)
    ErrorLevel := ERROR_OK
    return true
}

disableCheckpoint()
{
    if(!checkHandles())
        return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}

IsMarkerCreatedIsMarkerCreated(){
    If(!checkHandles())
        return false
    active := readMem(hGTA, CheckpointCheck, 1, "byte")
    If(!active)
        return 0
    else return 1
}
CoordsFromRedmarker(){
    if(!checkhandles())
        return false
    for i, v in rmaddrs
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}
; ##### Positionsbestimmung #####
getCoordinates() {
    if(!checkHandles())
        return ""
    
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
        if(!checkHandles())
                return 0
 
        fX := readFloat(hGTA, ADDR_POSITION_X)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        fY := readFloat(hGTA, ADDR_POSITION_Y)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        fZ := readFloat(hGTA, ADDR_POSITION_Z)
        if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
        }
 
        ErrorLevel := ERROR_OK
}

; ######################### Dialog Functions #########################
getDialogStructPtr() {
	if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return false
	}

	dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return dwPointer
}

isDialogOpen() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
	return false

	dwIsOpen := readMem(hGTA, dwPointer + SAMP_DIALOG_OPEN_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	ErrorLevel := ERROR_OK
	return dwIsOpen ? true : false
}

getDialogStyle() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	style := readMem(hGTA, dwPointer + SAMP_DIALOG_STYLE_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return style
}

getDialogID() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	id := readMem(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	ErrorLevel := ERROR_OK
	return id
}

setDialogID(id) {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	writeMemory(hGTA, dwPointer + SAMP_DIALOG_ID_OFFSET, id, "UInt", 4)
	if (ErrorLevel) {
		ErrorLevel := ERROR_WRITE_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return true
}

getDialogCaption() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	text := readString(hGTA, dwPointer + SAMP_DIALOG_CAPTION_OFFSET, 64)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	ErrorLevel := ERROR_OK
	return text
}

getDialogTextSize(dwAddress) {
	i := 0
	Loop, 4096 {
		i := A_Index - 1
		byte := Memory_ReadByte(hGTA, dwAddress + i)
		if (!byte)
			break
	}

	return i
}

getDialogText() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_TEXT_PTR_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	text := readString(hGTA, dwPointer, 4096)
	if (ErrorLevel) {
		text := readString(hGTA, dwPointer, getDialogTextSize(dwPointer))
		if (ErrorLevel) {
			ErrorLevel := ERROR_READ_MEMORY
			return ""
		}
	}

	ErrorLevel := ERROR_OK
	return text
}

getDialogLineCount() {
	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return 0

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR2_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	count := readMem(hGTA, dwPointer + SAMP_DIALOG_LINECOUNT_OFFSET, 4, "UInt")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return count
}

getDialogLine__(index) {
	if (getDialogLineCount > index)
		return ""

	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
	line := readString(hGTA, dwLineAddress, 128)

	ErrorLevel := ERROR_OK
	return line
}

getDialogLine(index) {
	lines := getDialogLines()
	if (index > lines.Length())
		return ""

	if (getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS)
		index++

	return lines[index]
}

getDialogLines() {
	text := getDialogText()
	if (text == "")
		return -1

	lines := StrSplit(text, "`n")
	return lines
}


getDialogLines__() {
	count := getDialogLineCount()

	dwPointer := getDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	lines := []
	Loop %count% {
		dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
		lines[A_Index] := readString(hGTA, dwLineAddress, 128)
	}

	ErrorLevel := ERROR_OK
	return lines
}

showDialog(style, caption, text, button1, button2 := "", id := 1) {
	style += 0
	style := Floor(style)
	id += 0
	id := Floor(id)
	caption := "" caption
	text := "" text
	button1 := "" button1
	button2 := "" button2

	if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
		return false

	if (!checkHandles())
		return false

	dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
    sleep 200
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
	if (ErrorLevel || !dwAddress) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	writeString(hGTA, pParam5, caption)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam1, text)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam5 + 512, button1)
	if (ErrorLevel)
		return false
	writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
	if (ErrorLevel)
		return false

	;mov + 7 * push + call + retn
	dwLen := 5 + 7 * 5 + 5 + 1
	VarSetCapacity(injectData, dwLen, 0)

	NumPut(0xB9, injectData, 0, "UChar")							;0 + 1	;mov ecx
	NumPut(dwAddress, injectData, 1, "UInt")						;1 + 4
	NumPut(0x68, injectData, 5, "UChar")							;5 + 1	;push send
	NumPut(1, injectData, 6, "UInt")								;6 + 4
	NumPut(0x68, injectData, 10, "UChar")							;10 + 1	;push button2
	NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")	;11 + 4
	NumPut(0x68, injectData, 15, "UChar")							;15 + 1	;push button1
	NumPut(pParam5 + 512, injectData, 16, "UInt")					;16 + 4
	NumPut(0x68, injectData, 20, "UChar")							;20 + 1	;push text
	NumPut(pParam1, injectData, 21, "UInt")							;21 + 4
	NumPut(0x68, injectData, 25, "UChar")							;25 + 1	;push caption
	NumPut(pParam5, injectData, 26, "UInt")							;26 + 4
	NumPut(0x68, injectData, 30, "UChar")							;30 + 1	;push style
	NumPut(style, injectData, 31, "UInt")							;31 + 4
	NumPut(0x68, injectData, 35, "UChar")							;35 + 1	;push id
	NumPut(id, injectData, 36, "UInt")								;36 + 4

	NumPut(0xE8, injectData, 40, "UChar")							;40 + 1 ;call
	offset := dwFunc - (pInjectFunc + 45)
	NumPut(offset, injectData, 41, "Int")							;41 + 4
	NumPut(0xC3, injectData, 45, "UChar")							;45 + 1	;retn

	writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)

	return true
}


initZonesAndCities() {
    AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
     
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)   
}

calculateZone(posX, posY, posZ) {
    
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
        
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unknown"
}

calculateCity(posX, posY, posZ) {
    
    if ( bInitZaC == 0 )
    {
        initZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unknown"
    currentCitySize := 0
    smallestCitySize := 0
    
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unknown") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    
    if(smallestCity == "Unknown") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}

/*
;do not work?
getCurrentZonecode() {
    if(!checkHandles())
        return ""
    
    return readString(hGTA, ADDR_ZONECODE, 5)
}
*/

AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}

AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}

IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
	GetPlayerPos(posX, posY, posZ)
	X := posX -_posX
	Y := posY -_posY
	Z := posZ -_posZ
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
		return TRUE
	return FALSE
}
 
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
 
	GetPlayerPos(posX, posY, posZ)
	X := posX - _posX
	Y := posY - _posY
	if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
		return TRUE
	return FALSE
}

getPlayerZone()
{
	aktPos := getCoordinates()
	return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}

getPlayerCity()
{
	aktPos := getCoordinates()
	return calculateCity(aktPos[1], aktPos[2], aktPos[3])
}
AntiCrash(){
    If(!checkHandles())
        return false

    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}

writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
  if(!hProcess) {
    ErrorLevel := ERROR_INVALID_HANDLE
    return false
  }

  VarSetCapacity(finalvalue,length, 0)
  NumPut(writevalue,finalvalue,0,datatype)
  dwRet :=  DllCall(  "WriteProcessMemory"
              ,"Uint",hProcess
              ,"Uint",address
              ,"Uint",&finalvalue
              ,"Uint",length
              ,"Uint",0)
  if(dwRet == 0) {
    ErrorLevel := ERROR_WRITE_MEMORY
    return false
  }

  ErrorLevel := ERROR_OK
  return true
}
; ##### Sonstiges #####
checkHandles() {
    if(iRefreshHandles+500>A_TickCount)
        return true
    iRefreshHandles:=A_TickCount
    if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
        return false
    } else {
        return true
    }
    
    return true
}

; internal stuff
refreshGTA() {
    newPID := getPID("GTA:SA:MP")
    if(!newPID) {                            ; GTA not found
        if(hGTA) {                            ; open handle
            virtualFreeEx(hGTA, pMemory, 0, 0x8000)
            closeProcess(hGTA)
            hGTA := 0x0
        }
        dwGTAPID := 0
        hGTA := 0x0
        dwSAMP := 0x0
        pMemory := 0x0
        return false
    }
    
    if(!hGTA || (dwGTAPID != newPID)) {        ; changed PID, closed handle
        hGTA := openProcess(newPID)
        if(ErrorLevel) {                    ; openProcess fail
            dwGTAPID := 0
            hGTA := 0x0
            dwSAMP := 0x0
            pMemory := 0x0
            return false
        }
        dwGTAPID := newPID
        dwSAMP := 0x0
        pMemory := 0x0
        return true
    }
    return true
}

; internal stuff
refreshSAMP() {
    if(dwSAMP)
        return true
    
    dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
    if(!dwSAMP)
        return false
    
    return true
}

; internal stuff
refreshMemory() {
    if(!pMemory) {
        pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
        if(ErrorLevel) {
            pMemory := 0x0
            return false
        }
        pParam1     := pMemory
        pParam2     := pMemory + 1024
        pParam3     := pMemory + 2048
        pParam4     := pMemory + 3072
        pParam5     := pMemory + 4096
        pInjectFunc := pMemory + 5120
    }
    return true
}

; internal stuff
getPID(szWindow) {
    local dwPID := 0
    WinGet, dwPID, PID, %szWindow%
    return dwPID
}

; internal stuff
openProcess(dwPID, dwRights = 0x1F0FFF) {
    hProcess := DllCall("OpenProcess"
                        , "UInt", dwRights
                        , "int",  0
                        , "UInt", dwPID
                        , "Uint")
    if(hProcess == 0) {
        ErrorLevel := ERROR_OPEN_PROCESS
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return hProcess
}

; internal stuff
closeProcess(hProcess) {
    if(hProcess == 0) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CloseHandle"
                        , "Uint", hProcess
                        , "UInt")
    ErrorLevel := ERROR_OK
}

; internal stuff
getModuleBaseAddress(sModule, hProcess) {
    if(!sModule) {
        ErrorLevel := ERROR_MODULE_NOT_FOUND
        return 0
    }
    
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwSize = 1024*4                    ; 1024 * sizeof(HMODULE = 4)
    VarSetCapacity(hMods, dwSize)    
    VarSetCapacity(cbNeeded, 4)        ; DWORD = 4
    dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
                        , "UInt", hProcess
                        , "UInt", &hMods
                        , "UInt", dwSize
                        , "UInt*", cbNeeded
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_ENUM_PROCESS_MODULES
        return 0
    }
    
    dwMods := cbNeeded / 4            ; cbNeeded / sizeof(HMDOULE = 4)
    i := 0
    VarSetCapacity(hModule, 4)        ; HMODULE = 4
    VarSetCapacity(sCurModule, 260)    ; MAX_PATH = 260
    while(i < dwMods) {
        hModule := NumGet(hMods, i*4)
        DllCall("Psapi.dll\GetModuleFileNameEx"
                , "UInt", hProcess
                , "UInt", hModule
                , "Str", sCurModule
                , "UInt", 260)
        SplitPath, sCurModule, sFilename
        if(sModule == sFilename) {
            ErrorLevel := ERROR_OK
            return hModule
        }
        i := i + 1
    }
    
    ErrorLevel := ERROR_MODULE_NOT_FOUND
    return 0
}

; internal stuff
readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sRead
                        , "UInt", dwLen
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if A_IsUnicode
        return __ansiToUnicode(sRead)
    return sRead
}

; internal stuff
readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; float = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}

; internal stuff
readDWORD(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; DWORD = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "UInt")
}

; internal stuff
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  dwLen
                        , "UInt*", 0)
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, type)
}

; internal stuff
writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    sString := wString
    if A_IsUnicode
        sString := __unicodeToAnsi(wString)
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sString
                        , "UInt", StrLen(wString) + 1
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

; internal stuff
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt", pBuffer
                        , "UInt", dwLen
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

; internal stuff
Memory_ReadByte(process_handle, address) {
	VarSetCapacity(value, 1, 0)
	DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
	return, NumGet(value, 0, "Byte")
}

; internal stuff
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    
    i := aParams.MaxIndex()
    
    ;         i * PUSH + CALL + RETN
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
        dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                    return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                    return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

; internal stuff
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualAllocEx"
                        , "UInt", hProcess
                        , "UInt", 0
                        , "UInt", dwSize
                        , "UInt", flAllocationType
                        , "UInt", flProtect
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "VirtualFreeEx"
                        , "UInt", hProcess
                        , "UInt", lpAddress
                        , "UInt", dwSize
                        , "UInt", dwFreeType
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_FREE_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "CreateRemoteThread"
                        , "UInt", hProcess
                        , "UInt", lpThreadAttributes
                        , "UInt", dwStackSize
                        , "UInt", lpStartAddress
                        , "UInt", lpParameter
                        , "UInt", dwCreationFlags
                        , "UInt", lpThreadId
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_ALLOC_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
waitForSingleObject(hThread, dwMilliseconds) {
    if(!hThread) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    dwRet := DllCall(    "WaitForSingleObject"
                        , "UInt", hThread
                        , "UInt", dwMilliseconds
                        , "UInt")
    if(dwRet == 0xFFFFFFFF) {
        ErrorLEvel := ERROR_WAIT_FOR_OBJECT
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return dwRet
}

; internal stuff
__ansiToUnicode(sString, nLen = 0) {
   If !nLen
   {
      nLen := DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", 0
      , "int",  0)
   }

   VarSetCapacity(wString, nLen * 2)

   DllCall("MultiByteToWideChar"
      , "Uint", 0
      , "Uint", 0
      , "Uint", &sString
      , "int",  -1
      , "Uint", &wString
      , "int",  nLen)
      
    return wString
}

; internal stuff
__unicodeToAnsi(wString, nLen = 0) {
   pString := wString + 1 > 65536 ? wString : &wString

   If !nLen
   {
      nLen := DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "Uint", 0
      , "int",  0
      , "Uint", 0
      , "Uint", 0)
   }

   VarSetCapacity(sString, nLen)

   DllCall("WideCharToMultiByte"
      , "Uint", 0
      , "Uint", 0
      , "Uint", pString
      , "int",  -1
      , "str",  sString
      , "int",  nLen
      , "Uint", 0
      , "Uint", 0)
    return sString
}
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
    If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
        BOM = 3
    Else
        BOM = 0
    UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "Int", 0, "Int", 0)
    VarSetCapacity(UniBuf, UniSize * 2)
    DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
    , "UInt", &Utf8String + BOM, "Int", -1
    , "UInt", &UniBuf, "Int", UniSize)
    AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Int", 0, "Int", 0
    , "Int", 0, "Int", 0)
    VarSetCapacity(AnsiString, AnsiSize)
    DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
    , "UInt", &UniBuf, "Int", -1
    , "Str", AnsiString, "Int", AnsiSize
    , "Int", 0, "Int", 0)
    Return AnsiString
}
LineResult() { 
	if (!isDialogOpen() || getDialogStyle() = 0 || getDialogStyle() = 1 || getDialogStyle() = 3)
		return false
    while (isDialogOpen())
    continue
    if(GetKeyState("Esc", "P"))
		return false
    return getDialogLineNumber()
}

; Автор скрипта: Karlenko
; Discord: Karlenko#8459

#IfWinActive GTA:SA:MP
#SingleInstance, force
SetWorkingDir, %A_ScriptDir%

global text := -1
global disday := -1
global rtrig := -1
global chstrig := -1
global uinvtrig := -1

global version := "1.0.0."

global name := getUsername() 
global usname := RegExReplace(name, "_", " ")
global lcname := getPlayerNameById(text) 
global lcusname := RegExReplace(lcname, "_", " ")	

IniRead graf, Setting.ini, Setting, graf
IniRead style, Setting.ini, Setting, style
IniRead softname, Setting.ini, Setting, softname
IniRead trig_cam, Setting.ini, Setting, trig_cam

IniRead bind_name1, Setting.ini, Binder, bind_name1
IniRead bind_adres1, Setting.ini, Binder, bind_adres1
IniRead bind_del1, Setting.ini, Binder, bind_del1
IniRead bind_name2, Setting.ini, Binder, bind_name2
IniRead bind_adres2, Setting.ini, Binder, bind_adres2
IniRead bind_del2, Setting.ini, Binder, bind_del2
IniRead bind_name3, Setting.ini, Binder, bind_name3
IniRead bind_adres3, Setting.ini, Binder, bind_adres3
IniRead bind_del3, Setting.ini, Binder, bind_del3

IniRead menu_, Setting.ini, Hotkey, menu_
IniRead time_, Setting.ini, Hotkey, time_
IniRead time_scr, Setting.ini, Hotkey, time_scr
IniRead inter_start, Setting.ini, Hotkey, inter_start
IniRead inter_finish, Setting.ini, Hotkey, inter_finish 
IniRead find, Setting.ini, Hotkey, find

IniRead nickwo, Setting.ini, Hotkey, nickwo
IniRead nick, Setting.ini, Hotkey, nick
IniRead location, Setting.ini, Hotkey, location
IniRead rec, Setting.ini, Hotkey, rec
IniRead f, Setting.ini, Hotkey, f
IniRead r, Setting.ini, Hotkey, r

WinSet, AlwaysOnTop

Gui, Font, S9 C000000, Segoe ui light
Gui, Add, Tab, x2 y-1 w780 h360 , Cвои отыгровки|Настройка клавиш

Gui, Tab, Cвои отыгровки
Gui, Font, S10 C000000 Bold Italic, Segoe ui light
Gui, Add, GroupBox, x2 y39 w250 h300 , Отыгровка №1
Gui, Add, GroupBox, x522 y39 w250 h300 , Отыгровка №3
Gui, Tab, Cвои отыгровки
Gui, Add, GroupBox, x62 y79 w0 h20 , GroupBox
Gui, Tab, Cвои отыгровки
Gui, Font, , 
Gui, Font, S10 C000000, Segoe ui light
Gui, Add, Text, x12 y99 w100 h20 , Название:
Gui, Add, Text, x12 y189 w100 h20 , Адресовка:
Gui, Add, Text, x12 y279 w100 h20 , Задержка:
Gui, Add, Edit, x122 y99 w120 h20 +Center vbind_name1, %bind_name1%
Gui, Add, Edit, x122 y189 w120 h20 +Center vbind_adres1, %bind_adres1%
Gui, Add, Edit, x122 y279 w120 h20 +Center vbind_del1, %bind_del1%
Gui, Font, , 
Gui, Font, S10 Bold Italic, Segoe ui light
Gui, Add, GroupBox, x262 y39 w250 h300 , Отыгровка №2
Gui, Font, , 
Gui, Font, S10, Segoe ui light
Gui, Add, Text, x272 y99 w100 h20 , Название:
Gui, Add, Text, x272 y189 w100 h20 , Адресовка:
Gui, Add, Text, x272 y279 w100 h20 , Задержка:
Gui, Add, Edit, x382 y99 w120 h20 +Center vbind_name2, %bind_name2%
Gui, Add, Edit, x382 y189 w120 h20 +Center vbind_adres2, %bind_adres2%
Gui, Add, Edit, x382 y279 w120 h20 +Center vbind_del2, %bind_del2%
Gui, Add, Text, x532 y99 w100 h20 , Название:
Gui, Add, Text, x532 y189 w100 h20 , Адресовка:
Gui, Add, Text, x532 y279 w100 h20 , Задержка:
Gui, Add, Edit, x642 y99 w120 h20 +Center vbind_name3, %bind_name3%
Gui, Add, Edit, x642 y189 w120 h20 +Center vbind_adres3, %bind_adres3% 
Gui, Add, Edit, x642 y279 w120 h20 +Center vbind_del3, %bind_del3% 
Gui, Font, S11, Segoe ui light
Gui, Add, Button, x-16 y359 w808 h50 gKey , Применить
Gui, Tab, Настройка клавиш
Gui, Font, , 
Gui, Font, S11, segoe ui light
Gui, Add, Button, x-16 y359 w808 h50 gKey , Применить
Gui, Tab, Настройка клавиш
Gui, Font, , 
Gui, Font, S10, segoe ui light

Gui, Add, Text, x22 y49 w200 h20 +Right, Открыть меню:
Gui, Add, Text, x392 y49 w200 h20 +Right, Вставить ник ( без "_" ):
Gui, Add, Text, x392 y89 w200 h20 +Right, Вставить ник ( c "_" ):
Gui, Add, Text, x392 y129 w200 h20 +Right, Вставить cвое местоположение:
Gui, Add, Text, x392 y169 w200 h20 +Right, Клавиша начала записи экрана:
Gui, Add, Text, x392 y209 w200 h20 +Right, Чат фракции ( /f ):
Gui, Add, Text, x392 y249 w200 h20 +Right, Чат под фракции ( /r ):

Gui, Add, Text, x22 y89 w200 h20 +Right, Отыгровка часов:
Gui, Add, Text, x22 y129 w200 h20 +Right, Отыгровка часов с авто скрином:
Gui, Add, Text, x22 y169 w200 h20 +Right, Начало взаимодействия:
Gui, Add, Text, x22 y209 w200 h20 +Right, Конец взаимодействия:
Gui, Add, Text, x22 y249 w200 h20 +Right, Быстрый /find:
Gui, Font, S9 CA4A4A4, segoe ui light
Gui, Add, Text, x160 y306 w500 h20 +Right, По-возможности, не используйте в сочитаниях отдельные буквы. Пример: Alt+A, Ctrl+B... 
Gui, Add, Text, x302 y29 w60 h0 , Text
Gui, Font, , 
Gui, Font, S8, Segoe ui light
Gui, Add, Hotkey, x242 y49 w120 h20 vmenu_, %menu_%
Gui, Add, Hotkey, x242 y89 w120 h20 vtime_, %time_% 
Gui, Add, Hotkey, x242 y129 w120 h20 vtime_scr, %time_scr% 
Gui, Add, Hotkey, x242 y169 w120 h20 vinter_start, %inter_start% 
Gui, Add, Hotkey, x242 y209 w120 h20 vinter_finish, %inter_finish%
Gui, Add, Hotkey, x242 y249 w120 h20 vfind, %find% 

Gui, Add, Hotkey, x614 y49 w120 h20 vnickwo, %nickwo%
Gui, Add, Hotkey, x614 y89 w120 h20 vnick, %nick%
Gui, Add, Hotkey, x614 y129 w120 h20 vlocation, %location%
Gui, Add, Hotkey, x614 y169 w120 h20 vrec, %rec%
Gui, Add, Hotkey, x614 y209 w120 h20 vf, %f%
Gui, Add, Hotkey, x614 y249 w120 h20 vr, %r%
Gui, Tab, Настройка клавиш
; Generated using SmartGUI Creator 4.0
Gui, Show, x135 y87 h408 w779, AHK CH

Return

GuiClose:
ExitApp

Key:
GuiControlGet, bind_name1
GuiControlGet, bind_adres1
GuiControlGet, bind_del1
GuiControlGet, bind_name2
GuiControlGet, bind_adres2
GuiControlGet, bind_del2
GuiControlGet, bind_name3
GuiControlGet, bind_adres3
GuiControlGet, bind_del3
GuiControlGet, menu_
GuiControlGet, time_
GuiControlGet, time_scr
GuiControlGet, inter_start
GuiControlGet, inter_finish
GuiControlGet, find
GuiControlGet, style
GuiControlGet, graf
GuiControlGet, nickwo
GuiControlGet, nick
GuiControlGet, location
GuiControlGet, rec
GuiControlGet, f
GuiControlGet, r
if(bind_del1 = "" || bind_del1 = " " || bind_del1 = "  " || bind_del1 = "   " || bind_del2 = "" || bind_del2 = " " || bind_del2 = "  " || bind_del2 = "   " || bind_del3 = "" || bind_del3 = " " || bind_del3 = "  " || bind_del3 = "   "){
    bind_del1 := 2200
    bind_del2 := 2200
    bind_del3 := 2200    
}
IniWrite %bind_name1%, Setting.ini, Binder, bind_name1
IniWrite %bind_adres1%, Setting.ini, Binder, bind_adres1
IniWrite %bind_del1%, Setting.ini, Binder, bind_del1
IniWrite %bind_name2%, Setting.ini, Binder, bind_name2
IniWrite %bind_adres2%, Setting.ini, Binder, bind_adres2
IniWrite %bind_del2%, Setting.ini, Binder, bind_del2
IniWrite %bind_name3%, Setting.ini, Binder, bind_name3
IniWrite %bind_adres3%, Setting.ini, Binder, bind_adres3
IniWrite %bind_del3%, Setting.ini, Binder, bind_del3

IniWrite %menu_%, Setting.ini, Hotkey, menu_
IniWrite %time_%, Setting.ini, Hotkey, time_
IniWrite %time_scr%, Setting.ini, Hotkey, time_scr
IniWrite %inter_start%, Setting.ini, Hotkey, inter_start
IniWrite %inter_finish%, Setting.ini, Hotkey, inter_finish 
IniWrite %find%, Setting.ini, Hotkey, find
IniWrite %nickwo%, Setting.ini, Hotkey, nickwo
IniWrite %nick%, Setting.ini, Hotkey, nick
IniWrite %location%, Setting.ini, Hotkey, location
IniWrite %rec%, Setting.ini, Hotkey, rec
IniWrite %f%, Setting.ini, Hotkey, f
IniWrite %r%, Setting.ini, Hotkey, r

Hotkey, %menu_%, menu_, on UseErrorLevel
Hotkey, %time_%, time_, on UseErrorLevel
Hotkey, %time_scr%, time_scr, on UseErrorLevel
Hotkey, %inter_start%, inter_start, on UseErrorLevel
Hotkey, %inter_finish%, inter_finish, on UseErrorLevel
Hotkey, %find%, find, on UseErrorLevel
Hotkey, %nickwo%, nickwo, on UseErrorLevel
Hotkey, %nick%, nick, on UseErrorLevel
Hotkey, %location%, location, on UseErrorLevel
Hotkey, %rec%, rec, on UseErrorLevel
Hotkey, %f%, f, on UseErrorLevel
Hotkey, %r%, r, on UseErrorLevel

MsgBox, 64,Информация, Сохранено.
IfMsgBox, OK
{
  WinMinimize
}

menu_:
{       
    AntiCrash()
    StringReplace, menu_, menu_, +, Shift-, All   
    StringReplace, menu_, menu_, !, Alt-, All  
    StringReplace, menu_, menu_, ^, Ctrl-, All
    StringReplace, time_, time_, +, Shift-, All   
    StringReplace, time_, time_, !, Alt-, All  
    StringReplace, time_, time_, ^, Ctrl-, All
    StringReplace, time_scr, time_scr, +, Shift-, All   
    StringReplace, time_scr, time_scr, !, Alt-, All  
    StringReplace, time_scr, time_scr, ^, Ctrl-, All
    StringReplace, inter_start, inter_start, +, Shift-, All   
    StringReplace, inter_start, inter_start, !, Alt-, All  
    StringReplace, inter_start, inter_start, ^, Ctrl-, All
    StringReplace, inter_finish, inter_finish, +, Shift-, All   
    StringReplace, inter_finish, inter_finish, !, Alt-, All  
    StringReplace, inter_finish, inter_finish, ^, Ctrl-, All
    StringReplace, find, find, +, Shift-, All   
    StringReplace, find, find, !, Alt-, All  
    StringReplace, find, find, ^, Ctrl-, All
    StringReplace, nickwo, nickwo, +, Shift-, All   
    StringReplace, nickwo, nickwo, !, Alt-, All  
    StringReplace, nickwo, nickwo, ^, Ctrl-, All 
    StringReplace, nick, nick, +, Shift-, All   
    StringReplace, nick, nick, !, Alt-, All  
    StringReplace, nick, nick, ^, Ctrl-, All 
    StringReplace, location, location, +, Shift-, All   
    StringReplace, location, location, !, Alt-, All  
    StringReplace, location, location, ^, Ctrl-, All 
    StringReplace, rec, rec, +, Shift-, All   
    StringReplace, rec, rec, !, Alt-, All  
    StringReplace, rec, rec, ^, Ctrl-, All 
    StringReplace, f, f, +, Shift-, All   
    StringReplace, f, f, !, Alt-, All  
    StringReplace, f, f, ^, Ctrl-, All 
    StringReplace, r, r, +, Shift-, All   
    StringReplace, r, r, !, Alt-, All  
    StringReplace, r, r, ^, Ctrl-, All 

    global name := getUsername()     
    usid := getID()
    usname := RegExReplace(name, "_", " ")    
    lcname := getPlayerNameById(text) 
    lcusname := RegExReplace(lcname, "_", " ")

    if(text = -1)
        exresult := "{FF0040}отсутствует"
    else 
        exresult := lcname "[" text "]"

    IniRead rang, Setting.ini, Setting, rang
    IniRead job, Setting.ini, Setting, job
    IniRead sjob, Setting.ini, Setting, sjob
    IniRead pref, Setting.ini, Setting, pref
    IniRead gov, Setting.ini, Setting, gov

    if(gov <= 1)
        gov := "Штат"
    else if(gov  >= 2)
        gov := "Республика"

    showDialog("2", "{FAFAFA}AHK CH", "{00FF00}1.{FFFFFF} Освобождение  [{F4FA58}Адвокат{ffffff}]`n{00FF00}2.{FFFFFF} Подтверждение освобождения  [{F4FA58}Прокурор{ffffff}]`n{00FF00}3.{FFFFFF} РП камера`n{00FF00}4.{ffffff} Предъявить свои документы игроку{FFFFFF}`n{00FF00}5.{FFFFFF} Доклады в рацию`n{00FF00}6.{FFFFFF} Продажа лицензии на рыболовство`n{00FF00}7.{FFFFFF} Опрос на собеседовании`n{00FF00}8.{FFFFFF} Выдать выговор`n{00FF00}9.{FFFFFF} Снять выговор`n{00FF00}10.{FFFFFF} Уволить`n{00FF00}11.{FFFFFF} Cменить скин сотруднику`n{00FF00}12.{FFFFFF} Сменить ранг сотруднику`n{00FF00}13.{FFFFFF} Пригласить во фракцию`n{00FF00}14.{FFFFFF} Настройки  [{58ACFA}" job "/" sjob "/" gov "/" pref "/" rang "{ffffff}]`n{00FF00}15.{FFFFFF} Информация`n{01DF3A}Взаимодействие с: {0080FF}" exresult, "Okey", "Сancel")
    NextStep := 1 
    Result := LineResult()
    if (!Result)
    return
    if(Result = 1){
        IniRead rang, Setting.ini, Setting, rang
        IniRead job, Setting.ini, Setting, job
        IniRead gov, Setting.ini, Setting, gov

        if(gov <= 1)
            gov := "штате"
        else if(gov >= 2)
            gov := "республике"

        showDialog("2", "{FAFAFA}AHK CH > [Aдвокат]", "{00FF00}1.{FFFFFF} Приветствие`n{00FF00}2.{FFFFFF} Предложение`n{00FF00}3.{FFFFFF} Опрос клиента`n{00FF00}4.{FFFFFF} Процесс взаимодействия с прокурором`n{00FF00}5.{FFFFFF} Передача дела прокурору `n{00FF00}6.{FFFFFF} Конечное освобождение" exresult, "Okey", "Сancel")
        NextStep := 1 
        kpz := LineResult()
        if (!kpz)
        return    
            if(kpz = 1){
                sendChat("Здравствуйте, я " rang ", " job ".")
                    sleep 2200
                sendChat("...нуждаетесь ли Вы в моей юридической помощи?")
                    sleep 2200
                sendChat("/do На груди висит бейджик сотрудника " job ", " usname ".")            
            }
            else if(kpz = 2){
                sendChat("Спешу Вас предупредить, мои услуги будут стоить 5000$, Вы согласны?")
            }
            else if(kpz = 3){
                sendChat("Хорошо, сколько лет проживаете в " gov " и номер Вашего дела.")
                    sleep 2200
                sendChat("/n LVL и Ваш ID")           
            }
            else if(kpz = 4){
                sendChat("/me достал из пиджака КПК, ручку и бланк, включил КПК нажатием на кнопку, затем зашел в «Базу Данных» и обновил данные..")
                    sleep 2200
                sendChat("/me ..о подсудимом, затем положил бланк на стол и открыв ручку, заполнил его..") 
                    sleep 2200 
                sendChat("/me ..затем передал бланк и ручку заключенному через решетку.")
                    sleep 2200
                sendChat("/todo Распишитесь вот здесь.*указывая на место для подписи.") 
            }
            else if(kpz = 5){
                sendChat("/todo Одобряете?*взяв бланк и ручку со стола и передав бланк прокурору.")
            }  
            else if(kpz = 6 && text != -1){
                sendChat("Поздравляю, Ваше дело выиграно.")
                    sleep 2200
                sendChat("/free " text "") 
            }         
    }
    else if(Result = 2){
        if(text != -1){
            sendChat("/me взял бланк из рук адвоката, после чего достал планшет из пиджака, зашел в «Базу Данных» и просмотрел дело..")
                Sleep 2200
            sendChat("/me ..заключенного, после чего достал печать и поставил ее на бланк, затем убрал печать и планшет в пиджак.")
                Sleep 2200
            sendChat("/do Дело №" text " - одобрено.")
                Sleep 2200
            sendChat("/todo Выпускайте!*передавая бланк обратно адвокату.")
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    }
    else if(Result = 3){
        showDialog("2", "{FAFAFA}AHK CH > РП камера", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить`n{00FF00}3.{FFFFFF} Настройки", "Okey", "Сancel")
        NextStep := 1 
        camera := LineResult()
        if (!camera)   
        return
        IniRead softname, Setting.ini, Setting, softname
        IniRead trig_cam, Setting.ini, Setting, trig_cam
        IniRead trig_softname, Setting.ini, Setting, trig_softname
        IniRead trig_time, Setting.ini, Setting, trig_time
        IniRead rec, Setting.ini, Hotkey, rec
        IniRead time_, Setting.ini, Hotkey, time_
            if(camera = 1){
                if(trig_softname <= 1 && softname != "" || softname != " " || softname != "  " || softname != "   ")
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Программа запипси экрана {0080FF}«" softname "»{ffffff}.")
                if(trig_cam <= 1)
                    Sendinput, {%rec%} 
                if(trig_time <= 1){
                    Random, hpuls, 123, 142
                    Random, mpuls, 72, 89
                    IniRead graf, Setting.ini, Setting, graf
                    s := 60
                    s -= %A_Sec%
                    m := 60
                    m -= %A_Min%     
                    sendChat("/me отодвинул рукав, посмотрел на часы с гравировкой «" graf "»")
                        sleep 2200
                    sendChat("/time")
                        sleep 50
                    Sendinput, {F8} 
                        sleep 1000 
                    IniRead style, Setting.ini, Setting, style
                    if(style = 1)
                        style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "]."
                    else if(style = 2)   
                        style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec "."
                    else if(style = 3) 
                        style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon "."
                    else if(style = 4) 
                        style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon "."
                    else if(style = 5)   
                        style := "/todo К зарплате ещё " m ":" s ".*cмотря на часы"
                    else if(style = 6) 
                        style := "/do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls "."
                    else if(style = 7)  
                        style := "/do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls "." 
                    SendChat(style)
                }
                sendChat("/do На груди, в пиджаке, установленна скрытая камера.")
                sleep 2200
                sendChat("/me включил скрытую камеру, переведя тумблер в положение «On»") 
                sleep 2200
                sendChat("/do Камера записует видео и звук.") 
            }  
            else if(camera = 2){
                if(trig_time <= 1){
                    Random, hpuls, 123, 142
                    Random, mpuls, 72, 89
                    IniRead graf, Setting.ini, Setting, graf
                    s := 60
                    s -= %A_Sec%
                    m := 60
                    m -= %A_Min%     
                    sendChat("/me отодвинул рукав, посмотрел на часы с гравировкой «" graf "»")
                        sleep 2200
                    sendChat("/time")
                        sleep 1000
                    Sendinput, {F8} 
                        sleep 1000 
                    IniRead style, Setting.ini, Setting, style
                    if(style = 1)
                        style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "]."
                    else if(style = 2)   
                        style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec "."
                    else if(style = 3) 
                        style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon "."
                    else if(style = 4) 
                        style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon "."
                    else if(style = 5)   
                        style := "/todo К зарплате ещё " m ":" s ".*cмотря на часы"
                    else if(style = 6) 
                        style := "/do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls "."
                    else if(style = 7)  
                        style := "/do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls "." 
                    SendChat(style)
                }
                sendChat("/do На груди, в пиджаке, установленна скрытая камера.")
                sleep 2200
                sendChat("/me выключил скрытую камеру, переведя тумблер в положение «Off»") 
                sleep 2200
                sendChat("/do Камера перестала записывать видео и звук.") 
                if(trig_softname <= 1 && softname != "" || softname != " " || softname != "  " || softname != "   ")
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Программа запипси экрана {0080FF}«" softname "»{ffffff}.")
                if(trig_cam <= 1)
                    Sendinput, {%rec%} 
            }   
            else if(camera = 3){
                if(trig_cam <= 1)
                    trig_cam := "{01DF01}Включен"
                else if(trig_cam  >= 2)
                    trig_cam := "{FF0000}Выключен"
                
                if(trig_softname <= 1)
                    trig_softname := "{01DF01}Включен"
                else if(trig_softname  >= 2)
                    trig_softname := "{FF0000}Выключен"
                
                if(trig_time <= 1)
                    trig_time := "{01DF01}Включен"
                else if(trig_time  >= 2)
                    trig_time := "{FF0000}Выключен"
                
                showDialog("2", "{FAFAFA}AHK CH > РП камера > Настройки", "{00FF00}1.{FFFFFF} Программа записиси экрана  [{0080FF}" softname "{ffffff}]`n{00FF00}2.{FFFFFF} Показывать в начале название прогррамы записи  [" trig_softname "{ffffff}]`n{00FF00}3.{FFFFFF} Авто включение/выключения записи  [" trig_cam "{ffffff}]`n{00FF00}4.{FFFFFF} Отыгровка часов в начале и конце записи  [" trig_time "{ffffff}]`n{01DF3A}Начало записи экрана на клавишу: {FF0040}" rec " ", "Okey", "Сancel")
                NextStep := 1 
                cam := LineResult()
                if (!cam)   
                return  
                if(cam = 1){
                    ShowDialog("1", "{FAFAFA}AHK CH > РП камера >> Прог..", "{FFFFFF}На данный момент программа записи экрана{0080FF}: " softname "{ffffff}.`nВ поле введите новое название (Fraps/Bandicam..):", "Enter")
                    Input, softname, V, {Enter}
                        sleep 100     
                    IniWrite %softname%, Setting.ini, Setting, softname
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили название программы записи экрана на: {088A29}" softname "{ffffff}.")
                }
                else if(cam = 2){
                    showDialog("2", "{FAFAFA}AHK CH > РП камера >> Пока..", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
                    NextStep := 1 
                    camtrs := LineResult()
                    if (!camtrs) 
                    return  
                    if(camtrs = 1){
                        trig_softname := "{01DF01}Включен" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«показывать в начале название прогррамы записи»{ffffff}.")
                    }
                    else if(camtrs = 3){
                        trig_softname := "{FF0000}Выключен"
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«показывать в начале название прогррамы записи»{ffffff}.")
                    }
                    IniWrite %camtrs%, Setting.ini, Setting, trig_softname
                }
                else if(cam = 3){
                    showDialog("2", "{FAFAFA}AHK CH > РП камера >> Авто..", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
                    NextStep := 1 
                    camtr := LineResult()
                    if (!camtr) 
                    return  
                    if(camtr = 1){
                        trig_cam := "{01DF01}Включен" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«aвто включение/выключения записи»{ffffff}.")
                    }
                    else if(camtr = 3){
                        trig_cam := "{FF0000}Выключен"
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«aвто включение/выключения записи»{ffffff}.")
                    }
                    IniWrite %camtr%, Setting.ini, Setting, trig_cam
                }
                else if(cam = 4){
                    showDialog("2", "{FAFAFA}AHK CH > РП камера >> Отыг..", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
                    NextStep := 1 
                    camtrt := LineResult()
                    if (!camtrt) 
                    return  
                    if(camtrt = 1){
                        trig_time := "{01DF01}Включен" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«отыгровка часов в начале и конце записи»{ffffff}.")
                    }
                    else if(camtrt = 3){
                        trig_time := "{FF0000}Выключен"
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«отыгровка часов в начале и конце записи»{ffffff}.")
                    }
                    IniWrite %camtrt%, Setting.ini, Setting, trig_time
                }
            } 		
    }
    else if (Result = 4){ 
        if(text != -1){
        showDialog("2", "{FAFAFA}AHK CH >> {81BEF7}" lcname "{2E9AFE}[" text "]{ffffff}", "{00FF00}1.{FFFFFF} Паспорт`n{00FF00}2.{FFFFFF} Лицензии`n{00FF00}3.{FFFFFF} Выписка из тира`n{00FF00}4.{FFFFFF} Удостоверение{FFFFFF}`n{00FF00}5.{FFFFFF} Взять документ обратно", "Okey", "Сancel")
        NextStep := 1 
        doc := LineResult()
        if (!doc)
        return   
        if(doc = 1){
            sendChat("/me из кармана брюк достал свой паспорт")
            sleep 2200
            sendChat("/me передал свой паспорт " lcusname "")  
            sleep 2200
            sendChat("/pass " text "")  
        }
        else if(doc = 2){
            sendChat("/me из кейса достал комплект лицензий")
            sleep 2200
            sendChat("/me передал комплект лицензий " lcusname "")  
            sleep 2200
            sendChat("/lic " text "")  
        }
        else if(doc = 3){
            sendChat("/me из кармана брюк достал выписку из тира")
            sleep 2200
            sendChat("/me передал выписку из тира " lcusname "")  
            sleep 2200
            sendChat("/skill " text "")  
        }	
        else if(doc = 4){
            sendChat("/me из внутреннеого кармана пиджака достал удостоверение")
            sleep 2200
            sendChat("/me передал свое удостоверение " lcusname "")  
            sleep 2200
            sendChat("/ud " text "")  
        }	
        else if(doc = 5){
            sendChat("/me взял свой документ у " lcusname "")  
            sleep 2200
            sendChat("/me положил документ обратно")  
        }	
        }
    }
    else if (Result = 5){ 
        if(post_name = "" || post_name = " " || post_name = "  " || post_name = "   "  || post_name = "{FE2E64}Не выбрано"){
            post_name := "{FE2E64}Не выбрано"
            post_trig := 0
        } else post_trig := 1
        if(status = "" || status = " " || status = "  " || status = "   "  || status = "{FE2E64}Не выбрано"){
            status := "{FE2E64}Не выбрано"
            status_trig := 0
        } else status_trig := 1
        showDialog("2", "{FAFAFA}AHK CH > Доклады в рацию", "{00FF00}1.{FFFFFF} Установить пост  [{0080FF}" post_name "{ffffff}]`n{00FF00}2.{FFFFFF} Установить состояние  [{0080FF}" status "{ffffff}]`n{00FF00}3.{FFFFFF} Сделать доклад ( за пунктами 1 и 2 )", "Okey", "Сancel")
        NextStep := 1 
        rg := LineResult()
        if (!rg)
        return
        if(rg = 1){
            FileRead, post_line, Elements\post.txt 
            showDialog("2", "{FAFAFA}AHK CH > Доклады в рацию > Пост{ffffff}", post_line, "Okey", "Сancel")
            NextStep := 1 
            post := LineResult()
            if(!post)
            return 	
            FileReadLine, post_fin, Elements\post.txt, post
            post_name := post_fin
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы выбрали пост: {0080FF}" post_name "{ffffff}.")
            return
        
        }
        else if(rg = 2){
            FileRead, post_line, Elements\post_status.txt 
            showDialog("2", "{FAFAFA}AHK CH > Доклады в рацию > Cостояние{ffffff}", post_line, "Okey", "Сancel")
            NextStep := 1 
            stat := LineResult()
            if(!stat)
            return 	
            FileReadLine, post_status, Elements\post_status.txt, stat
            status := post_status
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы выбрали cостояние: {0080FF}" status "{ffffff}.")
            return
        }
        if(rg = 3 && post_trig = 1 && status_trig = 1){
            IniRead rang, Setting.ini, Setting, rang
            sendChat("/r Докладывает " rang ": " usname ". Пост: " post_name ". Cостояние: " status ".")
        } else addChatMessage("{00FF40}[Info | CH] {FFFFFF}Выберите пост и его состояние.")
    }
    else if (Result = 6){ 
            if(text != -1){
                showDialog("2", "{FAFAFA}AHK CH > Продажа лицензии", "{00FF00}1.{FFFFFF} Приветствие`n{00FF00}2.{FFFFFF} Спросить: на сколько кг выдать лицензию`n{00FF00}3.{FFFFFF} Процесс выдачи лицензии `n{00FF00}4.{FFFFFF} Отказ выдачи лицензии (не пройден мед. осмотр)", "Okey", "Сancel")
                NextStep := 1 
                lic_ := LineResult()
                if (!lic_)
                return 
                if(lic_ = 1){
                    sendChat("Здравствуйте, меня зовут " usname ". Сейчас я продам Вам лицензию на ловлю рыбы.")
                        sleep 2200
                    sendChat("Но сперва, Вы должны показать мне свои документы, а именно ID-карту и мед.карту.")  
                        sleep 2200
                    sendChat("/n /pass " usid " `; /med " usid " ")  
                }
                else if(lic_ = 2){
                    sendChat("Хорошо, на сколько килограмм Вы хотите приобрести лицензию?")
                        sleep 2200
                    sendChat("Цена за 1-ин килограмм - 3$.")
                        sleep 2200
                    sendChat("/n Назовите любой вес от 1 до 3000 кг.")
                        sleep 2200
                    kg := 0       
                    ShowDialog("1", "{FAFAFA}AHK CH > Прод. лицензии > кг рыбы", "{FFFFFF}В поле введите необходимую масу рыбы (в кг)", "Enter")
                    Input, kg, V, {Enter}
                        sleep 100     
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы ввели: {088A29}" kg "кг.")					
                }
                else if(lic_ = 3){
                    sendChat("/do На столе лежит бланк для заполнения лицензий, ручка и печать мэрии.")
                        sleep 2200  
                    sendChat("/me потянулся руками к столу, правой рукой взяв ручку, а левой бланк и сделав некоторые движение правой рукой..")
                        sleep 2200   
                    sendChat("/do ..заполнил всю информацию в бланк, после чего положив ручку на место, взял в правую руку печать..")
                        sleep 2200  
                    sendChat("/do ..затем сильно нажав правой рукой, поставил печать, после чего положил печать обратно.")
                        sleep 2200  
                    sendChat("/todo Держите, Ваша новая лицензия.*передав заполненный бланк человеку напротив.")
                        sleep 2200  
                    sendChat("/selllic " text " " kg "")
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы выдали лицензию {0080FF}" lcusname "{ffffff}.")   
                        sleep 2200              
                }
                else if(lic_ = 4){
                    sendChat("/me внимательно рассмотрел мед. карту " lcname " ")
                        sleep 2200  
                    sendChat("/do Заметил, что в графе «мед. осмотр», написано: не пройдено.")
                        sleep 2200  
                    sendChat("/todo У Вас не пройден мед. осмотр*передавая мед. карту обратно " lcname " ")
                        sleep 2200 
                    sendChat("Получить мед. карту, Вы сможете в больнице городов Лос-Сантос, Сан-Фиерро или Лас-Вентурас.")
                        sleep 2200 
                    sendChat("/n /gps 4 8[Больн. ЛС]/9[Больн. CФ]/10[Больн. ЛВ].")
                        sleep 2200 
                    sendChat("Попросив её у мед. работников.")
                }
        }   
    }
    else if (Result = 7){
        IniRead trig_rang, Setting.ini, Setting, trig_rang
        IniRead rang_basic, Setting.ini, Setting, rang_basic
        IniRead job, Setting.ini, Setting, job
        showDialog("2", "{FAFAFA}AHK CH > Опрос на собеседовании", "{00FF00}1.{FFFFFF} Приветствие`n{00FF00}2.{FFFFFF} Вы на собеседование?`n{00FF00}3.{FFFFFF} Попросить документы`n{00FF00}4.{FFFFFF} Положительный ответ`n{00FF00}5.{FFFFFF} IC вопрос на знание устава (1/2)`n{00FF00}6.{FFFFFF} IC вопрос на знание устава (2/2)`n{00FF00}7.{FFFFFF} Сотрудник принят, с сообщением в чат под фракции ( /r )`n{00FF00}8.{FFFFFF} Сотрудник не принят`n{00FF00}9.{FFFFFF} Настройки`n{FA8258}Не забудьте начать взаимодействие! {FE9A2E}Нажмите: " inter_start "", "Okey", "Сancel")
        NextStep := 1 
        quest := LineResult()
        if (!quest)
        return 
        if(quest = 1){
            sendChat("Добрый день, Вас приветствует " rang ", " job " - " usname ". ")
                sleep 2200  
            sendChat("/do На груди висит бейджик: " job ", c фотографией «" usname "». ")
                sleep 2200  
            sendChat("/todo Как я могу к Вам обращаться? * повернув голову на гражданина.")
        }
        else if(quest = 2){
            sendChat("Вы на собеседование?")
        }
        else if(quest = 3){
            sendChat("Будьте добры, предъявите Ваш пакет документов: ID-карту, мед.карту и лицензии.")
                sleep 2200  
            sendChat("/n /pass " usid " `; /med " usid " `; /lic " usid "")
        }
        else if(quest = 4){
            sendChat("С документами у Вас всё в порядке, сейчас приступим к беседе. ")
                sleep 2200  
            sendChat("Знакомы ли Вы с Уставом правительства? ")
        }
        else if(quest = 5){
            sendChat("Чем занимается Правительство?")
                sleep 100
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Ответ: свободная форма.")       
        }
        else if(quest = 6){
            sendChat("Какой рабочий день в Мэрии в будний день?")
                sleep 100
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Ответ: с 10:00 до 20:00.")  
        }
        else if(quest = 7){
            if(text != -1){
                if(trig_rang <= 1){
                    sendChat("Всё отлично. На какую должность вы хотите?")
                        sleep 2200
                    sendChat("Вакантные должности: водитель, охранник, секретарь.")
                        sleep 2200
                    showDialog("2", "{FAFAFA}AHK CH > Опро.. >> Един..", "{00FF00}1.{FFFFFF} Водитель`n{00FF00}2.{FFFFFF} Охранник`n{00FF00}3.{FFFFFF} Секретарь", "Okey", "Сancel")
                    NextStep := 1 
                    rn_bs := LineResult()
                    if (!rn_bs) 
                    return  
                        if(rn_bs = 1)
                            sendChat("/r " lcusname " - был проверен и одобрен, на должность: водитель.")
                        else if(rn_bs = 2)
                            sendChat("/r " lcusname " - был проверен и одобрен, на должность: охранник.")
                        else if(rn_bs = 3)
                            sendChat("/r " lcusname " - был проверен и одобрен, на должность: секретарь.")
                    } else {
                        IniRead rang_basic, Setting.ini, Setting, rang_basic
                        if(rang_basic <= 1)
                            rang_basic := "водитель"
                        else if(rang_basic  = 2)
                            rang_basic := "охранник"
                        else if(rang_basic  >= 3)
                            rang_basic := "секретарь"
                        sendChat("На данный момент, вакантна только одна должность: " rang_basic ".")
                            sleep 2200
                        sendChat("/r " lcusname " - был проверен и одобрен, на должность: " rang_basic ".")
                    }
            } else {
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.")
            }
        }
        else if(quest = 8){
            sendChat("К сожалению, вы нам не подходите.")
        }
        else if(quest = 9){
            if(trig_rang <= 1)
                trig_rang := "{01DF01}Включен"
            else if(trig_rang  >= 2)
                trig_rang := "{FF0000}Выключен"
            
            if(rang_basic <= 1)
                rang_basic := "Водитель"
            else if(rang_basic  = 2)
                rang_basic := "Охранник"
            else if(rang_basic  >= 3)
                rang_basic := "Секретарь"
            
            showDialog("2", "{FAFAFA}AHK CH > Опро.. > Настройки", "{00FF00}1.{FFFFFF} Выбор должности для желающего  [" trig_rang "{ffffff}]`n{00FF00}2.{FFFFFF} Единственная, вакантанная должность  [{0080FF}" rang_basic "{ffffff}]", "Okey", "Сancel")
            NextStep := 1 
            quest_set := LineResult()
            if (!quest_set)
            return
                if(quest_set = 1){
                    showDialog("2", "{FAFAFA}AHK CH > Опро.. >> Выбо..", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
                    NextStep := 1 
                    tr := LineResult()
                    if (!tr) 
                    return  
                    if(tr = 1){
                        trig_rang := "{01DF01}Включен" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«выбор должности для желающего»{ffffff}.")
                    }
                    else if(tr = 2){
                        trig_rang := "{FF0000}Выключен"
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«выбор должности для желающего»{ffffff}.")
                    }
                    IniWrite %tr%, Setting.ini, Setting, trig_rang	
                }
                else if(quest_set = 2){
                    showDialog("2", "{FAFAFA}AHK CH > Опро.. >> Един..", "{00FF00}1.{FFFFFF} Водитель`n{00FF00}2.{FFFFFF} Охранник`n{00FF00}3.{FFFFFF} Секретарь", "Okey", "Сancel")
                    NextStep := 1 
                    rn_bs := LineResult()
                    if (!rn_bs) 
                    return  
                    if(rn_bs = 1){
                        rang_basic := "Водитель" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы установили единственную должность: {0080FF}" rang_basic "{ffffff}.")
                    }
                    else if(rn_bs = 2){
                        rang_basic := "Охранник" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы установили единственную должность: {0080FF}" rang_basic "{ffffff}.")
                    }
                    else if(rn_bs = 3){
                        rang_basic := "Секретарь" 
                            sleep 100
                        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы установили единственную должность: {0080FF}" rang_basic "{ffffff}.")
                    }
                    IniWrite %rn_bs%, Setting.ini, Setting, rang_basic	
                }
        }
    }
    else if (Result = 8){ 
        if(text != -1){
            IniRead sjob, Setting.ini, Setting, sjob
            FileRead, fwarn_line, Elements\fwarn_reason.txt
            showDialog("2", "{FAFAFA}AHK CH >> {81BEF7}" lcname "{2E9AFE}[" text "]{ffffff}", fwarn_line, "Okey", "Сancel")
            NextStep := 1 
            fwarn := LineResult()
            if(!fwarn)
            return 		        
            FileReadLine, fwarn_fin, Elements\fwarn_reason.txt, fwarn
            fwarn_name := fwarn_fin
            showDialog("0", "{FAFAFA}AHK CH | Конечный итог | {2E9AFE}Выговор{ffffff}","{FF0000}" lcname "{FFFFFF} | {2E64FE}" fwarn_name "{FFFFFF} | " sjob, "Okey" ) 
                if(Button1 = true)
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс выдачи выговора игроку{FF0000} " getPlayerNameById(text) "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")
                    sleep 2200
                sendChat("/me из кармана пиджака достал КПК")
                    sleep 2200
                sendChat("/me разблокировал КПК, нажал на кнопку «Warn employee»")
                    sleep 2200
                sendChat("/me ввёл: " lcusname) 
                    sleep 2200
                sendChat("/me ввёл причину: " fwarn_name)
                    sleep 2200
                sendChat("/me нажал на кнопку «Okey»")
                    sleep 2200 
                sendChat("/me заблокировал КПК, положил в карман пиджака")
                    sleep 2200
                sendChat("/fwarn " text " " fwarn_name " | " sjob)
                    sleep 500
                addChatMessage("{00FF40}[Info | MOD] {FFFFFF}Информация сохранена в папку {0080FF}«Log/Fwarn.txt»{ffffff}.")          
                FileAppend, %lcusname% | %fwarn_name% | %sjob% | %A_DD%.%A_Mon%.%A_Year%    [%A_Hour%:%A_Min%:%A_Sec%]`n, Log/Fwarn.txt	    
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }   
    }
    else if (Result = 9){
        if(text != -1){
            addChatMessage("{00FF40}[Info | MOD] {FFFFFF}Вы начали процесс снятия выговора игроку{FF0000} " lcname "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")
                sleep 2200
            sendChat("/me из кармана пиджака достал КПК")
                sleep 2200
            sendChat("/me разблокировал КПК, нажал на кнопку «Unwarn employee»")
                sleep 2200
            sendChat("/me ввёл: " lcusname) 
                sleep 2200
            sendChat("/me нажал на кнопку «Okey»")
                sleep 2200
            sendChat("/unfwarn " text " Cнятие выговора | " sjob)
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    }
    else if (Result = 10){
        if(text != -1){
            IniRead sjob, Setting.ini, Setting, sjob
            FileRead, uninv_line, Elements\uninvite_reason.txt
            showDialog("2", "{FAFAFA}AHK CH >> {81BEF7}" lcname "{2E9AFE}[" text "]{ffffff}", uninv_line, "Okey", "Сancel")
            NextStep := 1 
            uninv := LineResult()
            if(!uninv)
            return 		        
            FileReadLine, uninv_fin, Elements\uninvite_reason.txt, uninv
            uninv_name := uninv_fin
            
            FileRead, status_line, Elements\uninvite_status.txt
            showDialog("2", "{FAFAFA}AHK CH >> {81BEF7}" lcname "{2E9AFE}[" text "]{ffffff}", status_line, "Okey", "Сancel")
            NextStep := 1 
            stat := LineResult()
            if(!stat)
            return 	    
            FileReadLine, stat_fin, Elements\uninvite_status.txt, stat
            stat_name := stat_fin
            
            showDialog("0", "{FAFAFA}AHK CH | Конечный итог | {FE2E64}Увольнение{ffffff}","{FF0000}" lcname "{FFFFFF} | {2E64FE}" uninv_name "{FFFFFF} | {2EFE2E}" stat_name "{FFFFFF} | " sjob, "Okey" )
                if(Button1 = true)
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс увольнения игрока{FF0000} " lcname "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")
                    sleep 2200
                sendChat("/me из кармана пиджака достал КПК")
                    sleep 2200
                sendChat("/me разблокировал КПК, нажал на кнопку «Delete employee»")
                    sleep 2200
                sendChat("/me ввёл: " lcusname) 
                    sleep 2200
                sendChat("/me ввёл причину: " uninv_name)
                    sleep 2200
                sendChat("/me ввёл cтепень ЧС: " stat_name)
                    sleep 2200  		  
                sendChat("/me нажал на кнопку «Okey»")
                    sleep 2200 
                sendChat("/me заблокировал КПК, положил в карман пиджака")
                    sleep 2200
                sendChat("/uninvite " text " " uninv_name " | " stat_name " | " sjob)	
                    sleep 500
                addChatMessage("{00FF40}[Info | MOD] {FFFFFF}Информация сохранена в папку {0080FF}«Log/Uninvite.txt»{ffffff}.")          
                FileAppend, %lcusname% | %uninv_name% | %stat_name% | %sjob% | %A_DD%.%A_Mon%.%A_Year%    [%A_Hour%:%A_Min%:%A_Sec%]`n, Log/Uninvite.txt
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    }
    else if (Result = 11){ 
        if(text != -1){
            addChatMessage("{00FF40}[Info | СH] {FFFFFF}Вы начали процесс выдачи формы игроку{FF0000} " lcname "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")
                sleep 2200
            sendChat("/do В правой руке находиться кейс с необходимой формой.")
                sleep 2200
            sendChat("/me открыл кейс, из него достал новый комплект формы")
                sleep 2200
            sendChat("/me передал форму " lcusname)
                sleep 2200
            sendChat("/me закрыл кейс")
                sleep 2200
            sendChat("/setskin " text)
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    }
    else if(Result = 12){ 
        if(text != -1){
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс выдачи ранга игроку{FF0000} " lcname "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")
                sleep 2200
            sendChat("/todo Говорите Ваш отчёт одобрен?*открывая кейс")
                sleep 2200
            sendChat("/me из кейса достал новый бейджик")
                sleep 2200
            sendChat("/me передал бейджик " lcusname)
                sleep 2200
            sendChat("/n /me взял новый бейджик")
                sleep 2200 
            sendChat("/me закрыл кейс")
                sleep 2200  
            sendChat("/me из кармана пиджака достал КПК")
                sleep 2200
            sendChat("/me разблокировал КПК, нажал на кнопку «Rang»")
                sleep 2200
            sendChat("/me ввёл: " lcusname) 
                sleep 2200
            sendChat("/me нажал на кнопку «Okey»")
                sleep 2200 
            sendChat("/me заблокировал КПК, положил в карман пиджака")
                sleep 2200
            sendChat("/rang " text)
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    } 
    else if (Result = 13){
        if(text != -1){
            IniRead sjob, Setting.ini, Setting, sjob
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс приглашения игрока во фракцию{FF0000} " lcname "{FFFFFF}. {088A08}«/st»{ffffff} — стоп.")    
                sleep 2200
            sendChat("/me из кармана пиджака достал КПК")
                sleep 2200
            sendChat("/me разблокировал КПК, нажал на кнопку «Add new employee " sjob "»")
                sleep 2200
            sendChat("/me ввёл: " lcusname) 
                sleep 2200
            sendChat("/me нажал на кнопку «Okey»")
                sleep 2200  
            sendChat("/me заблокировал КПК, положил в карман пиджака")
                sleep 2200
            sendChat("/me из-под стола достал форму, рацию")
                sleep 2200
            sendChat("/me передал вещи " lcusname)
                sleep 2200
            sendChat("/invite " text)
        } else {
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.") 
        }
    }
    else if (Result = 14){
        IniRead rang, Setting.ini, Setting, rang
        IniRead job, Setting.ini, Setting, job
        IniRead sjob, Setting.ini, Setting, sjob
        IniRead pref, Setting.ini, Setting, pref
        IniRead trig_f, Setting.ini, Setting, trig_f
        IniRead trig_r, Setting.ini, Setting, trig_r
        IniRead gov, Setting.ini, Setting, gov

        Loop, read, Elements\post.txt
            last_line_post := A_Index        
        Loop, read, Elements\post_status.txt
            last_line_stpost := A_Index
        Loop, read, Elements\fwarn_reason.txt
            last_line_fw := A_Index
        Loop, read, Elements\uninvite_reason.txt
            last_line_un := A_Index
        Loop, read, Elements\uninvite_status.txt
            last_line_st := A_Index

        if(gov <= 1)
            gov := "Штат"
        else if(gov  >= 2)
            gov := "Республика"

        if(trig_f <= 1)
            trig_f := "{01DF01}Включен"
        else if(trig_f  >= 2)
            trig_f := "{FF0000}Выключен"
        
        if(trig_r <= 1)
            trig_r := "{01DF01}Включен"
        else if(trig_r  >= 2)
            trig_r := "{FF0000}Выключен"

        showDialog("2", "{FAFAFA}AHK CH > Настройки", "{00FF00}1.{FFFFFF} Cменить название работы  [{0080FF}" job "{ffffff}]`n{00FF00}2.{FFFFFF} Сменить сокращенное название работы  [{0080FF}" sjob "{ffffff}]`n{00FF00}3.{FFFFFF}Форма государства  [{9A2EFE}" gov "{ffffff}]`n{00FF00}4.{FFFFFF} Сменить префикс в рации  [{0080FF}" pref "{ffffff}]`n{00FF00}5.{FFFFFF} Писать префикс в чат фракции ( /f )  [" trig_f "{ffffff}]`n{00FF00}6.{FFFFFF} Писать префикс в чат под фракции ( /r )  [" trig_r "{ffffff}]`n{00FF00}7.{FFFFFF} Сменить название ранга  [{0080FF}" rang "{ffffff}]`n{00FF00}8.{FFFFFF} Добавить название поста  [{FF8000}Кол-во: " last_line_post "{ffffff}]`n{00FF00}9.{FFFFFF} Добавить cостояние на посте  [{FF8000}Кол-во: " last_line_stpost "{ffffff}]`n{00FF00}10.{FFFFFF} Добавить причину выдачи выговора  [{FF8000}Кол-во: " last_line_fw "{ffffff}]`n{00FF00}11.{FFFFFF} Добавить причину увольнения  [{FF8000}Кол-во: " last_line_un "{ffffff}]`n{00FF00}12.{FFFFFF} Добавить степень увольнения ( ЧС )  [{FF8000}Кол-во: " last_line_st "{ffffff}]", "Okey", "Сancel")
        NextStep := 1 
        sett := LineResult()
        if (!sett)
        return
        if(sett = 1){
            ShowDialog("1", "{FAFAFA}AHK CH >> Сменить название работы", "{FFFFFF}В поле введите полное название мэрии.`n{58D3F7}Пример{FFFFFF}: Мэрия Los-Santos", "Enter")
            Input, job, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили название работы на: {088A29}" job "{ffffff}.")
            IniWrite %job%, Setting.ini, Setting, job
        }
        else if(sett = 2){
            ShowDialog("1", "{FAFAFA}AHK CH >> Сменить сокращенное название работы", "{FFFFFF}В поле введите сокращенное название мэрии.`n{58D3F7}Пример{FFFFFF}: СHLS, CHSF, CHLV...", "Enter")
            Input, sjob, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили сокращенное название работы на: {088A29}" sjob "{ffffff}.")
            IniWrite %sjob%, Setting.ini, Setting, sjob
        }
        else if(sett = 3){
            showDialog("2", "{FAFAFA}AHK CH >> Форма государства", "{00FF00}1.{FFFFFF} Штат`n{00FF00}2.{FFFFFF} Республика", "Okey", "Сancel")
            NextStep := 1 
            gov_ := LineResult()
            if (!gov_) 
            return  
            if(gov_ = 1){
                gov := "Штат" 
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили форму государства на: {9A2EFE}" gov "{ffffff}.")
            }
            else if(gov_ = 2){
                gov := "Республика"
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили форму государства на: {9A2EFE}" gov "{ffffff}.")
            }
            IniWrite %gov_%, Setting.ini, Setting, gov	
        }
        else if(sett = 4){
            ShowDialog("1", "{FAFAFA}AHK CH >> Сменить префикс в рации", "{FFFFFF}В поле введите превикс.`n{58D3F7}Пример{FFFFFF}: LS, SF, LV...`n{2E9AFE}Использование{FFFFFF}: {01A9DB}/f {0174DF}*введенный Вами префикс* {01A9DB}| {2E64FE}*текст* ", "Enter")
            Input, pref, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили префикс на: {088A29}" pref "{ffffff}.")
            IniWrite %pref%, Setting.ini, Setting, pref
        }
        else if(sett = 5){
            showDialog("2", "{FAFAFA}AHK CH >> Писать префикс в чат фракции ( /f )", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
            NextStep := 1 
            tr_f := LineResult()
            if (!tr_f) 
            return  
            if(tr_f = 1){
                trig_f := "{01DF01}Включен" 
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«писать префикс в чат фракции ( /f )»{ffffff}.")
            }
            else if(tr_f = 2){
                trig_f := "{FF0000}Выключен"
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«писать префикс в чат фракции ( /f )»{ffffff}.")
            }
            IniWrite %tr_f%, Setting.ini, Setting, trig_f	
        }
        else if(sett = 6){
            showDialog("2", "{FAFAFA}AHK CH >> Писать префикс в чат под фракции ( /r )", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey", "Сancel")
            NextStep := 1 
            tr_r := LineResult()
            if (!tr_r) 
            return  
            if(tr_r = 1){
                trig_r := "{01DF01}Включен" 
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«писать префикс в чат под фракции ( /r )»{ffffff}.")
            }
            else if(tr_r = 2){
                trig_r := "{FF0000}Выключен"
                    sleep 100
                addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«писать префикс в чат под фракции ( /r )»{ffffff}.")
            }
            IniWrite %tr_r%, Setting.ini, Setting, trig_r	
        }
        else if(sett = 7){
            ShowDialog("1", "{FAFAFA}AHK CH >> Сменить название ранга", "{FFFFFF}В поле введите полное название ранга.`n{58D3F7}Пример{FFFFFF}: прокурор", "Enter")
            Input, rang, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили название ранга на: {088A29}" rang "{ffffff}.")
            IniWrite %rang%, Setting.ini, Setting, rang
        }
        else if(sett = 8){
            ShowDialog("1", "{FAFAFA}AHK CH >> Добавить название поста", "{FFFFFF}В поле введите название поста.`n{58D3F7}Пример{FFFFFF}: ГК", "Enter")
            Input, post, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы добавили новый пост, под названием: {088A29}" post "{ffffff}.")
            FileAppend, %post%`n, Elements\post.txt
        }
        else if(sett = 9){
            ShowDialog("1", "{FAFAFA}AHK CH >> Добавить состояние поста", "{FFFFFF}В поле введите состояние поста.`n{58D3F7}Пример{FFFFFF}: стабильное", "Enter")
            Input, post_st, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы добавили состояние поста: {088A29}" post_st "{ffffff}.")
            FileAppend, %post_st%`n, Elements\post_status.txt
        }
        else if(sett = 10){
            ShowDialog("1", "{FAFAFA}AHK CH >> Добавить причину выдачи выговора", "{FFFFFF}В поле введите причину выдачи выговора.`n{58D3F7}Пример{FFFFFF}: Нарушение устава", "Enter")
            Input, fw, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы добавили новую причину выговора: {088A29}" fw "{ffffff}.")
            FileAppend, %fw%`n, Elements\fwarn_reason.txt
        }
        else if(sett = 11){
            ShowDialog("1", "{FAFAFA}AHK CH >> Добавить причину увольнения", "{FFFFFF}В поле введите причину увольнения.`n{58D3F7}Пример{FFFFFF}: Грубое нарушение устава", "Enter")
            Input, un, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы добавили новую причину увольнения: {088A29}" un "{ffffff}.")
            FileAppend, %un%`n, Elements\uninvite_reason.txt
        }
        else if(sett = 12){
            ShowDialog("1", "{FAFAFA}AHK CH >> Добавить степень увольнения", "{FFFFFF}В поле введите степень увольнения.`n{58D3F7}Пример{FFFFFF}: ЧС 1-ой степени", "Enter")
            Input, st, V, {Enter}
                sleep 100     
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы добавили новую степень увольнения: {088A29}" st "{ffffff}.")
            FileAppend, %st%`n, Elements\uninvite_status.txt
        }
    }
    else if (Result = 15){ 
        showDialog("0", "{FAFAFA}Информация", "{088A08}«" find "»{ffffff} — список игроков во фракции онлайн.`n{088A08}«" f "»{ffffff} — чат фракции ( /f )`n{088A08}«" r "»{ffffff} — чат под фракции ( /r )`n{088A08}«" inter_start "»{ffffff} — диалог ввода ID игрока, для дальнейших взаимодействий.`n{088A08}«" inter_finish "»{ffffff} — завершение взаимодействий с игроком.`n{088A08}«" menu_ "»{ffffff} — карманный портативный коммуникатор.`n{088A08}«" time_ "»{ffffff} — часы.`n{088A08}«" time_scr "»{ffffff} — часы + {FA5882}[F8]{FFFFFF}.`n{088A08}«/st»{ffffff} — перезагрузить AHK ( взаимодействие прекращаеться ).`n`n{01A9DB}«/info»{ffffff} — информация о взаимодействующем игроке.`n{01A9DB}«/hp»{ffffff} — отыгровка аптечки.`n{01A9DB}«/timeset»{ffffff} — настройка часов для отыгровки.`n{01A9DB}«/rp»{ffffff} — РП отыгровки.`n{01A9DB}«/bind»{ffffff} — меню своих отыгровок.`n`n{40FF00}«" nickwo "»{ffffff} — скопировать в буфер обмена имя и фамилию игрока ( {FE2E64}без{ffffff} символа «_» ).`n{40FF00}«" nick "»{ffffff} — скопировать в буфер обмена имя и фамилию игрока ( {01DFD7}c{ffffff} символом «_» ).`n{40FF00}«" location "»{ffffff} - скопировать в буфер обмена свое местоположение.`n`nАвтор: {DF013A}Gennady_Scott [Karlenko]{ffffff}.`nВерсия: {FF0040}" version "{ffffff}.`n`n{01DF01}" A_Hour "{ffffff} : {01DF01}" A_Min "{ffffff} : {01DF01}" A_Sec "{ffffff}.`n{2E9AFE}" A_DD "{ffffff} / {2E9AFE}" A_Mon "{ffffff} / {2E9AFE}" A_Year  "{ffffff}.", "Okey") 
    } 
    else if (Result = 16){ 
        if(text != -1){	
            StringReplace, inter_start, inter_start, +, Shift-, All   
            StringReplace, inter_start, inter_start, !, Alt-, All  
            StringReplace, inter_start, inter_start, ^, Ctrl-, All          
            lcname := getPlayerNameById(text) 
            lcusname := RegExReplace(lcname, "_", " ")	
            showDialog("0", "{FAFAFA}AHK CH | Взаимодействующий игрок", "{ffffff}Имя, фамилия: {0080FF}" lcusname "{ffffff}.`n{ffffff}Уровень: {0080FF}" getPlayerScoreById(text) "{ffffff}.`nID: {0080FF}" text "{ffffff}.`nПинг: {0080FF}" getPlayerPingById(text) "{ffffff}.", "Okey") 
        } else { 
            addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для начала взаимодействия с игроком нажмите на {088A08}«" inter_start "»{ffffff}.") 
        }  
    }
}
return

:?:/rp::
{
    if(text != -1){
        AntiCrash()
        StringReplace, inter_start, inter_start, +, Shift-, All   
        StringReplace, inter_start, inter_start, !, Alt-, All  
        StringReplace, inter_start, inter_start, ^, Ctrl-, All

        IniRead trig_rp, Setting.ini, Setting, trig_rp
        IniRead trig_emo, Setting.ini, Setting, trig_emo
        IniRead emo, Setting.ini, Setting, emo
		IniRead job, Setting.ini, Setting, job
		IniRead sjob, Setting.ini, Setting, sjob
		IniRead hand, Setting.ini, Setting, hand

        global name := getUsername()     
        usid := getID()
        usname := RegExReplace(name, "_", " ") 
        lcname := getPlayerNameById(text) 
        lcusname := RegExReplace(lcname, "_", " ")
        
        if(hand <= 1)
            hand := "Левая рука"
        else if(hand >= 2)
            hand := "Правая рука"

        if(trig_emo <= 1){
            if(emo <= 1)
                emo := "{0040FF}Статическое"
            else if(emo  = 2)
                emo := "{FE2E64}Агресивное"
            else if(emo = 3)
                emo := "{0174DF}Грустное"
            else if(emo = 4)
                emo := "{31B404}Спокойное"
            else if(emo >= 5)
                emo := "{FF8000}Веселое"
        } else {
            if(emo <= 1)
                emo := "{6E6E6E}Отключено (Статическое)"
            else if(emo  = 2)
                emo := "{6E6E6E}Отключено (Агресивное)"
            else if(emo = 3)
                emo := "{6E6E6E}Отключено (Грустное)"
            else if(emo = 4)
                emo := "{6E6E6E}Отключено (Спокойное)"
            else if(emo >= 5)
                emo := "{6E6E6E}Отключено (Веселое)"            
        }
    
        showDialog("2", "{FAFAFA}AHK CH | РП отыгровки", "{00FF00}1.{FFFFFF} Указать на игрока`n{00FF00}2.{FFFFFF} Перевести взгляд на игрока`n{00FF00}3.{FFFFFF} Представиться, как сотрудник «" job " [" sjob "]»`n{00FF00}4.{FFFFFF} Предложить помощь`n{00FF00}5.{FFFFFF} Настройки  [" emo "{ffffff}/{0174DF}" hand "{ffffff}]`n{01DF3A}Взаимодействие с: {0080FF}" lcname "[" text "]", "Okey")
        NextStep := 1 
        rp := LineResult()
        if (!rp)	
        return  
        if(rp = 1){
            IniRead emo, Setting.ini, Setting, emo
		    IniRead hand, Setting.ini, Setting, hand
            IniRead trig_emo, Setting.ini, Setting, trig_emo

            if(hand <= 1){
                hand := "левой"
                hand1 := "левую"
            }
            else if(hand >= 2){
                hand := "правой"
                hand1 := "правую"
            }

            if(trig_emo <= 1){
                if(emo <= 1)
                    sendChat("/me медленно указал " hand " рукой на " lcusname " ")
                else if(emo = 2)
                    sendChat("/me быстро поднял " hand1 " руку, указуя на " lcusname " ")
                else if(emo = 3)
                    sendChat("/me трусливо поднял " hand1 " руку, указуя правой рукой на " lcusname " ")
                else if(emo = 4)
                    sendChat("/me указал " hand " рукой на " lcusname " ")
                else if(emo >= 5)
                    sendChat("/me искренне улыбаясь, указал " hand " рукой на " lcusname " ")
                sleep 500
                if(trig_rp <= 1)
                    sendChat("/anim 2 6")
            } else {
                sendChat("/me указал " hand " рукой на " lcusname " ")
                    sleep 500
                if(trig_rp <= 1)
                    sendChat("/anim 2 6")              
            }
        }
        else if(rp = 2){
            IniRead emo, Setting.ini, Setting, emo
            IniRead trig_emo, Setting.ini, Setting, trig_emo

            if(trig_emo <= 1){
                if(emo <= 1)
                    sendChat("/me медленно перевёл свой взгляд на " lcusname " ")
                else if(emo = 2)
                    sendChat("/me агресивно перевёл свой взгляд на " lcusname " ")
                else if(emo = 3)
                    sendChat("/me трусливо перевёл свой взгляд на " lcusname " ")
                else if(emo = 4)
                    sendChat("/me спокойно перевёл свой взгляд на " lcusname " ")
                else if(emo >= 5)
                    sendChat("/me задорно перевёл свой взгляд на " lcusname " ")
            } else 
              sendChat("/me перевёл свой взгляд на " lcusname " ")
        }
        else if(rp = 3){
            IniRead emo, Setting.ini, Setting, emo
            IniRead trig_emo, Setting.ini, Setting, trig_emo

            if(trig_emo <= 1){
                if(emo <= 1){
                    sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                        sleep 2200
                    sendChat("Я - " usname ", cотрудник " sjob ", " rang ".")
                }
                else if(emo = 2){
                    sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                        sleep 2200
                    sendChat("Зовут меня - " usname ". Работаю в " sjob " " rang "(ом).")
                }
                else if(emo = 3){
                    sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                        sleep 2200
                    sendChat("Меня зовут - " usname ". Работаю в " sjob " " rang "(ом).")
                }
                else if(emo = 4){
                    sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                        sleep 2200
                    sendChat("Здравствуйте, я cотрудник " sjob " - " usname ", " rang ".")
                }
                else if(emo >= 5){
                    sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                        sleep 2200
                    sendChat("Приветствую, я - " usname ". Работник " sjob ", " rang ".")
                }
            } else {
                sendChat("/do На пиджаке висит бейджик: " usname ", " job ", " rang ".")
                    sleep 2200
                sendChat("Здравствуйте, я - " usname ". Работник " sjob ", " rang ".")
            }
        }
        else if(rp = 4){
            IniRead emo, Setting.ini, Setting, emo
            IniRead trig_emo, Setting.ini, Setting, trig_emo

            if(trig_emo <= 1){
                if(emo <= 1){
                    sendChat("/me без искрености и чётко промолвил:")
                        sleep 2200
                    sendChat("Чем-то помочь?")
                }
                else if(emo = 2){
                    sendChat("/me агресивно и не чётко промолвил:")
                        sleep 2200
                    sendChat("Помочь, чем-то?")
                }
                else if(emo = 3){
                    sendChat("/me трусливо и не чётко промолвил:")
                        sleep 2200
                    sendChat("Чем могу быть любезен, cэр?")
                }
                else if(emo = 4){
                    sendChat("/me спокойно и чётко промолвил:")
                        sleep 2200
                    sendChat("Вам чем-то помочь, сэр?")
                }
                else if(emo >= 5){
                    sendChat("/me искренно и радосно промолвил:")
                        sleep 2200
                    sendChat("Вам чем-то помочь?")
                }
            } else 
                sendChat("Вам чем-то помочь?")
        }
        else if(rp = 5){
            IniRead emo, Setting.ini, Setting, emo
            IniRead hand, Setting.ini, Setting, hand
            if(trig_rp <= 1)
                trig_rp := "{01DF01}Включен"
            else if(trig_rp  >= 2)
                trig_rp := "{FF0000}Выключен"

            if(trig_emo <= 1)
                trig_emo := "{01DF01}Включен"
            else if(trig_emo  >= 2)
                trig_emo := "{FF0000}Выключен"
            
            if(hand <= 1)
                hand := "Левая"
            else if(hand >= 2)
                hand := "Правая"
			
            if(emo <= 1)
                emo := "{0040FF}Статическое"
            else if(emo  = 2)
                emo := "{FE2E64}Агресивное"
            else if(emo = 3)
                emo := "{0174DF}Грустное"
            else if(emo = 4)
                emo := "{31B404}Спокойное"
            else if(emo >= 5)
                emo := "{FF8000}Веселое"
            
            showDialog("2", "{FAFAFA}AHK CH | РП отыгровки > Настройки", "{00FF00}1.{FFFFFF} Использовать анимации  [" trig_rp "{ffffff}]`n{00FF00}2.{FFFFFF} Настроение/эмоции  [" emo "{ffffff}]`n{00FF00}3.{FFFFFF} Использовать настроение/эмоции [" trig_emo "{ffffff}]{FFFFFF}`n{00FF00}4.{FFFFFF} Выбор активной руки [{0174DF}" hand "{ffffff}]", "Okey")
            NextStep := 1 
            rp_ := LineResult()
            if (!rp_)	
            return 
            if(rp_ = 1){
                showDialog("2", "{FAFAFA}AHK CH | РП отыгровки >> Использовать анимации", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey")
                NextStep := 1 
                rp__ := LineResult()
                if (!rp__)	
                return
                if(rp__ = 1){
                    trig_rp := "{01DF01}Включен" 
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«использовать анимации»{ffffff}.")
                }
                else if(rp__ = 2){
                    trig_rp := "{FF0000}Выключен"
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«использовать анимации»{ffffff}.")
                }
                IniWrite %rp__%, Setting.ini, Setting, trig_rp
            }
            else if(rp_ = 2){
                showDialog("2", "{FAFAFA}AHK CH | РП отыгровки >> Эмоция", "{00FF00}1.{FFFFFF} Хлоднокровное`n{00FF00}2.{FFFFFF} Агресивное`n{00FF00}3.{FFFFFF} Грустное`n{00FF00}4.{FFFFFF} Cпокойное`n{00FF00}5.{FFFFFF} Веселое", "Okey")
                NextStep := 1 
                em := LineResult()
                if (!em)	
                return   
                if(em = 1){
                    emo := "{0040FF}Статическое"
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы cменили эмоцию на {0040FF}статическое{ffffff}.")
                }
                else if(em = 2){
                    emo := "{FE2E64}Агресивное"
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы cменили эмоцию на {FE2E64}агресивное{ffffff}.")
                }
                else if(em = 3){
                    emo := "{0174DF}Печальное"
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы cменили эмоцию на {0174DF}грустное{ffffff}.")
                }
                else if(em = 4){
                    emo := "{31B404}Спокойное"
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы cменили эмоцию на {31B404}спокойное{ffffff}.")
                }
                else if(em = 5){
                    emo := "{FF8000}Веселое"
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы cменили эмоцию на {FF8000}веселое{ffffff}.")
                }
                IniWrite %em%, Setting.ini, Setting, emo
            }
            else if(rp_ = 3){
                showDialog("2", "{FAFAFA}AHK CH | РП отыгровки >> Испол. наст./эмо.", "{00FF00}1.{FFFFFF} Включить`n{00FF00}2.{FFFFFF} Выключить", "Okey")
                NextStep := 1 
                rp_em := LineResult()
                if (!rp_em)	
                return 
                if(rp_em = 1){
                    trig_emo := "{01DF01}Включен" 
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {01DF01}включили{ffffff} функцию {0080FF}«использовать настроение/эмоции»{ffffff}.")
                }
                else if(rp_em = 2){
                    trig_emo := "{FF0000}Выключен"
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы {FF0000}выключили{ffffff} функцию {0080FF}«использовать настроение/эмоции»{ffffff}.")
                }
                IniWrite %rp_em%, Setting.ini, Setting, trig_emo
            }
            else if(rp_ = 4){
                showDialog("2", "{FAFAFA}AHK CH | РП отыгровки >> Выбор активной руки", "{00FF00}1.{FFFFFF} Левая`n{00FF00}2.{FFFFFF} Правая", "Okey")
                NextStep := 1 
                rp___ := LineResult()
                if (!rp___)	
                return
                if(rp___ = 1){
                    hn := "Левая" 
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы переключились, на активную {0080FF}левую{ffffff} руку.")
                }
                else if(rp___ = 2){
                    hn := "Правая"
                        sleep 100
                    addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы переключились, на активную {0080FF}правую{ffffff} руку.")
                }
                IniWrite %rp___%, Setting.ini, Setting, hand
            }
        }
	else if (rp = 6){           
		lcname := getPlayerNameById(text) 
        lcusname := RegExReplace(lcname, "_", " ")	
        showDialog("0", "{FAFAFA}AHK CH | Взаимодействующий игрок", "{ffffff}Имя, фамилия: {0080FF}" lcusname "{ffffff}.`n{ffffff}Уровень: {0080FF}" getPlayerScoreById(text) "{ffffff}.`nID: {0080FF}" text "{ffffff}.`nПинг: {0080FF}" getPlayerPingById(text) "{ffffff}.", "Okey") 
    }
    } else {
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Начните взаимодействие с игроком, {088A08}«" inter_start "»{ffffff}.")
    }
}
return

:?:/bind::
{    
    AntiCrash()
    showDialog("2", "{FAFAFA}AHK CH | Биндер", "{00FF00}1.{FFFFFF} " bind_name1 "`n{00FF00}2.{FFFFFF} " bind_name2 "`n{00FF00}3.{FFFFFF} " bind_name3 "`n{00FF00}4.{FFFFFF} Информация", "Okey")
    NextStep := 1 
    bind := LineResult()
    if (!bind)	
    return      
    if( bind = 1 ){
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс отыгровки {00FF00}«" bind_name1 "»{ffffff}. {088A08}«/st»{ffffff} — стоп.") 
        sleep 500   
        Loop, read, Binder\Отыгровка №1.txt
        {
          Loop, parse, A_LoopReadLine, `n
          {
			StringReplace, bind_adres1, bind_adres1, {pref}, %pref%, All         
			StringReplace, bind_adres1, bind_adres1, {sjob}, %sjob%, All 
			StringReplace, bind_adres1, bind_adres1, {job}, %job%, All
			StringReplace, bind_adres1, bind_adres1, {space}, %A_Space%, All
            sendChat( bind_adres1 "" A_LoopField )
            sleep bind_del1 
          }         
        }   
        sleep 500        
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы закончили процесс отыгровки {00FF00}«" bind_name1 "»{ffffff}. {088A08}«/st»{ffffff} — стоп.")        
    }
    else if( bind = 2 ){
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс отыгровки {00FF00}«" bind_name2 "»{ffffff}. {088A08}«/st»{ffffff} — стоп.") 
        sleep 500   
        Loop, read, Binder\Отыгровка №2.txt
        {
          Loop, parse, A_LoopReadLine, `n
          {    
			StringReplace, bind_adres2, bind_adres2, {pref}, %pref%, All         
			StringReplace, bind_adres2, bind_adres2, {sjob}, %sjob%, All  
			StringReplace, bind_adres2, bind_adres2, {job}, %job%, All
			StringReplace, bind_adres2, bind_adres2, {space}, %A_Space%, All
            sendChat( bind_adres2 "" A_LoopField )
            sleep bind_del2 
          }         
        }   
        sleep 500        
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы закончили процесс отыгровки {00FF00}«" bind_name2 "»{ffffff}.")        
    }   
    else if( bind = 3 ){
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы начали процесс отыгровки {00FF00}«" bind_name3 "»{ffffff}.") 
        sleep 500   
        Loop, read, Binder\Отыгровка №3.txt
        {
          Loop, parse, A_LoopReadLine, `n
          {
			StringReplace, bind_adres3, bind_adres3, {pref}, %pref%, All         
			StringReplace, bind_adres3, bind_adres3, {sjob}, %sjob%, All     
			StringReplace, bind_adres3, bind_adres3, {job}, %job%, All	
			StringReplace, bind_adres3, bind_adres3, {space}, %A_Space%, All
            sendChat( bind_adres3 "" A_LoopField )
            sleep bind_del3 
          }         
        }   
        sleep 500        
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы закончили процесс отыгровки {00FF00}«" bind_name3 "»{ffffff}.")        
    }     
    else if( bind = 4 ){
        if( bind_adres1 = "" )
            bind_adres1 = в обычный чат
        if( bind_adres2 = "" )
            bind_adres2 = в обычный чат      
        if( bind_adres3 = "" )
            bind_adres3 = в обычный чат
              StringReplace, bind_adres1, bind_adres1, {pref}, %pref%, All         
              StringReplace, bind_adres1, bind_adres1, {sjob}, %sjob%, All 
              StringReplace, bind_adres1, bind_adres1, {job}, %job%, All
              StringReplace, bind_adres1, bind_adres1, {space}, %A_Space%, All
			  
              StringReplace, bind_adres2, bind_adres2, {pref}, %pref%, All         
              StringReplace, bind_adres2, bind_adres2, {sjob}, %sjob%, All  
              StringReplace, bind_adres2, bind_adres2, {job}, %job%, All
              StringReplace, bind_adres2, bind_adres2, {space}, %A_Space%, All
			  
              StringReplace, bind_adres3, bind_adres3, {pref}, %pref%, All         
              StringReplace, bind_adres3, bind_adres3, {sjob}, %sjob%, All     
              StringReplace, bind_adres3, bind_adres3, {job}, %job%, All	
              StringReplace, bind_adres3, bind_adres3, {space}, %A_Space%, All			  
        showDialog("0", "{FAFAFA}AHK CH | Биндер > Информация", "{FA5858}  Отыгровка №1:{ffffff}`nНазвание:{0080FF} " bind_name1 "{ffffff}.`nЗадержка:{82FA58} " bind_del1 "{ffffff}.`nАдресовка: {82FA58}" bind_adres1 "{ffffff}.`n  {FA5858}  Отыгровка №2:{ffffff}`nНазвание:{0080FF} " bind_name2 "{ffffff}.`nЗадержка:{82FA58} " bind_del2 "{ffffff}.`nАдресовка: {82FA58}" bind_adres2 "{ffffff}.`n{FA5858}  Отыгровка №3:{ffffff}`nНазвание:{0080FF} " bind_name3 "{ffffff}.`nЗадержка:{83FA58} " bind_del3 "{ffffff}.`nАдресовка: {83FA58}" bind_adres3 "{ffffff}.", "Okey")         
    }
}
return

:?:/timeset::
{ 
    AntiCrash()
    Random, hpuls, 123, 142
    Random, mpuls, 72, 89
    s := 60
    s -= %A_Sec%
    m := 60
    m -= %A_Min%      
    if(graf = "" || graf = " " || graf = "  " || graf = "   " ){
        graf := "серия №6754"
    }
    showDialog("2", "{FAFAFA}AHK CH | Настройка часов", "{00FF00}1.{FFFFFF} Отыгровка экрана`n{00FF00}2.{FFFFFF} Гравировка на часах`n{00FF00}3.{FFFFFF} Информация", "Okey")
    NextStep := 1 
    ts := LineResult()
    if (!ts)	
    return     
    if( ts = 1 ){
        showDialog("2", "{FAFAFA}AHK CH | Наст.. > Отыгровка экрана", "{00FF00}1.{FFFFFF} /do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "].`n{00FF00}2.{FFFFFF} /do Экран часов: " A_Hour ":" A_Min ":" A_Sec ".`n{00FF00}3.{FFFFFF} /do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon ".`n{00FF00}4.{FFFFFF} /do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon ". `n{00FF00}5.{ffffff} /todo К зарплате ещё " m ":" s ".*cмотря на часы{FFFFFF}`n{00FF00}6.{FFFFFF} /do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls ".`n{00FF00}7.{FFFFFF} /do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls ".", "Okey")
        NextStep := 1 
        style := LineResult()
        if (!style)	
        return 
        if(style = 1) 
          style := 1
        else if(style = 2) 
          style := 2    
        else if(style = 3) 
          style := 3  
        else if(style = 4) 
          style := 4  
        else if(style = 5) 
          style := 5    
        else if(style = 6) 
          style := 6  
        else if(style = 7) 
          style := 7
        IniWrite %style%, Setting.ini, Setting, style
    }
    else if( ts = 2 ){
        ShowDialog("1", "{FAFAFA}AHK CH | >> Настройка гравировки..", "{FFFFFF}В поле введите текст гравировки:", "Enter")
        Input, graf, V, {Enter}
        Sleep, 100 
        if(graf = "" || graf = " " || graf = "  " || graf = "   " ){
            graf := "серия №6754"
        }
        IniWrite %graf%, Setting.ini, Setting, graf
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы сменили гравировку на часах:{0174DF} " graf "{ffffff}.") 
    }
    else if( ts = 3 ){
        IniRead style, Setting.ini, Setting, style
        IniRead graf, Setting.ini, Setting, graf
        if(style = 1)
            style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "]."
        else if(style = 2)   
            style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec "."
        else if(style = 3) 
            style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon "."
        else if(style = 4) 
            style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon "."
        else if(style = 5)   
            style := "/todo К зарплате ещё " m ":" s ".*cмотря на часы"
        else if(style = 6) 
            style := "/do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls "."
        else if(style = 7)  
            style := "/do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls "."
        StringReplace, time_, time_, +, Shift-, All   
        StringReplace, time_, time_, !, Alt-, All  
        StringReplace, time_, time_, ^, Ctrl-, All 
        StringReplace, time_scr, time_scr, +, Shift-, All   
        StringReplace, time_scr, time_scr, !, Alt-, All  
        StringReplace, time_scr, time_scr, ^, Ctrl-, All        
        showDialog("0", "{FAFAFA}AHK CH | Наст.. > Информация", "{ffffff}Тип часов: {2E9AFE}" style "`n{ffffff}Гравировка на часах:{0174DF} " graf "{ffffff}.`n`n{088A08}«" time_ "»{ffffff} — часы.`n{088A08}«" time_scr "»{ffffff} — часы + {FA5882}[F8]{FFFFFF}.", "Okey")
    }   
 }
return 

inter_start: 
{
    AntiCrash()
    StringReplace, inter_finish, inter_finish, +, Shift-, All   
    StringReplace, inter_finish, inter_finish, !, Alt-, All  
    StringReplace, inter_finish, inter_finish, ^, Ctrl-, All 
	lcname := getPlayerNameById(text)
    if(text = -1 ){	
		ShowDialog("1", "{FAFAFA}AHK CH | Взаимодействие с игроком", "{FFFFFF}В поле введите ID игрока, для взаимодействий с ним. Для завершения взаимодействия с игроком нажмите на {088A08}«" inter_finish "»{ffffff}", "Enter")
        Input, text, V, {Enter}
    if(text >= 0 && text <= 1000){
            Sleep, 100  
		lcname := getPlayerNameById(text)
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Процесс взаимодействия с {FF0000}" lcname "{FFFFFF} — {58FAF4}начался{FFFFFF}.") 
    } else {
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Нельзя вводить ID меньше {58ACFA}0{ffffff} и больше {FE2E64}1000{ffffff}.")  
            sleep 100
        text := -1 
    }
    } else {
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Процесс взаимодействия с {FF0000}" lcname "{FFFFFF} — {F7819F}не завершилось{FFFFFF}.")
			sleep, 200
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для завершения взаимодействия с игроком нажмите на {088A08}«" inter_finish "»{ffffff}.")    
    }
}
return

inter_finish: 
{	
    AntiCrash()
    StringReplace, inter_start, inter_start, +, Shift-, All   
    StringReplace, inter_start, inter_start, !, Alt-, All  
    StringReplace, inter_start, inter_start, ^, Ctrl-, All
	lcname := getPlayerNameById(text) 
    if(text != -1){	
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Процесс взаимодействия с {FF0000}" lcname "{FFFFFF} — {FFBF00}завершен{FFFFFF}.")
			Sleep, 100
        text := -1
    } else { 
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для начала взаимодействия с игроком нажмите на {088A08}«" inter_start "»{ffffff}.")   
    }	
}
return 

find: 
{
  sendChat("/find") 
}
return

time_:
{ 
    AntiCrash()
    Random, hpuls, 123, 142
    Random, mpuls, 72, 89
    IniRead graf, Setting.ini, Setting, graf
    s := 60
    s -= %A_Sec%
    m := 60
    m -= %A_Min%     
    sendChat("/me отодвинул рукав, посмотрел на часы с гравировкой «" graf "»")
        sleep 2200
    sendChat("/time")
        sleep 1000 
	IniRead style, Setting.ini, Setting, style
	if(style = 1)
		style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "]."
	else if(style = 2)   
		style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec "."
	else if(style = 3) 
		style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon "."
	else if(style = 4) 
		style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon "."
	else if(style = 5)   
		style := "/todo К зарплате ещё " m ":" s ".*cмотря на часы"
	else if(style = 6) 
		style := "/do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls "."
	else if(style = 7)  
		style := "/do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls "." 
    SendChat(style)
}
return

time_scr:
{
    AntiCrash()
    Random, hpuls, 123, 142
    Random, mpuls, 72, 89
    IniRead graf, Setting.ini, Setting, graf
    s := 60
    s -= %A_Sec%
    m := 60
    m -= %A_Min%     
    sendChat("/me отодвинул рукав, посмотрел на часы с гравировкой «" graf "»")
        sleep 2200
    sendChat("/time")
        sleep 1000
    Sendinput, {F8} 
        sleep 1000 
	IniRead style, Setting.ini, Setting, style
	if(style = 1)
		style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "]."
	else if(style = 2)   
		style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec "."
	else if(style = 3) 
		style := "/do Экран часов: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | " A_DD "/" A_Mon "."
	else if(style = 4) 
		style := "/do Экран часов: " A_Hour ":" A_Min ":" A_Sec " / " A_DD "." A_Mon "."
	else if(style = 5)   
		style := "/todo К зарплате ещё " m ":" s ".*cмотря на часы"
	else if(style = 6) 
		style := "/do Время: [" A_Hour "]-[" A_Min "]-[" A_Sec "] | Пульс: " hpuls "/" mpuls "."
	else if(style = 7)  
		style := "/do Время: " A_Hour ":" A_Min ":" A_Sec " / Пульс: " hpuls " | " mpuls "." 
    SendChat(style)
}
return

:?:/st::
{
    if(text != -1){	
        AntiCrash()
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Процесс взаимодействия с {FF0000}" getPlayerNameById(text) "{FFFFFF} — {FFBF00}завершен{FFFFFF}.")
			sleep 100
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы перезагрузили скрипт.")
			sleep 100
        Reload
    } else {
        AntiCrash()
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы перезагрузили скрипт.")
			sleep 200
        Reload
    }
}
return

nickwo:
{
    AntiCrash()
    global name := getUsername()     
    usname := RegExReplace(name, "_", " ")    
    lcname := getPlayerNameById(text) 
    lcusname := RegExReplace(lcname, "_", " ")
        if(text != -1){
           Clipboard := lcusname
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы скопировали ник {04B431}" lcusname "{FFFFFF}. Вставить - {088A08}«Ctrl+V»{ffffff}.") 
        } else { 
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для начала взаимодействия с игроком нажмите на {088A08}«" inter_start "»{ffffff}.") 
        }  
}
return

f:
{
    AntiCrash()
    IniRead pref, Setting.ini, Setting, pref
    IniRead trig_f, Setting.ini, Setting, trig_f 
    if(trig_f <= 1)
        SendInput {F6}/f %pref% |%A_Space%  
    else
	    SendInput {F6}/f%A_Space%   
}
return

r:
{
    AntiCrash()
    IniRead pref, Setting.ini, Setting, pref
    IniRead trig_r, Setting.ini, Setting, trig_r 
    if(trig_r <= 1)
        SendInput {F6}/r %pref% |%A_Space%  
    else
	    SendInput {F6}/r%A_Space%   
}
return

nick:
{
    AntiCrash()
    lcname := getPlayerNameById(text) 
        if(text != -1){
           Clipboard := lcname
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы скопировали ник {04B431}" lcname "{FFFFFF}. Вставить - {088A08}«Ctrl+V»{ffffff}.") 
        } else { 
           addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для начала взаимодействия с игроком нажмите на {088A08}«" inter_start "»{ffffff}.") 
        }  
}
return

:?:/hp::
{
    AntiCrash()
    sendChat("/me из кармана брюк достал аптечку")
        sleep 2200
    sendChat("/me из аптечки достал медикаменты, принял их")
        sleep 2200
    sendChat("/healme")        
}
return

location:
{
    AntiCrash()
    if( cz != "Unknown - Unknown"){
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Вы скопировали cвое местоположение {04B431}" cz "{FFFFFF}. Вставить - {088A08}«Ctrl+V»{ffffff}.") 
        getPlayerPos(X,Y,Z) 
        city := calculateCity(X,Y,Z)
        zone := calculateZone(X,Y,Z)
        cz := city " - " zone
        Clipboard := cz 
    } else {
        addChatMessage("{00FF40}[Info | CH] {FFFFFF}Местоположение неопределено (интерьер, далеко за картой).") 
    }
}
return

:?:/info::
{
    AntiCrash()
	StringReplace, inter_start, inter_start, +, Shift-, All   
    StringReplace, inter_start, inter_start, !, Alt-, All  
    StringReplace, inter_start, inter_start, ^, Ctrl-, All          
    if(text != -1){	
		lcname := getPlayerNameById(text) 
        lcusname := RegExReplace(lcname, "_", " ")	
        showDialog("0", "{FAFAFA}AHK CH | Взаимодействующий игрок", "{ffffff}Имя, фамилия: {0080FF}" lcusname  "{ffffff}.`n{ffffff}Уровень: {0080FF}" getPlayerScoreById(text) "{ffffff}.`nID: {0080FF}" text "{ffffff}.`nПинг: {0080FF}" getPlayerPingById(text) "{ffffff}.", "Okey")
    } else { 
		addChatMessage("{00FF40}[Info | CH] {FFFFFF}Для начала взаимодействия с игроком нажмите на {088A08}«" inter_start "»{ffffff}.") 
    }  
}
return
