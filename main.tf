provider "oci" {
   tenancy_ocid = "${var.tenancy_ocid}"
   user_ocid = "${var.user_ocid}"
   fingerprint = "${var.fingerprint}"
   private_key_path = "${var.private_key_path}"
   region = "${var.region}"
}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Oracle Java Management Service"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		is_live_migration_preferred = "true"
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "CouQ:AP-MUMBAI-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaand5t76yusep3clxjwjhja2an6ezosncomswqfpvc5sukrhbxidxa"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.ap-mumbai-1.aaaaaaaa3dtnskutap45ymd4gnqd2cstnunkjzs7cjvefoidr4yzjhqts2aq"
	}
	display_name = "oci-gp"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCL3xSvp5sZuVmAK+meHhyH0+qtrsD4eVkyVfgd24c2MpsbDhJ6tx1TwLOhNoO/fO3n6pslFOE9fsv1ONyOmrppLohr1t/yusEYY2P8kTbNyxV2hlC5AQ6aYcJB+G5giAzL6DeEyZJ9i4fw32j9CoyOBw0VK810QV4erYTQ4S73C20GkJKYmmTDEaQE2FJHrDFPa7XqmTFJG3lV63YDTdgV1Wp8iq9bPl7BCxCKZJeRX9yi9Cz8ow+8LMwbvpoJYGqKN/YcVdhhg8//INiUnOVU6tzw9P2bFlhwrsiaT01Wnk7wQDopTejuGlv0rmHFicbnGeZTJ8zKrAq7jmEhicZ5 ssh-key-2023-09-26"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaasv25l5df4qsojf7j26awkupl5xd6f7nca57nzfbdc4snpe66hcba"
		source_type = "image"
	}
}
