locals {

  mod_tags = merge(
  var.base_tags,
  {
    manager = "Michael Coulling-Green"
  }
  )

  subnet_cidrs_clean = {
    for name, cidr in var.subnet_cidrs :
    lower(trimspace(name)) => trimspace(cidr)
  }

}
