/* Вариант 11 */

/* man(X) - X является мужчиной */
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

/* woman(X) - X является женщиной */
woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

/* parent(X, Y) - X является родителем Y */
parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

/* grand_so(X, Y) - X является внуком Y */
grand_so(X, Y):- man(X), parent(Z, X), parent(Y, Z).

/* grand_sons(X) - внуки X. Пример: grand_sons(goluba). */
grand_sons(X):- grand_so(Y, X), print(Y), nl, fail.

/* grand_da(X, Y) - X является внучкой Y */
grand_da(X, Y):- woman(X), parent(Z, X), parent(Y, Z).

/*
	grand_ma_and_da(X, Y) - X является бабушкой, а Y - её внучкой, либо наоборот

	Сначала делается предположение, что X - внучка, а Y - прародитель (grandparent), тогда Y должна быть женщиной.
	В противном случае делается предположение, что Y - внучка, а X - прародитель, тогда Y должна быть женщиной.
*/
grand_ma_and_da(X, Y):- grand_da(X, Y), woman(Y); grand_da(Y, X), woman(X).

/* sibling(X, Y) - X является сиблингом (родным братом или сестрой) Y */
sibling(X, Y):- X \= Y, once(
		(
			parent(Z, X), parent(Z, Y)
		)
	). /* Предикат once позволяет выполнить проверку только один раз. TODO: так вообще можно? */

/* niece(X, Y) - X является племянницей (дочью брата/сестры) Y */
niece(X, Y):- woman(X), parent(Z, X), sibling(Z, Y). /* , \+ parent(X, Y) */

/* nieces(X) - все племянницы X */
nieces(X):- niece(Y, X), print(Y), nl, fail.
