﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуПродолжитьВыполнениеШаговВХостСистемеЕслиСлужебныйПараметрБольше(Парам01)","ЯМогуПродолжитьВыполнениеШаговВХостСистемеЕслиСлужебныйПараметрБольше","И     Я могу продолжить выполнение шагов в хост системе если СлужебныйПараметр больше 4","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И     Я могу продолжить выполнение шагов в хост системе если СлужебныйПараметр больше 4
//@ЯМогуПродолжитьВыполнениеШаговВХостСистемеЕслиСлужебныйПараметрБольше(Парам01)
Процедура ЯМогуПродолжитьВыполнениеШаговВХостСистемеЕслиСлужебныйПараметрБольше(Парам01) Экспорт
	Если КонтекстСохраняемый.СлужебныйПараметр > 4 Тогда
		Если Ванесса.ХостСистема <> Неопределено Тогда
			Ванесса.ХостСистема.ПродолжитьВыполнениеШагов();
		КонецЕсли;	 
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля