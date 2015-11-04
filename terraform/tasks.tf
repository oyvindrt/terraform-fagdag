resource "aws_ecs_task_definition" "my_task_definition" {
  family = "my"
  container_definitions = "${file("my_task_definition.json")}"
}