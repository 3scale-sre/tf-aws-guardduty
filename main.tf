## Label
module "guardduty_label" {
  source      = "git@github.com:3scale-ops/tf-aws-label.git?ref=tags/0.1.2"
  project     = var.project
  environment = var.environment
  workload    = var.workload
  type        = "guardduty"
  tf_config   = var.tf_config
}

resource "aws_guardduty_detector" "guardduty" {
  enable                       = var.enable
  finding_publishing_frequency = var.finding_publishing_frequency
  tags                         = module.guardduty_label.tags
}

### Cloudwatch
#resource "aws_cloudwatch_event_rule" "guardduty" {
#  name        = module.guardduty_label.id
#  description = "GuardDutyEvent"
#  is_enabled  = var.enable
#  tags        = module.guardduty_label.tags
#
#  event_pattern = <<PATTERN
#{
#  "source": [
#    "aws.guardduty"
#  ],
#  "detail-type": [
#    "GuardDuty Finding"
#  ]
#}
#PATTERN
#}
#
#resource "aws_cloudwatch_event_target" "guardduty" {
#  rule      = aws_cloudwatch_event_rule.this.name
#  target_id = module.guardduty_label.id
#  arn       = aws_sns_topic.guardduty.arn
#  tags      = module.guardduty_label.tags
#}
#
### SNS
#resource "aws_sns_topic" "guardduty" {
#  name = module.guardduty_label.id
#  tags = module.guardduty_label.tags
#}
#
#data "aws_iam_policy_document" "guardduty_cw_sns_policy" {
#  statement {
#    effect = "Allow"
#    principals {
#      type        = "Service"
#      identifiers = ["cloudwatch.amazonaws.com"]
#    }
#    actions   = ["SNS:Publish"]
#    resources = [aws_sns_topic.config.arn]
#  }
#}
#
#resource "aws_sns_topic_policy" "guardduty_cw" {
#  arn    = aws_sns_topic.guardduty.arn
#  policy = data.aws_iam_policy_document.guardduty_cw_sns_policy.json
#}
#
#resource "aws_sns_topic_subscription" "email" {
#  topic_arn = aws_sns_topic.guardduty.arn
#  protocol  = "email"
#  endpoint  = "var.email"
#}