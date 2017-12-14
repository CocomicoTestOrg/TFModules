module "sleepy_module2_1" {
  source = "../tf-cloudless-sleepy2"
  sleepy_time=5
}

# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars {
    sample_var = "${var.sample_var}"
  }
}

resource "null_resource" "module_sleep" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}

resource "null_resource" "module_dummy" {
  triggers {
    uuid = "${uuid()}"
  }
}
