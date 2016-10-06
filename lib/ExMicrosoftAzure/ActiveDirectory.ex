defmodule ExMicrosoftAzure.ActiveDirectory do
  use GenServer

  ## Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def get_access_token(pid, %{ environment: environment, aad_tenant_id: aad_tenant_id, client_id: client_id, client_secret: client_secret })
    when is_binary(aad_tenant_id) and is_binary(client_id) and is_binary(client_secret) and is_atom(environment)
  do
    GenServer.call(pid, {:get_access_token, %{ environment: environment, aad_tenant_id: aad_tenant_id, client_id: client_id, client_secret:  client_secret } })
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, %{ }}
  end

  def handle_call({:get_access_token, %{ environment: environment, aad_tenant_id: aad_tenant_id, client_id: client_id, client_secret:  client_secret }}, _from, stats) do
    client = OAuth2.Client.new([
      strategy: OAuth2.Strategy.ClientCredentials,
      site: ExMicrosoftAzure.Environment.get(environment).active_directory_endpoint <> aad_tenant_id,
      token_url: "/oauth2/token?api-version=1.0",
      token_method: :post,
      client_id: client_id,
      client_secret: client_secret
    ])

    %OAuth2.Client{ token: %OAuth2.AccessToken{ access_token: access_token } } = client |> OAuth2.Client.get_token!(
        [ auth_scheme: "request_body", resource: ExMicrosoftAzure.Environment.get(environment).resource_manager_endpoint ],
        [ ],
        [ proxy: "http://127.0.0.1:8888", ssl_options: [ cacertfile: "C:\\Users\\chgeuer\\Desktop\\fiddler.cer"] ]
      )

      {:reply, access_token, stats }
  end
end
