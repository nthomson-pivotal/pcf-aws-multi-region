# PCF AWS Multi-Region

This repository contains a project used to experiment with practically running Pivotal Cloud Foundry in an active-active configuration in multiple AWS regions.

The initial objectives were:

- Install PCF to two separate AWS regions
- Install a CockroachDB cluster that spans both regions (AWS VPC Peering for cross-region communication)
- Install the spring-music sample app such that it leverages the CockroachDB cluster a Postgres datastore
- Configure Route53 DNS in such a way that traffic is routed between both PCF foundations, leveraging healthchecks to stop traffic to one or both foundations when necessary