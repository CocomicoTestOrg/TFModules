# just outputs a sample message, no resources are deployed

module "sleepy_module1" {
  source = "./modules/tf-cloudless-sleepy"
  sleepy_time=1
  sample_var = "${var.var_module1}"
}

module "sleepy_module2" {
  source = "./modules/tf-cloudless-sleepy"
  sleepy_time=2
}

module "sleepy_module3" {
  source = "./modules/tf-cloudless-sleepy"
  sleepy_time=3
}

module "sleepy_module2_1" {
  source = "./modules/tf-cloudless-sleepy2"
  sleepy_time="${var.var_module21_sleepytime}"
  sample_var="Hello from module2 as parameter from root"
}

resource "null_resource" "root_dummy" {
}

/*
data "template_file" "test" {
  template = <<EOT
  Templates found:
  - Template module1_1: ${module.sleepy_module1.rendered_template}
  - Template module1_2: ${module.sleepy_module2.rendered_template}
  - Template module1_3: ${module.sleepy_module3.rendered_template}
  - Template module2_1: ${module.sleepy_module2_1.rendered_template2}

EOT
}
*/

data "template_file" "test" {
  template = <<EOT
  Templates found:
  - Template module1_1: ${module.sleepy_module2_1.rendered_template2}
EOT
}
