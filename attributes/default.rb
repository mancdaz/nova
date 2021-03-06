########################################################################
# Toggles - These can be overridden at the environment level
default["enable_monit"] = false  # OS provides packages
########################################################################

# set to true to enable debugging output in the logs
default["nova"]["debug"] = false

default["nova"]["db"]["name"] = "nova"
default["nova"]["db"]["username"] = "nova"

default["nova"]["service_tenant_name"] = "service"
default["nova"]["service_user"] = "nova"
default["nova"]["service_role"] = "admin"

default["nova"]["volumes"]["enabled"] = false

default["nova"]["services"]["api"]["scheme"] = "http"
default["nova"]["services"]["api"]["network"] = "public"
default["nova"]["services"]["api"]["port"] = 8774
default["nova"]["services"]["api"]["path"] = "/v2/%(tenant_id)s"
default["nova"]["services"]["api"]["cert_file"] = "nova.pem"
default["nova"]["services"]["api"]["key_file"] = "nova.key"
default["nova"]["services"]["api"]["wsgi_file"] = "nova-api-os-compute"

default["nova"]["services"]["internal-api"]["scheme"] = "http"
default["nova"]["services"]["internal-api"]["network"] = "management"
default["nova"]["services"]["internal-api"]["port"] = 8774
default["nova"]["services"]["internal-api"]["path"] = "/v2/%(tenant_id)s"

default["nova"]["services"]["admin-api"]["scheme"] = "http"
default["nova"]["services"]["admin-api"]["network"] = "management"
default["nova"]["services"]["admin-api"]["port"] = 8774
default["nova"]["services"]["admin-api"]["path"] = "/v2/%(tenant_id)s"

default["nova"]["services"]["ec2-admin"]["scheme"] = "http"
default["nova"]["services"]["ec2-admin"]["network"] = "public"
default["nova"]["services"]["ec2-admin"]["port"] = 8773
default["nova"]["services"]["ec2-admin"]["path"] = "/services/Admin"
default["nova"]["services"]["ec2-admin"]["cert_file"] = "nova.pem"
default["nova"]["services"]["ec2-admin"]["key_file"] = "nova.key"
default["nova"]["services"]["ec2-admin"]["wsgi_file"] = "nova-api-ec2"

default["nova"]["services"]["ec2-public"]["scheme"] = "http"
default["nova"]["services"]["ec2-public"]["network"] = "public"
default["nova"]["services"]["ec2-public"]["port"] = 8773
default["nova"]["services"]["ec2-public"]["path"] = "/services/Cloud"
default["nova"]["services"]["ec2-public"]["cert_file"] = "nova.pem"
default["nova"]["services"]["ec2-public"]["key_file"] = "nova.key"
default["nova"]["services"]["ec2-public"]["wsgi_file"] = "nova-api-ec2"

default["nova"]["services"]["xvpvnc-proxy"]["scheme"] = "http"
default["nova"]["services"]["xvpvnc-proxy"]["network"] = "nova"
default["nova"]["services"]["xvpvnc-proxy"]["port"] = 6081
default["nova"]["services"]["xvpvnc-proxy"]["path"] = "/console"

default["nova"]["services"]["novnc-proxy"]["scheme"] = "http"
default["nova"]["services"]["novnc-proxy"]["network"] = "nova"
default["nova"]["services"]["novnc-proxy"]["port"] = 6080
default["nova"]["services"]["novnc-proxy"]["path"] = "/vnc_auto.html"

default["nova"]["services"]["novnc-server"]["scheme"] = "http"
default["nova"]["services"]["novnc-server"]["network"] = "nova"
default["nova"]["services"]["novnc-server"]["port"] = 6080
default["nova"]["services"]["novnc-server"]["path"] = "/vnc_auto.html"

default["nova"]["services"]["volume"]["scheme"] = "http"
default["nova"]["services"]["volume"]["network"] = "public"
default["nova"]["services"]["volume"]["port"] = 8776
default["nova"]["services"]["volume"]["path"] = "/v1/%(tenant_id)s"
default["nova"]["services"]["volume"]["cinder_catalog_info"] = "volume:cinder:publicURL"

# can this be wedged into the "api" endpoint?
default["nova"]["compute"]["region"] = "RegionOne"
default["nova"]["compute"]["connection_type"] = "libvirt"

default["nova"]["scheduler"]["scheduler_driver"] = "nova.scheduler.filter_scheduler.FilterScheduler"
default["nova"]["scheduler"]["least_cost_functions"] = "nova.scheduler.least_cost.compute_fill_first_cost_fn"
default["nova"]["libvirt"]["virt_type"] = "kvm"
default["nova"]["libvirt"]["vncserver_listen"] = node["ipaddress"]
default["nova"]["libvirt"]["vncserver_proxyclient_address"] = node["ipaddress"]
default["nova"]["libvirt"]["auth_tcp"] = "none"
default["nova"]["libvirt"]["remove_unused_base_images"] = true
default["nova"]["libvirt"]["remove_unused_resized_minimum_age_seconds"] = 3600
default["nova"]["libvirt"]["remove_unused_original_minimum_age_seconds"] = 3600
default["nova"]["libvirt"]["checksum_base_images"] = false
default["nova"]["libvirt"]["libvirt_inject_key"] = false
default["nova"]["libvirt"]["disk_cachemodes"] = "file=none"
default["nova"]["config"]["use_single_default_gateway"] = false
default["nova"]["config"]["availability_zone"] = "nova"
default["nova"]["config"]["default_schedule_zone"] = "nova"
default["nova"]["config"]["force_raw_images"] = false
default["nova"]["config"]["allow_same_net_traffic"] = true
default["nova"]["config"]["osapi_max_limit"] = 1000
default["nova"]["config"]["cpu_allocation_ratio"] = 16.0
default["nova"]["config"]["ram_allocation_ratio"] = 1.5
default["nova"]["config"]["disk_allocation_ratio"] = 1.0
default["nova"]["config"]["snapshot_image_format"] = "qcow2"
default["nova"]["config"]["start_guests_on_host_boot"] = false
default["nova"]["config"]["scheduler_max_attempts"] = 3
default["nova"]["config"]["ec2_workers"] = [8, node["cpu"]["total"].to_i].min
default["nova"]["config"]["osapi_compute_workers"] = [8, node["cpu"]["total"].to_i].min
default["nova"]["config"]["metadata_workers"] = [8, node["cpu"]["total"].to_i].min
default["nova"]["config"]["osapi_volume_workers"] = [8, node["cpu"]["total"].to_i].min
default["nova"]["config"]["hardware_gateway"] = nil
default["nova"]["config"]["dns_servers"] = []
default["nova"]["config"]["dnsmasq_config_file"] = "/etc/nova/dnsmasq-nova.conf"
default["nova"]["config"]["quota_fixed_ips"] = "40"
default["nova"]["config"]["quota_instances"] = "20"
# requires https://review.openstack.org/#/c/8423/
default["nova"]["config"]["resume_guests_state_on_host_boot"] = false
default["nova"]["config"]["force_config_drive"] = false
default['nova']['config']['image_cache_manager_interval'] = 2400

# LOGGING VERBOSITY
# in order of verbosity (most to least)
# DEBUG, INFO, WARNING, ERROR, CRITICAL
default["nova"]["config"]["log_verbosity"] = "INFO"

# quota settings
default["nova"]["config"]["quota_security_groups"] = 50
default["nova"]["config"]["quota_security_group_rules"] = 20

default["nova"]["ratelimit"]["settings"] = {
    "generic-post-limit" => { "verb" => "POST", "uri" => "*", "regex" => ".*", "limit" => "10", "interval" => "MINUTE" },
    "create-servers-limit" => { "verb" => "POST", "uri" => "*/servers", "regex" => "^/servers", "limit" => "50", "interval" => "DAY" },
    "generic-put-limit" => { "verb" => "PUT", "uri" => "*", "regex" => ".*", "limit" => "10", "interval" => "MINUTE" },
    "changes-since-limit" => { "verb" => "GET", "uri" => "*changes-since*", "regex" => ".*changes-since.*", "limit" => "3", "interval" => "MINUTE" },
    "generic-delete-limit" => { "verb" => "DELETE", "uri" => "*", "regex" => ".*", "limit" => "100", "interval" => "MINUTE" }
}
default["nova"]["ratelimit"]["api"]["enabled"] = true
default["nova"]["ratelimit"]["volume"]["enabled"] = true

case platform
when "fedora", "redhat", "centos"
  default["nova"]["platform"] = {
    "api_ec2_packages" => ["openstack-nova-api"],
    "api_ec2_service" => "openstack-nova-api",
    "api_ec2_process_name" => "openstack-nova-api",
    "api_os_compute_packages" => ["openstack-nova-api"],
    "api_os_compute_service" => "openstack-nova-api",
    "api_os_compute_process_name" => "nova-api",
    "api_os_volume_packages" => ["openstack-nova-api"],
    "api_os_volume_service" => "openstack-nova-api",
    "nova_volume_packages" => ["openstack-nova-volume"],
    "nova_volume_service" => "openstack-nova-volume",
    "nova_api_metadata_packages" => ["openstack-nova-api"],
    "nova_api_metadata_process_name" => "nova-api",
    "nova_api_metadata_service" => "openstack-nova-api",
    "nova_compute_packages" => ["openstack-nova-compute", "dnsmasq-utils"],
    "nova_compute_service" => "openstack-nova-compute",
    "nova_scheduler_packages" => ["openstack-nova-scheduler"],
    "nova_scheduler_service" => "openstack-nova-scheduler",
    "nova_conductor_packages" => ["openstack-nova-conductor"],
    "nova_conductor_service" => "openstack-nova-conductor",
    "nova_vncproxy_packages" => ["openstack-nova-novncproxy"],
    "nova_vncproxy_service" => "openstack-nova-novncproxy",
    "nova_vncproxy_consoleauth_packages" => ["openstack-nova-console"],
    "nova_vncproxy_consoleauth_service" => "openstack-nova-consoleauth",
    "nova_vncproxy_consoleauth_process_name" => "nova-consoleauth",
    "libvirt_packages" => ["libvirt"],
    "libvirt_service" => "libvirtd",
    "nova_cert_packages" => ["openstack-nova-cert"],
    "nova_cert_service" => "openstack-nova-cert",
    "mysql_service" => "mysqld",
    "common_packages" => ["openstack-nova-common", "python-cinderclient", "python-keystoneclient"],
    "cinder_multipath_packages" => ["device-mapper-multipath", "sysfsutils", "sg3_utils"],
    "iscsi_helper" => "tgtadm",
    "iscsi_service" => "tgtd",
    "package_overrides" => "",
    "nova_scheduler_default_filters" => [ "AvailabilityZoneFilter",
                                          "RamFilter",
                                          "ComputeFilter",
                                          "CoreFilter",
                                          "SameHostFilter",
                                          "DifferentHostFilter",
                                          "RetryFilter"]
  }
  default["nova"]["ssl"]["dir"] = "/etc/pki/tls"
when "ubuntu"
  default["nova"]["platform"] = {
    "api_ec2_packages" => ["nova-api-ec2"],
    "api_ec2_service" => "nova-api-ec2",
    "api_ec2_process_name" => "nova-api-ec2",
    "api_os_compute_packages" => ["nova-api-os-compute"],
    "api_os_compute_process_name" => "nova-api-os-compute",
    "api_os_compute_service" => "nova-api-os-compute",
    "api_os_volume_packages" => ["nova-api-os-volume"],
    "api_os_volume_service" => "nova-api-os-volume",
    "nova_api_metadata_packages" => ["nova-api-metadata"],
    "nova_api_metadata_service" => "nova-api-metadata",
    "nova_api_metadata_process_name" => "nova-api-metadata",
    "nova_volume_packages" => ["nova-volume", "tgt"],
    "nova_volume_service" => "nova-volume",
    "nova_compute_packages" => ["nova-compute"],
    "nova_compute_service" => "nova-compute",
    "nova_scheduler_packages" => ["nova-scheduler"],
    "nova_scheduler_service" => "nova-scheduler",
    "nova_conductor_packages" => ["nova-conductor"],
    "nova_conductor_service" => "nova-conductor",
    # Websockify is needed due to https://bugs.launchpad.net/ubuntu/+source/nova/+bug/1076442
    "nova_vncproxy_packages" => ["novnc", "websockify", "nova-novncproxy"],
    "nova_vncproxy_service" => "nova-novncproxy",
    "nova_vncproxy_consoleauth_packages" => ["nova-consoleauth"],
    "nova_vncproxy_consoleauth_service" => "nova-consoleauth",
    "nova_vncproxy_consoleauth_process_name" => "nova-consoleauth",
    # README(shep): python-libvirt does not get automatically upgraded
    "libvirt_packages" => ["libvirt-bin", "python-libvirt", "pm-utils"],
    "libvirt_service" => "libvirt-bin",
    "nova_cert_packages" => ["nova-cert"],
    "nova_cert_service" => "nova-cert",
    "mysql_service" => "mysql",
    "common_packages" => ["nova-common", "python-nova",
      "python-novaclient", "python-eventlet"],
    "cinder_multipath_packages" => ["multipath-tools", "sysfsutil", "sg3-utils"],
    "iscsi_helper" => "tgtadm",
    "iscsi_service" => "tgt",
    "package_overrides" => "-o Dpkg::Options::='--force-confold' -o Dpkg::Options::='--force-confdef'",
    "nova_scheduler_default_filters" => [ "AvailabilityZoneFilter",
                                          "RamFilter",
                                          "ComputeFilter",
                                          "CoreFilter",
                                          "SameHostFilter",
                                          "DifferentHostFilter",
                                          "RetryFilter"]
  }
  default["nova"]["ssl"]["dir"] = "/etc/ssl"
end
