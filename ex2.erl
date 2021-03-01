-module(ex2).
%-export([start/0,conc_factorial/2,status/1,stop/1]).
-compile(export_all).

%1)
compute_factorial(0) -> 1;  %função factorial
compute_factorial(X) -> X*compute_factorial(X-1).

%loop() ->
%   receive
%         % comando factorial
%      {factorial, From, M} -> From ! {response, compute_factorial(M)},
%      loop()
%  end.
%
%start1() ->
%    spawn(fun () -> loop() end).

%factorial1(Server, M) ->
%   % enviar um request ao server
%   Server ! {factorial,self(),M}, % espera pela resposta e retorna-a
%   receive {response, Result} -> Result end.

%2)
%loop(N), N é um contador de requests
% loop1(N) ->
%    receive
%          % comando factorial
%       {factorial, From, M} ->
%          From ! {response, compute_factorial(M)}, loop(N+1); % no fim incrementa o N
%       % comando status do server - retorna o N
%       {status, From} ->
%          From ! {response, N},
%          loop(N); % não incrementa o N, pois só conta o numero de factoriais
%       % comando stop
%       {stop, From} ->
%          ok
%    end.

% stop1(Server) ->
%    Server ! {stop, self()},
%    ok.

%  status1(Server) ->
%     %enviar um request ao server
%     Server ! {status, self()},
%     %espera pela resposta e retorna-a
%     receive {response, Result} -> Result end.


%3)
%Altere as funções anteriores para ter vários clientes, como exemplo, a nova função de pedido de status é:
   status(Server) ->
   Ref = make_ref(), % função buit-in que gera uma nova referência
   %o cliente Ref envia um pedido ao server
   Server ! {status, self(), Ref},
   % espera pela resposta e retorna-a
   receive {response, Ref, Result} -> Result end.

   start() -> spawn( fun () -> loop(0) end).

   stop(Server) ->
          Server ! {stop,self(),0},
          ok.

   factorial(Server, M) ->
   Ref = make_ref(),
   % enviar um request ao server
   Server ! {factorial,self(),Ref,M}, % espera pela resposta e retorna-a
   receive {response, Ref, Result} -> Result end.


   loop(N) -> receive
            % comando factorial
         {factorial, From, Ref, M} ->
            From ! {response, Ref, compute_factorial(M)} ,loop(N+1);
            % comando status
         {status, From, Ref} ->
            From ! {response, Ref, N},
            loop(N);
         {stop, From, Ref} ->
           ok
   end.
   