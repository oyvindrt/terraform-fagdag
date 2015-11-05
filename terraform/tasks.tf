resource "aws_ecs_task_definition" "my_task_definition" {
  family = "my_task"
  container_definitions = "${file("my_task_definition.json")}"
}