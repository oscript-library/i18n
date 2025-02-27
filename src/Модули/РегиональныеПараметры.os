Перем _ТекущийКодЛокализации;
Перем _КодЛокализацииПоУмолчанию;
Перем _ТекущийЯзык;
Перем _ТекущаяСтрана;

#Область ПрограммныйИнтерфейс

Функция ТекущаяЛокаль() Экспорт
	Возврат _ТекущийКодЛокализации;
КонецФункции

Процедура УстановитьЛокаль(КодЛокализации) Экспорт
	СтруктураКодаЛокализации = ЛокализацияПриложения.РаспарситьКодЛокализации(КодЛокализации);

	_ТекущийКодЛокализации = КодЛокализации;
	_ТекущийЯзык = СтруктураКодаЛокализации.Язык;
	_ТекущаяСтрана = СтруктураКодаЛокализации.Страна;
КонецПроцедуры

Функция ЛокальПоУмолчанию() Экспорт
	Возврат _КодЛокализацииПоУмолчанию;
КонецФункции

Процедура УстановитьЛокальПоУмолчанию(КодЛокализации) Экспорт
	_КодЛокализацииПоУмолчанию = КодЛокализации;
КонецПроцедуры

Функция ТекущийЯзык() Экспорт
	Возврат _ТекущийЯзык;
КонецФункции

Функция ТекущаяСтрана() Экспорт
	Возврат _ТекущаяСтрана;
КонецФункции

#КонецОбласти

#Область Инициализация

УстановитьЛокаль("ru_RU");
УстановитьЛокальПоУмолчанию("en_UK");

#КонецОбласти