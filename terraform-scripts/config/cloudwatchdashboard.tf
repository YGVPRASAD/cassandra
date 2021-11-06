resource "aws_cloudwatch_dashboard" "main" {
    dashboard_name = var.app
    dashboard_body = <<EOF
    {
        "widgets": [
            {
                "type":"metric",
                "x":0,
                "y":0,
                "width":12,
                "height":6,
                "properties":{
                    "metrics":[
                        [
                            "AWS/EC2",
                            "CPUUtilization",
                            "AutoScalingGroupName",
                            "asg-${var.tag}-${var.app}-${var.env}"
                        ]
                    ],
                    "period":300,
                    "stat":"Average",
                    "region":"us-east-1",
                    "title":"${var.app}_app_cpu"
                }
            }
        ]
    }
    EOF
}