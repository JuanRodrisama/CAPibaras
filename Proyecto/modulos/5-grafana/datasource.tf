resource "grafana_data_source" "CAPibarasdb" {
  provider = grafana.second

  type          = "influxdb"
  name          = "CAPibaras"
  url           = "https://grafana.com/orgs/adriannavesdelafuenteexternal/stacks/658564"
  username      = "capibaras"
  password      = "CAPiaras1234"
  database_name = "CAPibarasdb"
}