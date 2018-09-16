resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = "${module.pcf-1.vpc_id}"
  peer_vpc_id   = "${module.pcf-2.vpc_id}"
  peer_owner_id = "${data.aws_caller_identity.account.account_id}"
  peer_region   = "us-west-2"
  auto_accept   = true
}