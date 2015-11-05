output "app1_url" {
	value = "${aws_elb.my_app1_load_balancer.dns_name}"
}

output "app2_url" {
	value = "${aws_elb.my_app2_load_balancer.dns_name}"
}