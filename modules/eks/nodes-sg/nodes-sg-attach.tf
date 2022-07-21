data "aws_instances" "workers" {
  instance_tags = {
    "eks:cluster-name"   = var.cluster_name
    "eks:nodegroup-name" = var.nodes_name
  }
}

data "aws_instance" "workers" {
  for_each    = toset(data.aws_instances.workers.ids)
  instance_id = each.value
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  for_each             = { for instance in data.aws_instance.workers : instance.id => instance.network_interface_id }
  security_group_id    = aws_security_group.allow_vpc_peer.id
  network_interface_id = each.value
}
