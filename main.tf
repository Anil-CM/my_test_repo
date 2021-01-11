data "ibm_resource_group" "group" {
  name = "Default"
}

resource "ibm_resource_instance" "resource_instance" {
  name              = var.name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = data.ibm_resource_group.group.id
  tags              = var.tags

  parameters = {
    HMAC = true
  }
  //User can increase timeouts 
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}
