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
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПолучаюСостояниеVanessaBehvior()","ЯПолучаюСостояниеVanessaBehvior","Когда я получаю состояние Vanessa Behvior");

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
	СостояниеVanessaBehvior = Ванесса.ПолучитьСостояниеVanessaBehavior();
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	СостояниеVanessaBehvior = Ванесса.ПолучитьСостояниеVanessaBehavior();
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я получаю состояние Vanessa Behvior
//@ЯПолучаюСостояниеVanessaBehvior()
Процедура ЯПолучаюСостояниеVanessaBehvior() Экспорт
	СостояниеVanessaBehvior = Ванесса.ПолучитьСостояниеVanessaBehavior();
	ТекущаяФича             = СостояниеVanessaBehvior.ТекущаяФича;
	ТекущийСценарий         = СостояниеVanessaBehvior.ТекущийСценарий;
	ТекущийШаг              = СостояниеVanessaBehvior.ТекущийШаг;
	
	
	
	ТекущаяФича_Имя        = ТекущаяФича.Имя;
	ТекущаяФича_ПолныйПуть = ТекущаяФича.ПолныйПуть;
		
	Ванесса.ПроверитьРавенство(ТекущийСценарий.Имя,"Тестовая фича, проверяющая получение состояния");
	Ванесса.ПроверитьРавенство(ТекущийШаг.Имя,"Когда я получаю состояние Vanessa Behvior");
	
КонецПроцедуры



//окончание текста модуля