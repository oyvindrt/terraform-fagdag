# Service Role

resource "aws_iam_role_policy" "ecs_service_policy" {
    name = "service_policy"
    role = "${aws_iam_role.ecs_service_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "ec2:Describe*",
        "ec2:AuthorizeSecurityGroupIngress"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role" "ecs_service_role" {
    name = "ecsServiceRole"
    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
          "Service": "ecs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

#Instance Role

resource "aws_iam_role_policy" "ecs_instance_policy" {
    name = "instance_policy"
    role = "${aws_iam_role.ecs_instance_role.id}"
    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
        {
			"Effect": "Allow",
			"Action": [
        		"ecs:CreateCluster",
				"ecs:DeregisterContainerInstance",
				"ecs:DiscoverPollEndpoint",
				"ecs:Poll",
				"ecs:RegisterContainerInstance",
				"ecs:StartTelemetrySession",
				"ecs:Submit*"
			],
            "Resource": [
        		"*"
			]
		}
	]
}
EOF
}

resource "aws_iam_role" "ecs_instance_role" {
	name = "ecsInstanceRole"
	assume_role_policy = <<EOF
{
	"Version": "2008-10-17",
	"Statement": [
		{
			"Sid": "",
			"Effect": "Allow",
			"Principal": {
				"Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
		}
	]
}
EOF
}

resource "aws_iam_instance_profile" "aws_instance_profile" {
    name = "ecsInstanceProfile"
    roles = ["${aws_iam_role.ecs_instance_role.name}"]
}