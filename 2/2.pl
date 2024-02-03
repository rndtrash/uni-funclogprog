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

/* son(X, Y) - X является сыном Y */
son(X, Y):- man(X), parent(X, Y).

/* son(X) - найти сына родителя X */
son(X):- son(Y, X), print(Y), nl, fail.

/* husband(X, Y) - является ли X женой Y */
husband(X, Y):- woman(X), man(Y), parent(X, Z), parent(Y, Z).

/* husband(X) - найти мужа жены X */
husband(X):- husband(X, Y), print(Y), nl, fail.
