resource "aws_sqs_queue" "main" {
  name = "${terraform.workspace}-updated-resources-sqs"
}

// ${terraform.workspace} = static referene to my workspace name