defmodule ExMicrosoftAzure.Environment do

  @moduledoc """
  A collection of currently available Microsoft Azure Cloud Environments 
  """
  defstruct name: nil,
    management_portal_url: nil,
    publish_settings_url: nil,
    service_management_endpoint: nil,
    resource_manager_endpoint: nil,
    active_directory_endpoint: nil,
    gallery_endpoint: nil,
    keyvault_endpoint: nil,
    graph_endpoint: nil,
    storage_dns_suffix: nil,
    sqldatabase_dns_suffix: nil,
    trafficmanager_dns_suffix: nil,
    keyvault_dns_suffix: nil,
    servicebus_dns_suffix: nil

  def get(:azure), do: get(:azure_cloud)
  def get(:public), do: get(:azure_cloud)
  def get(:com), do: get(:azure_cloud)
  def get(:worldwide), do: get(:azure_cloud)
  def get(:azure_cloud), do: azure_cloud

  def get(:us), do: get(:azure_usgovernment_cloud)
  def get(:usgov), do: get(:azure_usgovernment_cloud)
  def get(:fairfax), do: get(:azure_usgovernment_cloud)
  def get(:azure_usgovernment_cloud), do: azure_usgovernment_cloud

  def get(:cn), do: get(:azure_china_cloud)
  def get(:china), do: get(:azure_china_cloud)
  def get(:mooncake), do: get(:azure_china_cloud)
  def get(:azure_china_cloud), do: azure_china_cloud

  def get(:de), do: get(:azure_german_cloud)
  def get(:germany), do: get(:azure_german_cloud)
  def get(:blackforest), do: get(:azure_german_cloud)
  def get(:azure_germany_cloud), do: get(:azure_german_cloud)
  def get(:azure_german_cloud), do: azure_german_cloud

  defp azure_cloud do
    %ExMicrosoftAzure.Environment {
      name: "AzurePublicCloud",
      management_portal_url: "http://manage.windowsazure.com/",
      publish_settings_url: "https://manage.windowsazure.compublishsettings/index",
      service_management_endpoint: "https://management.core.windows.net/",
      resource_manager_endpoint: "https://management.azure.com/",
      active_directory_endpoint: "https://login.microsoftonline.com/",
      gallery_endpoint: "https://gallery.azure.com/",
      keyvault_endpoint: "https://vault.azure.net/",
      graph_endpoint: "https://graph.windows.net/",
      storage_dns_suffix: "core.windows.net",
      sqldatabase_dns_suffix: "database.windows.net",
      trafficmanager_dns_suffix: "trafficmanager.net",
      keyvault_dns_suffix: "vault.azure.net",
      servicebus_dns_suffix: "servicebus.azure.com"
    }
  end

  defp azure_usgovernment_cloud do
    %ExMicrosoftAzure.Environment {
      name: "AzureUSGovernmentCloud",
      management_portal_url: "https://manage.windowsazure.us/",
      publish_settings_url: "https://manage.windowsazure.us/publishsettings/index",
      service_management_endpoint: "https://management.core.usgovcloudapi.net/",
      resource_manager_endpoint: "https://management.usgovcloudapi.net/",
      active_directory_endpoint: "https://login.microsoftonline.com/",
      gallery_endpoint:  "https://gallery.usgovcloudapi.net/",
      keyvault_endpoint: "https://vault.usgovcloudapi.net/",
      graph_endpoint: "https://graph.usgovcloudapi.net/",
      storage_dns_suffix: "core.usgovcloudapi.net",
      sqldatabase_dns_suffix: "database.usgovcloudapi.net",
      trafficmanager_dns_suffix: "usgovtrafficmanager.net",
      keyvault_dns_suffix: "vault.usgovcloudapi.net",
      servicebus_dns_suffix: "servicebus.usgovcloudapi.net"
    }
  end

  defp azure_china_cloud do
    %ExMicrosoftAzure.Environment {
      name: "AzureChinaCloud",
      management_portal_url:  "https://manage.chinacloudapi.com/",
      publish_settings_url: "https://manage.chinacloudapi.com/publishsettings/index",
      service_management_endpoint: "https://management.core.chinacloudapi.cn/",
      resource_manager_endpoint: "https://management.chinacloudapi.cn/",
      active_directory_endpoint: "https://login.chinacloudapi.cn/?api-version=1.0",
      gallery_endpoint: "https://gallery.chinacloudapi.cn/",
      keyvault_endpoint: "https://vault.azure.cn/",
      graph_endpoint: "https://graph.chinacloudapi.cn/",
      storage_dns_suffix: "core.chinacloudapi.cn",
      sqldatabase_dns_suffix: "database.chinacloudapi.cn",
      trafficmanager_dns_suffix: "trafficmanager.cn",
      keyvault_dns_suffix: "vault.azure.cn",
      servicebus_dns_suffix: "servicebus.chinacloudapi.net"
    }
  end

  defp azure_german_cloud do
    %ExMicrosoftAzure.Environment {
      name: "AzureGermanCloud",
      management_portal_url: "http://portal.microsoftazure.de/",
      publish_settings_url: "https://manage.microsoftazure.de/publishsettings/index",
      service_management_endpoint: "https://management.core.cloudapi.de/",
      resource_manager_endpoint: "https://management.microsoftazure.de/",
      active_directory_endpoint: "https://login.microsoftonline.de/",
      gallery_endpoint: "https://gallery.cloudapi.de/",
      keyvault_endpoint: "https://vault.microsoftazure.de/",
      graph_endpoint: "https://graph.cloudapi.de/",
      storage_dns_suffix: "core.cloudapi.de",
      sqldatabase_dns_suffix: "database.cloudapi.de",
      trafficmanager_dns_suffix: "azuretrafficmanager.de",
      keyvault_dns_suffix: "vault.microsoftazure.de",
      servicebus_dns_suffix: "servicebus.cloudapi.de"
    }
  end
end
