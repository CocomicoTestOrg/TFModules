# Create an arbitrary local resource
data "template_file" "test2" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars {
    sample_var = "${var.sample_var}"
  }
}

resource "null_resource" "module_sleep2" {
  triggers {
    uuid = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}

resource "null_resource" "module_dummy2" {
  triggers {
    uuid = "${uuid()}"
  }
}
