﻿//начало текста модуля

Перем Ванесса;

Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);


	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт
	Контекст.Вставить("Зн",-1);
КонецПроцедуры


Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


//окончание текста модуля  