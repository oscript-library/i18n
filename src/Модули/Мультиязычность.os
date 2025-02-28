Перем _ТекущийКодЛокализации; // Строка
Перем _КодЛокализацииПоУмолчанию; // Строка
Перем _ТекущийЯзык; // Строка
Перем _ТекущаяСтрана; // Строка
Перем _ПакетРесурсовПоУмолчанию; // Объект.ПакетРесурсовЛокализации
                                 // Объект.ГруппаПакетовРесурсовЛокализации

#Область ПрограммныйИнтерфейс

// Получает текущую локаль
//
// Возвращаемое значение:
//   Строка
Функция ТекущаяЛокаль() Экспорт
	Возврат _ТекущийКодЛокализации;
КонецФункции

// Устанавливает текущую локаль
//
// Параметры:
//   КодЛокализации - Строка - Код локализации
Процедура УстановитьЛокаль(КодЛокализации) Экспорт

	СтруктураКодаЛокализации = РаспарситьКодЛокализации(КодЛокализации);

	_ТекущийКодЛокализации = КодЛокализации;
	_ТекущийЯзык = СтруктураКодаЛокализации.Язык;
	_ТекущаяСтрана = СтруктураКодаЛокализации.Страна;

	ПереключитьЯзыкПакетаРесурсовПоУмолчанию(КодЛокализации);

КонецПроцедуры

// Получает локаль по умолчанию
//
// Возвращаемое значение:
//   Строка
Функция ЛокальПоУмолчанию() Экспорт
	Возврат _КодЛокализацииПоУмолчанию;
КонецФункции

// Устанавливает локаль по умолчанию
//
// Параметры:
//   КодЛокализации - Строка - Код локализации
Процедура УстановитьЛокальПоУмолчанию(КодЛокализации) Экспорт
	_КодЛокализацииПоУмолчанию = КодЛокализации;
КонецПроцедуры

// Получает код языка
//
// Возвращаемое значение:
//   Строка
Функция ТекущийЯзык() Экспорт
	Возврат _ТекущийЯзык;
КонецФункции

// Получает код страны
//
// Возвращаемое значение:
//   Строка
Функция ТекущаяСтрана() Экспорт
	Возврат _ТекущаяСтрана;
КонецФункции

// Получает пакет ресурсов по умолчанию
//
// Возвращаемое значение:
//   Объект.ПакетРесурсовЛокализации, Объект.ГруппаПакетовРесурсовЛокализации
Функция ПакетРесурсовПоУмолчанию() Экспорт
	Возврат _ПакетРесурсовПоУмолчанию;
КонецФункции

// Устанавливает пакет ресурсов по умолчанию
//
// Параметры:
//   Пакет - Объект.ПакетРесурсовЛокализации - Пакет ресурсов
//         - Объект.ГруппаПакетовРесурсовЛокализации - Группа пакетов ресурсов
Процедура УстановитьПакетРесурсовПоУмолчанию(Пакет) Экспорт
	_ПакетРесурсовПоУмолчанию = Пакет;
КонецПроцедуры

// Получает ресурс по имени из пакета ресурсов по умолчанию
// Возвращает Неопределено в случае, если ресурс не найден
//
// Параметры:
//   ИмяРесурса - Строка - Имя ресурса
//
// Возвращаемое значение:
//   Произвольный
Функция ПолучитьРесурс(ИмяРесурса) Экспорт

	Пакет = _ПакетРесурсовПоУмолчанию;
	Если Пакет = Неопределено Тогда
		ВызватьИсключение "Не указан пакет ресурсов";
	КонецЕсли;

	Возврат Пакет.ПолучитьРесурс(ИмяРесурса);
	
КонецФункции

// Получает строковое значение ресурса из пакета ресурсов по умолчанию
// с подставлением параметров по принципу функции СтрШаблон
//
// Возвращает Неопределено в случае, если ресурс не найден
//
// Параметры:
//   ИмяРесурса - Строка - Имя ресурса
//   ЗначениеПараметра1-ЗначениеПараметра9 - Произвольный - Параметры, содержащие произвольные значения, строковые
//                                                          представления которых должны быть подставлены в шаблон 
//
// Возвращаемое значение:
//   Строка, Неопределено
Функция ПолучитьСтроку(ИмяРесурса,
	ЗначениеПараметра1 = Неопределено, ЗначениеПараметра2 = Неопределено, ЗначениеПараметра3 = Неопределено,
	ЗначениеПараметра4 = Неопределено, ЗначениеПараметра5 = Неопределено, ЗначениеПараметра6 = Неопределено,
	ЗначениеПараметра7 = Неопределено, ЗначениеПараметра8 = Неопределено, ЗначениеПараметра9 = Неопределено) Экспорт
	
	Пакет = _ПакетРесурсовПоУмолчанию;
	Если Пакет = Неопределено Тогда
		ВызватьИсключение "Не указан пакет ресурсов";
	КонецЕсли;

	Возврат ПолучитьСтрокуИзПакета(ИмяРесурса, Пакет,
		ЗначениеПараметра1, ЗначениеПараметра2, ЗначениеПараметра3,
		ЗначениеПараметра4, ЗначениеПараметра5, ЗначениеПараметра6,
		ЗначениеПараметра7, ЗначениеПараметра8, ЗначениеПараметра9);

КонецФункции

// Заполняет шаблон ресурсами из пакета заменяя конструкцию {t(ИмяРесурса)} на значение ресурса
//
// Параметры:
//   Шаблон - Строка - Текст шаблона
//   Пакет - Объект.ПакетРесурсовЛокализации
//         - Объект.ГруппаПакетовРесурсовЛокализации
Процедура ЗаполнитьШаблон(Шаблон, Пакет = Неопределено) Экспорт

	Если Пакет = Неопределено Тогда
		Пакет = _ПакетРесурсовПоУмолчанию;
	КонецЕсли;

	Если Пакет = Неопределено Тогда
		ВызватьИсключение "Не указан пакет ресурсов";
	КонецЕсли;
	
	РегулярноеВыражение = Новый РегулярноеВыражение("{t\(([^()]+)\)}");
	Совпадения = РегулярноеВыражение.НайтиСовпадения(Шаблон);

	Если Совпадения.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	Подстроки = Новый Массив();
	ТекущаяПозиция = 1;
	Для Каждого Совпадение Из Совпадения Цикл
		ПозицияСовпадения = Совпадение.Группы[0].Индекс + 1;
		ЗаменяемоеЗначение = Совпадение.Группы[0].Значение;	
		ИмяРесурса = Совпадение.Группы[1].Значение;
		Значение = Пакет.ПолучитьРесурс(ИмяРесурса);

		Если Не Значение = Неопределено Тогда
			КоличествоСимволов = ПозицияСовпадения - ТекущаяПозиция;
			Если КоличествоСимволов > 0 Тогда
				Подстроки.Добавить(Сред(Шаблон, ТекущаяПозиция, КоличествоСимволов));
			КонецЕсли;

			Подстроки.Добавить(Значение);
			ТекущаяПозиция = ПозицияСовпадения + СтрДлина(ЗаменяемоеЗначение);
		КонецЕсли;
	КонецЦикла;

	Подстроки.Добавить(Сред(Шаблон, ТекущаяПозиция));
			
	Шаблон = СтрСоединить(Подстроки);

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Парсит код локализаци на язык и страну
//
// Параметры:
//   КодЛокализации - Строка - Код локализации (ru, ru_RU)
//
// Возвращаемое значение:
//   Структура:
//     * Язык - Строка - Код языка
//     * Строка - Строка - Код страны
Функция РаспарситьКодЛокализации(КодЛокализации) Экспорт
	
	Результат = Новый Структура("Язык, Страна", "", "");

	МассивПодстрок = СтрРазделить(СокрЛП(КодЛокализации), "_");
	Количество = МассивПодстрок.Количество();

	Если Количество = 1 Тогда
		Результат.Язык = МассивПодстрок[0];
	ИначеЕсли Количество = 2 Тогда
		Результат.Язык = МассивПодстрок[0];
		Результат.Страна = МассивПодстрок[1];
	ИначеЕсли Количество > 2 Тогда
		ВызватьИсключение СтрШаблон("Код локализации %1 должен быть в формате {Язык}_{Страна} (ru_RU) или {Язык} (ru)", КодЛокализации);
	КонецЕсли;

	Возврат Результат;

КонецФункции

// Получает строковое значение ресурса с подставлением параметров по принципу функции СтрШаблон
// Возвращает Неопределено в случае, если ресурс не найден
//
// Параметры:
//   ИмяРесурса - Строка - Имя ресурса
//   ЗначениеПараметра1-ЗначениеПараметра9 - Произвольный - Параметры, содержащие произвольные значения, строковые
//                                                          представления которых должны быть подставлены в шаблон
//
// Возвращаемое значение:
//   Строка, Неопределено
Функция ПолучитьСтрокуИзПакета(ИмяРесурса, Пакет,
	ЗначениеПараметра1 = Неопределено, ЗначениеПараметра2 = Неопределено, ЗначениеПараметра3 = Неопределено,
	ЗначениеПараметра4 = Неопределено, ЗначениеПараметра5 = Неопределено, ЗначениеПараметра6 = Неопределено,
	ЗначениеПараметра7 = Неопределено, ЗначениеПараметра8 = Неопределено, ЗначениеПараметра9 = Неопределено) Экспорт
	
	Ресурс = Пакет.ПолучитьРесурс(ИмяРесурса);
	Если Ресурс = Неопределено Тогда
		Возврат Неопределено;
	КонецЕсли;

	Возврат СтрШаблон(Ресурс, 
		ЗначениеПараметра1, ЗначениеПараметра2, ЗначениеПараметра3,
		ЗначениеПараметра4, ЗначениеПараметра5, ЗначениеПараметра6,
		ЗначениеПараметра7, ЗначениеПараметра8, ЗначениеПараметра9);

КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПереключитьЯзыкПакетаРесурсовПоУмолчанию(КодЛокализации)

	Если ТипЗнч(_ПакетРесурсовПоУмолчанию) = Тип("ПакетРесурсовЛокализации") Тогда

		Пакет = МенеджерРесурсовЛокализации.ПолучитьПакет(_ПакетРесурсовПоУмолчанию.БазовоеИмя(), КодЛокализации);
		Пакет.ИспользоватьПоУмолчанию();

	ИначеЕсли ТипЗнч(_ПакетРесурсовПоУмолчанию) = Тип("ГруппаПакетовРесурсовЛокализации") Тогда

		МассивИмен = Новый Массив();
		Для Каждого Пакет Из _ПакетРесурсовПоУмолчанию.Пакеты() Цикл
			МассивИмен.Добавить(Пакет.БазовоеИмя());
		КонецЦикла;

		ГруппаПакетов = МенеджерРесурсовЛокализации.ПолучитьПакеты(СтрСоединить(МассивИмен, ","), КодЛокализации);
		ГруппаПакетов.ИспользоватьПоУмолчанию();

	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область Инициализация

УстановитьЛокаль("ru_RU");
УстановитьЛокальПоУмолчанию("en_UK");

#КонецОбласти