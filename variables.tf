variable "environment" {
  description = "An environment qualifier for the resources this module creates, to support a Terraform SDLC."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to resources."
  type        = map(string)
  default     = {}
}

variable "datadog_intake_url" {
  description = "Intake url for Datadog to consume Kinesis Firehose messages. For EU Datadog, set to 'https://aws-kinesis-http-intake.logs.datadoghq.eu/v1/input'."
  type        = string
  default     = "https://aws-kinesis-http-intake.logs.datadoghq.com/v1/input"
}

variable "datadog_access_key" {
  description = "Secret used by the Firehose to send logs to Datadog. DO NOT check this into version control."
  type        = string
  sensitive   = true
}

variable "name_prefix" {
  description = "A prefix for the Firehose and dependency names"
  type        = string
  default     = ""
}

variable "retry_duration" {
  description = "Total amount of seconds Firehose spends on retries. This duration starts after the initial attempt fails, and does not include the time periods during which Firehose waits for acknowledgment from the specified destination after each attempt. Valid values are between 0 and 7200."
  type        = number
  default     = 300
}

variable "buffering_size" {
  description = "Buffer incoming data to the specified size, in MBs, before delivering it to the destination."
  type        = number
  default     = 5
}

variable "buffering_interval" {
  description = "Buffer incoming data for the specified period of time, in seconds, before delivering it to the destination."
  type        = number
  default     = 300
}
