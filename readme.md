# Rebar3 Cowboy Plugin

A minimal [rebar3](https://www.rebar3.org) plugin to aid creating [Cowboy](https://ninenines.eu/docs/en/cowboy/2.6/guide/) based Erlang applications.

Currently only one template is provided: for generating new Cowboy [handlers](https://ninenines.eu/docs/en/cowboy/2.6/guide/handlers/).

## Installation

For now, copy [cowboy_handler.template](cowboy_handler.template) and [cowboy_handler.erl](cowboy_handler.erl) to your `~/.config/rebar3/templates` directory.  

**TODO** convert this to a rebar3 module so it can be installed with rebar itself.

## Use

First, create and initialise a Cowboy application.  See "Pre-requisites" below.

Then:

1. Create the handler:

		$ rebar3 new cowboy_handler myfirst

1. Add the handler to your `_app.erl` file (`src/myapp_app.erl` using example in pre-requisites below): 

		start(_StartType, _StartArgs) ->
			Dispatch = cowboy_router:compile([
					{'_', [{"/", myfirst_handler, []}]} %% <-- handler called here when user requests root path
				]),
			{ok, _} = cowboy:start_clear(my_http_listener,
				[{port, 8080}],
				#{env => #{dispatch => Dispatch}}
				),    
			spike_rebar3_sup:start_link().

1. Run your application:

		$ rebar3 shell

		===> Verifying dependencies...
		===> Compiling myapp
		Erlang/OTP 22 [erts-10.4.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1]

		Eshell V10.4.3  (abort with ^G)
		1> ===> The rebar3 shell is a development tool; to deploy applications in production, consider using releases (http://www.rebar3.org/docs/releases)
		===> Booted cowlib
		===> Booted ranch
		===> Booted cowboy
		===> Booted myapp

1. Query the app:

		$ curl localhost:8080
		Response body - replace me

1. Edit the handler (`src/myfirst_handler.erl`) as required.  See the [Cowboy docs](https://ninenines.eu/docs/en/cowboy/2.6/guide/) for building out the app from here.

## Pre-Requisites

Only one template is currently provided: to generate a new Cowboy [Handler](https://ninenines.eu/docs/en/cowboy/2.6/guide/handlers/).

To use, first create a new application, e.g. using the standard rebar3 [new app](https://www.rebar3.org/docs/basic-usage) command:

	$ cd projects
	$ rebar3 new app myapp
	$ cd myapp

Then:
1. Add Cowboy as a dependency to `rebar.config`, described under "Adding Dependencies" in the [Rebar3 docs](https://www.rebar3.org/docs/basic-usage):  

		{deps,	[
				{cowboy, "2.6.0"}
				]
		}. 


