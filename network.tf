resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "${module.pcf-1.vpc_id}"
  peer_vpc_id   = "${module.pcf-2.vpc_id}"
  peer_owner_id = "${data.aws_caller_identity.account.account_id}"
  peer_region   = "us-west-2"
}

provider "aws" {
  alias  = "peer"
  region = "us-west-2"
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = "aws.peer"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peer.id}"
  auto_accept               = true
}

data "aws_route_tables" "pcf-1_rts" {
  vpc_id = "${module.pcf-1.vpc_id}"
}

resource "aws_route" "pcf-1_peer_route" {
  count                     = "${length(data.aws_route_tables.pcf-1_rts.ids)}"
  route_table_id            = "${data.aws_route_tables.pcf-1_rts.ids[count.index]}"
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peer.id}"
}

data "aws_route_tables" "pcf-2_rts" {
  provider = "aws.peer"
  vpc_id   = "${module.pcf-2.vpc_id}"
}

resource "aws_route" "pcf-2_peer_route" {
  provider                  = "aws.peer"
  count                     = "${length(data.aws_route_tables.pcf-2_rts.ids)}"
  route_table_id            = "${data.aws_route_tables.pcf-2_rts.ids[count.index]}"
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.peer.id}"
}
