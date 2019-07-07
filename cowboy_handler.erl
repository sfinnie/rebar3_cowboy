-module({{name}}_handler).

-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
    %% Default body, replace with required behaviour 
    %% See https://ninenines.eu/docs/en/cowboy/2.6/guide/handlers/
   	Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Response body - replace me">>,
        Req0),
    {ok, Req, State}.
