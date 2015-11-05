resource "aws_elb" "my_app2_load_balancer" {
	name = "my-app2-load-balancer"
	subnets = ["${aws_subnet.my_subnet.id}"]
	
	security_groups = ["${aws_security_group.my_security_group.id}" ]
	
	listener {
		instance_port = 5000
	    instance_protocol = "http"
	    lb_port = 80
	    lb_protocol = "http"
	}
		
	health_check {
	    healthy_threshold = 2
	    unhealthy_threshold = 2
	    timeout = 3
	    target = "HTTP:5000/"
	    interval = 30
	}
	
	idle_timeout = 60
	connection_draining = true
	connection_draining_timeout = 60

}

resource "aws_elb" "my_app1_load_balancer" {
	name = "my-app1-load-balancer"
	subnets = ["${aws_subnet.my_subnet.id}"]
	
	security_groups = ["${aws_security_group.my_security_group.id}" ]
	
	listener {
		instance_port = 3000
	    instance_protocol = "http"
	    lb_port = 80
	    lb_protocol = "http"
	}
		
	health_check {
	    healthy_threshold = 2
	    unhealthy_threshold = 2
	    timeout = 3
	    target = "HTTP:3000/"
	    interval = 30
	}
	
	idle_timeout = 60
	connection_draining = true
	connection_draining_timeout = 60

}