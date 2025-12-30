locals {

  mod_tags = merge(
  var.base_tags,
  {
    manager = "Clare Hooper"
  }
  )

  subnet_cidrs_clean = {
    for name, cidr in var.subnet_cidrs :
    lower(trimspace(name)) => trimspace(cidr)
  }

}
