module "aci_endpoint_group" {
  source = "netascode/endpoint-group/aci"

  tenant              = "ABC"
  application_profile = "AP1"
  name                = "EPG1"
  alias               = "EPG1-ALIAS"
  description         = "My Description"
  flood_in_encap      = true
  intra_epg_isolation = true
  preferred_group     = true
  bridge_domain       = "BD1"
  subnets = [{
    description        = "Subnet Description"
    ip                 = "1.1.1.1/24"
    public             = true
    shared             = true
    igmp_querier       = true
    nd_ra_prefix       = true
    no_default_gateway = false
  }]
  contracts = {
    consumers          = ["CON1"]
    providers          = ["CON1"]
    imported_consumers = ["I_CON1"]
  }
  physical_domains = ["PHY1"]
  vmware_vmm_domains = [{
    name                 = "VMW1"
    u_segmentation       = true
    delimiter            = ":"
    vlan                 = 123
    netflow              = false
    deployment_immediacy = "lazy"
    resolution_immediacy = "lazy"
    allow_promiscuous    = true
    forged_transmits     = true
    mac_changes          = true
  }]
  static_ports = [{
    node_id              = 101
    vlan                 = 123
    pod_id               = 1
    port                 = 10
    module               = 1
    deployment_immediacy = "lazy"
    mode                 = "untagged"
  }]
  static_endpoints = [{
    name           = "EP1"
    alias          = "EP1-ALIAS"
    mac            = "11:11:11:11:11:11"
    ip             = "1.1.1.10"
    type           = "silent-host"
    node_id        = 101
    node2_id       = 102
    vlan           = 123
    pod_id         = 1
    channel        = "VPC1"
    additional_ips = ["1.1.1.11"]
  }]
}
