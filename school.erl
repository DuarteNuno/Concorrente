-module(school).


-export([main/0]).

main() ->
	what_grade(rand:uniform(21)).

preescola() ->
	'preescola'.

primeiroCiclo() -> 
	'1º ciclo'.

segundoCiclo() -> 
	'2º ciclo'.

terceiroCiclo() -> 
	'3º ciclo'.

secundario() -> 
	'secundário'.

universidade() -> 
	'universidade'.

what_grade(X) ->
	io:fwrite("~w\n",[X]),
	if X < 5 -> preescola()
		; X < 9 -> primeiroCiclo()
		; X < 11 -> segundoCiclo()
		; X < 14 -> terceiroCiclo()
		; X < 17 -> secundario()
		; X =<21 -> universidade()
	end.
