resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name = element(var.folders, count.index )
}

resource "jenkins_job" "s-job" {
  depends_on = [jenkins_folder.folders]

  count = length(var.s-jobs)
  name     = lookup(element(var.s-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.s-jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.s-jobs, count.index), "repo_url", null)
    name = lookup(element(var.s-jobs, count.index), "name", null)
  })

#  lifecycle {
#    ignore_changes = [template]
#  }
}

resource "jenkins_job" "m-job" {
  depends_on = [jenkins_folder.folders]

  count = length(var.m-jobs)
  name     = lookup(element(var.m-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.m-jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/mb-job.xml", {
    repo_url = lookup(element(var.m-jobs, count.index), "repo_url", null)
    name = lookup(element(var.m-jobs, count.index), "name", null)
  })

  #  lifecycle {
  #    ignore_changes = [template]
  #  }
}

data "aws_instance" "jenkins" {
  instance_id = "i-0e8b84b60228d26de"
}

resource "aws_route53_record" "jenkins" {
  zone_id = "Z04634692Z9HUU48HQ5JP"
  name = "jenkins.devopswithbhanu.online"
  type = "A"
  ttl = 30
  records = [data.aws_instance.jenkins.public_ip]
}

