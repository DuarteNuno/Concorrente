-module(p1).
%-import(lib_misc, [unconsult/2]).
-compile(export_all).


%verifica se X pertence a lista
member(X, [X|_]) -> true;
member(X, [_|R]) -> member(X,R);
member(X,[])->false.

sum([X|R]) -> X + sum(R);
sum([])->0.

reverse([A|B]) -> reverse(B)++[A];
reverse([])->[].

mapp(F,[])->[];
mapp(F,[X|R])->[F(X)|mapp(F,R)].

dobro(X)->2*X.

par(X) -> (X>=0) and (X rem 2 =:= 0).
impar(X) -> X rem 2 =/= 0. 

partition(P,List)->part(P,List,[],[]).

part(Pred,[H|R],T,F)->
	case Pred(H) of
		true -> part(Pred,R,[H|T],F);
		false -> part(Pred,R,T,[H|F])
	end;

part(Pred,[],T,F)->{T,F}.

update(File, Key, Delta) ->
	{ok, Terms} = file:consult(File),
	Terms1 = do_update(Key, Delta, Terms),
	unconsult(File ++ ".tmp", Terms1 ).

do_update(Key, Delta, [{Key, Val}| T ]) -> [{Key, Val+Delta}| T ];
do_update(Key, Delta, [H|T] ) -> [H|do_update(Key, Delta, T )];
do_update(Key, Delta, [] ) -> [{Key, Delta}].