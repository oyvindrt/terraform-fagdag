resource "aws_autoscaling_group" "my_auto_scaling_group" {
  availability_zones = ["eu-west-1a"]
  vpc_zone_identifier = ["${aws_subnet.my_subnet.id}"]
  name = "my_auto_scaling_group"
  min_size = "0"
  max_size = "2"
  desired_capacity = "1"
  health_check_type = "EC2"
  launch_configuration = "${aws_launch_configuration.my_launch_config.id}"
  load_balancers = ["${aws_elb.my_app1_load_balancer.name}","${aws_elb.my_app2_load_balancer.name}"]

  tag {
        key = "Name"
        value =  "my_apps"
        propagate_at_launch = true
    }
}