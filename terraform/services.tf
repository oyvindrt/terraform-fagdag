resource "aws_ecs_service" "my_service" {
  name = "my_service"
  cluster = "${aws_ecs_cluster.my_cluster.id}"
  task_definition = "${aws_ecs_task_definition.my_task_definition.arn}"
  desired_count = "1"
  iam_role =  "${aws_iam_role.ecs_service_role.name}"

  load_balancer {
    elb_name = "${aws_elb.my_app1_load_balancer.id}"
    container_name = "my_backend"
    container_port = "3000"
  }
}