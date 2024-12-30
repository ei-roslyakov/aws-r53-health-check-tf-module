## Usage

This module creates Route53 health checks and CloudWatch alarms for the health checks.

```hcl
inputs = {
  checks = {
    "example.com" = {
      fqdn                      = "example.com"
      port                      = 443
      type                      = "HTTPS"
      resource_path             = "/health"
      failure_threshold         = 5
      request_interval          = 30
      evaluation_periods        = 2
      ok_actions                = ["arn"]
      alarm_actions             = ["arn"]
      insufficient_data_actions = ["arn"]
    }

  }
  tags = {
    "Name" = "example"
  }
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.62 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.62 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_route53_health_check.check](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_health_check) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_checks"></a> [checks](#input\_checks) | A map of health checks to create | <pre>map(object({<br/>    fqdn                      = string<br/>    port                      = number<br/>    type                      = string<br/>    resource_path             = string<br/>    failure_threshold         = number<br/>    request_interval          = number<br/>    evaluation_periods        = number<br/>    ok_actions                = list(string)<br/>    alarm_actions             = list(string)<br/>    insufficient_data_actions = list(string)<br/>    tags                      = optional(map(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
