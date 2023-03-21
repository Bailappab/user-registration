module "alb" {
  source  = "terraform-aws-modules/alb/aws"

  name = "my-alb"

  load_balancer_type = "application"
#vpc id need to add (DONE)
  vpc_id             = var.vpc_id
  #subnet id need to add (FACING SOME ISSUE)
  subnets            = var.subnet_id
  #SG id need to add
  security_groups    = ["sg-04564af666442489e"]
/*
  access_logs = {
    bucket = "my-alb-logs"
  }
*/
  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      
    }
  ]
/*
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]
*/
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}