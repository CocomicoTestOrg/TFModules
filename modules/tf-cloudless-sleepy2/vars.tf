# Configure these variables

variable "sample_var" {
  description = "A sample_var to pass to the template."
  default     = "hello from module 2"
}

variable "sleepy_time" {
  description = "How long our local-exec will take a nap."
  default     = 3
}