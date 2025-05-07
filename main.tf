## Label
module "guardduty_label" {
  source      = "git@github.com:3scale-sre/tf-aws-label.git?ref=tags/0.1.2"
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
