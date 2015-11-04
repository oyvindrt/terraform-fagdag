resource "aws_launch_configuration" "my_launch_config" {
    name = "my_launch_config"
    image_id = "ami-f1b46b82"
    instance_type = "t2.micro"
	iam_instance_profile = "${aws_iam_instance_profile.aws_instance_profile.name}"
	security_groups = ["${aws_security_group.my_security_group.id}"]
    user_data = "#!/bin/bash\necho ECS_CLUSTER=my_cluster >> /etc/ecs/ecs.config"
}