resource "aws_db_instance" "default" {
  allocated_storage         = 10
  engine                    = "mysql"
  engine_version            = "5.7"
  instance_class            = "db.t2.micro"
  identifier                = "${var.env}-db-instance"
  name                      = "wordpress"
  username                  = "admin"
  password                  = random_password.password.result
  skip_final_snapshot       = var.snapshot                                        #in variables.tf line show: true, which means We don't need to take a snapshot
  final_snapshot_identifier = var.snapshot == true ? null : "${var.env}-snapshot" #null :-----which means get ignored
  publicly_accessible       = var.env == "dev" ? true : false
}

// env = dev
// skip_final_snapshot = true
// final_snapshot_identifier = true == true ? null : "${var.env}-snapshot"

// env = qa
// skip_final_snapshot = false
// final_snapshot_identifier = false == true ? null : "${var.env}-snapshot"
// final_snapshot_identifier = qa-snapshot

// env = prod 
// skip_final_snapshot = false
// final_snapshot_identifier = false == true ? null : "${var.env}-snapshot"
// final_snapshot_identifier  = prod-snapshot

// publicly_accessible = true or false

// when env is dev, publicly_accessible needs to be true
// when env is not dev, publicly_accessible need to false

// dev == dev ? true : false
// > true

// qa == dev ? true : false
// > false