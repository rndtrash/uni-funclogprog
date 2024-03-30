/* max(+X, +Y, +U, -Z) - поиск максимального числа */
max(X, Y, U, Z) :- TempMax is max(X, max(Y, U)), Z = TempMax.

/* fact_down(+N, -X) - Поиск факториала с помощью рекурсии вниз */
fact_down(0, 1) :- !.
fact_down(N, X) :- N > 0, N1 is N - 1, fact_down(N1, X1), X is N * X1.

/* fact_up(+N, -X) - Поиск факториала с помощью рекурсии вверх */
fact_up(N, X) :- fact_up_acc(N, 1, X).
fact_up_acc(0, Acc, Acc) :- !.
fact_up_acc(N, Acc, X) :- N > 0, N1 is N - 1, AccTemp is N * Acc, fact_up_acc(N1, AccTemp, X).

/* sum_digits_down(+N, -S) - Найти сумму цифр числа с помощью рекурсии вниз */
sum_digits_down(0, 0) :- !.
sum_digits_down(N, S) :- N > 0, Digit is N rem 10, N10 is N div 10, sum_digits_down(N10, S1), S is Digit + S1.

/* sum_digits_up(+N, -S) - Найти сумму цифр числа с помощью рекурсии вверх */
sum_digits_up(N, S) :- sum_digits_acc(N, 0, S).
sum_digits_acc(0, Acc, Acc) :- !.
sum_digits_acc(N, Acc, S) :- N > 0, Digit is N rem 10, N10 is N div 10, Acc1 is Acc + Digit, sum_digits_acc(N10, Acc1, S).

/* is_square_free(+N) - Является ли число свободным от квадратов */
is_square_free(N) :- N = 1; N > 1, not((between(2, N, X), 0 is N mod X^2)).

/* read_list(-List) - Получить от пользователя список чисел */
read_list(List) :-
    write('Введите элементы списка, или "stop.", чтобы закончить список:'), nl, read_line(List).
read_number(Number) :-
    write('Введите число: '), read(Number).

read_line([X|List]) :-
    read(X), X \= 'stop', !, read_line(List).
read_line([]).

/* write_list(+List) - Вывести список на экран */
write_list([]) :- !.
write_list([El|Tail]) :- write(El), nl, write_list(Tail).