resource "aws_route53_health_check" "check" {

  for_each = var.checks

  fqdn              = each.value.fqdn
  port              = each.value.port
  type              = each.value.type
  resource_path     = each.value.resource_path
  failure_threshold = each.value.failure_threshold
  request_interval  = each.value.request_interval


  tags = merge(var.tags, { Name = each.key })
}

resource "aws_cloudwatch_metric_alarm" "alarm" {

  for_each = var.checks

  alarm_name          = each.key
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = "HealthCheckStatus"
  namespace           = "AWS/Route53"
  period              = each.value.request_interval
  statistic           = "Minimum"
  threshold           = each.value.failure_threshold

  alarm_description = "Alarm when health check ${each.key} is unhealthy"

  actions_enabled           = true
  alarm_actions             = each.value.alarm_actions
  insufficient_data_actions = each.value.insufficient_data_actions
  ok_actions                = each.value.ok_actions

  dimensions = {
    HealthCheckId = aws_route53_health_check.check[each.key].id
  }

  tags = merge(var.tags, { Name = each.key })

}
