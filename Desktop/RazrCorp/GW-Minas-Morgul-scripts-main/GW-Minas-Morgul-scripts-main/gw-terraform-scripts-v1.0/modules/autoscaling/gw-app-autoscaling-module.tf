module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.9.0"
  # insert the 1 required variable here
  # Autoscaling group
  name = "example-asg"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  #need to add subnet id
  vpc_zone_identifier       = ["subnet-0efd5496dd8cb0bcd","subnet-060e0a7f5e102f0b2"]
  

/*
  initial_lifecycle_hooks = [
    {
      name                  = "ExampleStartupLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 60
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_LAUNCHING"
      notification_metadata = jsonencode({ "hello" = "world" })
    },
    {
      name                  = "ExampleTerminationLifeCycleHook"
      default_result        = "CONTINUE"
      heartbeat_timeout     = 180
      lifecycle_transition  = "autoscaling:EC2_INSTANCE_TERMINATING"
      notification_metadata = jsonencode({ "goodbye" = "world" })
    }
  ]

  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      checkpoint_delay       = 600
      checkpoint_percentages = [35, 70, 100]
      instance_warmup        = 300
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
  */

  # Launch template
  launch_template_name        = "example-asg"
  launch_template_description = "Launch template example"
  update_default_version      = true
  create                 = true
  create_launch_template = true

  image_id          = var.ami
  instance_type     = var.instance_type
  ebs_optimized     = true
  enable_monitoring = true
  #need to add target group
  target_group_arns = ["arn:aws:elasticloadbalancing:eu-central-1:678120838123:targetgroup/pref-20230320080932524200000002/9933023d53e3c601"]

  # IAM role & instance profile
  create_iam_instance_profile = true
  iam_role_name               = "example-asg"
  iam_role_path               = "/ec2/"
  iam_role_description        = "IAM role example"
  iam_role_tags = {
    CustomIamRole = "Yes"
  }
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  capacity_reservation_specification = {
    capacity_reservation_preference = "open"
  }

  cpu_options = {
    core_count       = 1
    threads_per_core = 1
  }

  credit_specification = {
    cpu_credits = "standard"
  }
/*
  instance_market_options = {
    market_type = 
    spot_options = {
      block_duration_minutes = 60
    }
  }
*/
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 32
  }

  network_interfaces = [
    {
      delete_on_termination = true
      description           = "eth0"
      device_index          = 0
      #need to add SG ID
      security_groups       = ["sg-0e6a5e188fdd29b99"]
      
    },
    {
      delete_on_termination = true
      description           = "eth1"
      device_index          = 1
      #need to add SG ID
      security_groups       = ["sg-0e6a5e188fdd29b99"]
  
    }
  ]

  placement = {
    availability_zone = "eu-central-1a"
  }

  tag_specifications = [
    {
      resource_type = "instance"
      tags          = { WhatAmI = "Instance" }
    },
    {
      resource_type = "volume"
      tags          = { WhatAmI = "Volume" }
    },
    {
      resource_type = "spot-instances-request"
      tags          = { WhatAmI = "SpotInstanceRequest" }
    }
  ]

  tags = {
    Region         = var.aws_region
    Environment    = var.environment
    Name           = "${var.project_name}-${var.environment}-vpc-${var.aws_region}"
    "Project Name" = var.project_name
  }

}