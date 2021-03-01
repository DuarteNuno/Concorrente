-module(world).

-import(string,[len/1,concat/2]).

-export([main/0]).

hello_world() -> 
	io:fwrite("Hello world\n").

add(A,B) ->
	hello_world(),
	A + B.

add(A,B,C) ->
	hello_world(),
	A + B + C.

var_stuff() ->
	Num = 1,
	Num.

do_math(A,B) ->
	add(A,B),
	A rem B.
	math:exp(A),	% valor de e
	math:log(A), 	%ln
	math:pow(A,2),	%potencia
	math:sqrt(10),
	random:uniform(10). % random 1-10



compare(A,B) ->
	A=:=B,	%value and type
	A=/=B,	%inequality
	A==B,   %equal no type required
	A/=B.	%different




main() ->
	var_stuff().
	do_math(2,3).


